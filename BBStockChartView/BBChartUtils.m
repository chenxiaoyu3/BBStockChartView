//
//  BBChartUtils.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/8.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "BBChartUtils.h"

@implementation BBChartUtils

+ (NSUInteger)digitsNumBeforeDot:(CGFloat)val{
    NSUInteger ret = 0;
    while (val >= 1) {
        val /= 10;
        ++ret;
    }
    return ret;
}
//TODO: Y坐标轴，尽量显示整数
+ (CGFloat)nearestRound:(CGFloat)val{
    if (val >= 1 ) {
        
    }
    return 0;
}

+ (CGSize)textBoundsForFont:(NSString *)font andSize:(CGFloat)size text:(NSString *)text{
    CGFloat fontSize = size;
    CGRect r = [text boundingRectWithSize:CGSizeMake(200, 0)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}
                                  context:nil];
    return r.size;
}

@end
