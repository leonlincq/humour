//
//  LCQSuggestLeftModel.h
//  内涵段子
//
//  Created by Leonlincq on 16/11/15.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCQSuggestLeftModel : NSObject

/*?*/
@property (nonatomic,assign) NSInteger count;
/*?*/
@property (nonatomic,assign) NSInteger ID;
/*标签名*/
@property (nonatomic,copy) NSString *name;
/*对应的左侧内容*/
@property (nonatomic,retain) NSMutableArray *rightDataArray;

/*?*/
@property (nonatomic,assign) NSInteger total;
/*?*/
@property (nonatomic,assign) NSInteger total_page;



@end
