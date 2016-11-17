//
//  LCQSuggestLeftModel.m
//  内涵段子
//
//  Created by Leonlincq on 16/11/15.
//  Copyright © 2016年 Leonlin. All rights reserved.
//

#import "LCQSuggestLeftModel.h"

@implementation LCQSuggestLeftModel


-(NSMutableArray *)rightDataArray
{
    if (_rightDataArray == nil)
    {
        _rightDataArray = [[NSMutableArray alloc]init];
    }
    return _rightDataArray;
}


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}


@end
