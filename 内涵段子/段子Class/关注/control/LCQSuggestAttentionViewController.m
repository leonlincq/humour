//
//  LCQSuggestAttentionViewController.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/15.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQSuggestAttentionViewController.h"

#import "LCQSuggestLeftTableViewCell.h"
#import "LCQSuggestLeftModel.h"

#import "LCQSuggestRightTableViewCell.h"
#import "LCQSuggestRightModel.h"

@interface LCQSuggestAttentionViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@property (nonatomic,strong) NSArray *leftModelArray;

@property (nonatomic,strong) NSDictionary *saveRequestDic;
@end

static NSString *leftCellID = @"leftCellID";
static NSString *rightCellID = @"rightCellID";

@implementation LCQSuggestAttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"推荐关注";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self loadLeftAttentionData];

    [SVProgressHUD showWithStatus:@"请求中..."];
    
    [_leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LCQSuggestLeftTableViewCell class]) bundle:nil] forCellReuseIdentifier:leftCellID];
    _leftTableView.backgroundColor = ALLVIEWBGCOLOR;
    [_rightTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LCQSuggestRightTableViewCell class]) bundle:nil] forCellReuseIdentifier:rightCellID];
    _rightTableView.backgroundColor = ALLVIEWBGCOLOR;
    _rightTableView.rowHeight = 80;

    
    self.rightTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadRightAttentionData)];
    
    self.rightTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreRightAttentionData)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 网络加载
-(void)loadLeftAttentionData
{
    [[AFHTTPSessionManager manager] GET:REQUESTURL parameters:@{@"a":@"category",@"c":@"subscribe"} progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"responseObject = %@",responseObject);
//        [SVProgressHUD showSuccessWithStatus:@"加载成功"];
        [SVProgressHUD dismiss];
        
        
        self.leftModelArray = [LCQSuggestLeftModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"list"]];
        
        [self.leftTableView reloadData];
        
        [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];

        [self.rightTableView.mj_header beginRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];

}

-(void)loadRightAttentionData
{
    LCQSuggestLeftModel *selectLeftModel = [self currenSelectLeftModel];
    
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc]init];
    requestDic[@"a"] = @"list";
    requestDic[@"c"] = @"subscribe";
    requestDic[@"category_id"] = [NSString stringWithFormat:@"%ld",selectLeftModel.ID];
    requestDic[@"page"] = @(1);
    
    _saveRequestDic = requestDic;
    
    [[AFHTTPSessionManager manager] GET:REQUESTURL parameters:requestDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
        if (self.saveRequestDic != requestDic)
        {
            return ;
        }
        
        selectLeftModel.total = [[responseObject objectForKey:@"total"]intValue];
        selectLeftModel.total_page = 1;
        
        selectLeftModel.rightDataArray = [NSMutableArray arrayWithArray:[LCQSuggestRightModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"list"]]];
        
        [self.rightTableView reloadData];
        
        [self.rightTableView.mj_header endRefreshing];
        
        [self loadFootAdapt];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];

}

-(void)loadMoreRightAttentionData
{
    LCQSuggestLeftModel *selectLeftModel = [self currenSelectLeftModel];
    
    NSLog(@"取出来的地址 = %p,数组里的地址 = %p",selectLeftModel,self.leftModelArray[self.leftTableView.indexPathForSelectedRow.row]);
    
    
    NSMutableDictionary *requestDic = [[NSMutableDictionary alloc]init];
    
    requestDic[@"a"] = @"list";
    requestDic[@"c"] = @"subscribe";
    requestDic[@"category_id"] = [NSString stringWithFormat:@"%ld",selectLeftModel.ID];
    requestDic[@"page"] = @(++selectLeftModel.total_page);

    self.saveRequestDic = requestDic;
    
    [[AFHTTPSessionManager manager] GET:REQUESTURL parameters:requestDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
        if (self.saveRequestDic != requestDic)
        {
            return ;
        }

        NSArray *tempModelArray = [LCQSuggestRightModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"list"]];
        
        [selectLeftModel.rightDataArray addObjectsFromArray:tempModelArray];
        
        [self.rightTableView reloadData];
        [self loadFootAdapt];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];

}

-(void)loadFootAdapt
{
    if (self.currenSelectLeftModel.total == self.currenSelectLeftModel.rightDataArray.count)
    {
        [self.rightTableView.mj_footer endRefreshingWithNoMoreData];
        self.rightTableView.mj_footer.hidden = YES;
    }
    else
    {
        [self.rightTableView.mj_footer endRefreshing];
        self.rightTableView.mj_footer.hidden = NO;
    }
}


#pragma mark - CELL委托代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTableView)
    {
        return self.leftModelArray.count;
    }
    else
    {
        return self.currenSelectLeftModel.rightDataArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView)
    {
        LCQSuggestLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftCellID];
        
        cell.model = self.leftModelArray[indexPath.row];
        
        return cell;
    }
    else
    {
        LCQSuggestRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightCellID];
        
        cell.model = self.currenSelectLeftModel.rightDataArray[indexPath.row];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView)
    {

        if(self.currenSelectLeftModel.rightDataArray.count != 0)
        {
            [self.rightTableView reloadData];
        }
        else
        {
            [self.rightTableView reloadData];

            [self loadRightAttentionData];
        }
    }

}

-(LCQSuggestLeftModel *)currenSelectLeftModel
{
    NSInteger selectLeftRow = self.leftTableView.indexPathForSelectedRow.row;
    LCQSuggestLeftModel *selectLeftModel = self.leftModelArray[selectLeftRow];
    
    return selectLeftModel;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
