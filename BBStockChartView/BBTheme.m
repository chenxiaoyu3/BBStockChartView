//
//  BBTheme.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/12.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "BBTheme.h"

BBTheme* _defTheme = nil;
@implementation BBTheme

- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}

+(BBTheme *)theme{
    if (!_defTheme) {
        _defTheme = [[BBTheme alloc] init];
        _defTheme.riseColor = [UIColor greenColor];
        _defTheme.fallColor = [UIColor redColor];
        _defTheme.barFillColor = [UIColor greenColor];
        _defTheme.barBorderColor = [UIColor clearColor];
        _defTheme.xAxisFontSize = 10;
        _defTheme.yAxisFontSize = 10;
        _defTheme.backgroundColor = [UIColor blackColor];
        _defTheme.axisColor = [UIColor whiteColor];
        _defTheme.borderColor = [UIColor grayColor];
        _defTheme.defTextColor = [UIColor whiteColor];
        _defTheme.defLineColor = [UIColor whiteColor];
        _defTheme.defLineWidth = 1;
    }
    return _defTheme;
}
@end
