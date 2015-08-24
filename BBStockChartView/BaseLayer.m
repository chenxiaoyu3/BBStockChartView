//
//  BaseLayer.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/6.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "BaseLayer.h"
#import <UIKit/UIKit.h>

@implementation BaseLayer

-(void)drawAnimated:(BOOL)animated{
    
}
- (void)redrawAnimated:(BOOL)animated{

}
-(void)prepareForDraw{
    
}

+ (CALayer *)layerOfLineFrom:(CGPoint)from to:(CGPoint)to withColor:(UIColor*)color andWidth:(CGFloat)width{
    CAShapeLayer *line = [CAShapeLayer layer];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint: from];
    [linePath addLineToPoint:to];
    line.path = linePath.CGPath;
    line.fillColor = nil;
    line.opacity = 1.0;
    line.strokeColor = color.CGColor;
    line.lineWidth = width;
    return line;
}
// TODO: when line series is thick, their joint part would leave a small black space, which should be filled
//+ (CALayer *)layerOfConcatLineFrom:(CGPoint)from to:(CGPoint)to withColor:(UIColor*)color andWidth:(CGFloat)width{
//    CAShapeLayer *line = [CAShapeLayer layer];
//    UIBezierPath *linePath = [UIBezierPath bezierPath];
//    [linePath moveToPoint: from];
//    [linePath addLineToPoint:to];
//    line.path = linePath.CGPath;
//    line.fillColor = nil;
//    line.opacity = 1.0;
//    line.strokeColor = color.CGColor;
//    line.lineWidth = width;
//    return line;
//}


+ (CATextLayer *)layerOfText:(NSString *)text withFont:(NSString*)font fontSize:(CGFloat)fontSize andColor:(UIColor *)color{
//    UIFont* f = [UIFont fontWithName:font size:fontSize];
    CATextLayer *ret = [[CATextLayer alloc] init];
    ret.string = text;
    ret.font = (__bridge CFTypeRef)(font);
    ret.fontSize = fontSize;
    ret.foregroundColor = color.CGColor;
    ret.contentsScale = [UIScreen mainScreen].scale;
    return ret;
}
@end
