//
//  BBTheme.h
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/12.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define UIColorFromHex(hex) \
[UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 \
                green:((float)((hex & 0x00FF00) >> 8)) / 255.0 \
                 blue:((float)((hex & 0x0000FF) )) / 255.0 \
                alpha:1.0]


@interface BBTheme : UIColor

@property (nonatomic) UIColor* riseColor;
@property (nonatomic) UIColor* fallColor;

@property (nonatomic) UIColor* barFillColor;
@property (nonatomic) UIColor* barBorderColor;

@property (nonatomic) CGFloat xAxisFontSize;
@property (nonatomic) CGFloat yAxisFontSize;
@property (nonatomic) UIColor* axisColor;

@property (nonatomic) UIColor* backgroundColor;
@property (nonatomic) UIColor* borderColor;

@property (nonatomic) UIColor* defTextColor;
@property (nonatomic) UIColor* defLineColor;
@property (nonatomic) float defLineWidth;
+(BBTheme*) theme;
@end
