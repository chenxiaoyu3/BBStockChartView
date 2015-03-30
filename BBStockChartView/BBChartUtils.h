//
//  BBChartUtils.h
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/8.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBChartUtils : NSObject

+(CGFloat) nearestRound:(CGFloat)val;

+(NSUInteger) digitsNumBeforeDot:(CGFloat)val;

+(CGSize) textBoundsForFont:(NSString*)font andSize:(CGFloat)size text:(NSString*)text;
@end
