//
//  BaseLayer.h
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/6.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface BaseLayer : CALayer

//根据自己的bound.size，调整相关 sublayer的bounds, 并调用子layer的同意函数

- (void)prepareForDraw;
- (void)drawAnimated:(BOOL)animated;

+ (CALayer*) layerOfLineFrom:(CGPoint)from to:(CGPoint)to withColor:(UIColor*)color andWidth:(CGFloat)width;

+ (CATextLayer *)layerOfText:(NSString *)text withFont:(NSString*)font fontSize:(CGFloat)fontSize andColor:(UIColor *)color;
@end
