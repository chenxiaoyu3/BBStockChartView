//
//  StockSeries.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/8.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "StockSeries.h"
#import "BBTheme.h"

@implementation StockSeriesPoint

@end
@implementation StockSeries

- (void)addPointOpen:(CGFloat)o close:(CGFloat)c low:(CGFloat)l high:(CGFloat)h{
    StockSeriesPoint * p = [[StockSeriesPoint alloc] init];
    p.open = o;
    p.close = c;
    p.high = h;
    p.low = l;
    [self.data addObject:p];
}


- (void)prepareForDraw{
    self.axisAttached.touchBottom = YES;
    for (StockSeriesPoint* n in self.data) {
        [self.axisAttached addContainingVal:n.high];
        [self.axisAttached addContainingVal:n.low];
    }
    
}

- (void)drawPoint:(NSUInteger)idx animated:(BOOL)animated{
    if (idx >= self.data.count) {
        return;
    }
    StockSeriesPoint* point = (StockSeriesPoint*)(self.data[idx]);
    UIColor* color = nil;
    if (idx == 0) {
        color = [BBTheme theme].riseColor;
    }else{
        StockSeriesPoint* prePoint = (StockSeriesPoint*)(self.data[idx-1]);
        if (prePoint.open >= point.open) {
            color = [BBTheme theme].riseColor;
        }else{
            color = [BBTheme theme].fallColor;
        }
    }
    CGFloat height = self.bounds.size.height;
//    CGFloat width = self.bounds.size.width;
    
    
    CGFloat x = idx * self.pointWidth + self.pointWidth / 2;
    CGFloat y1 = height - [self.axisAttached heighForVal:point.high];
    CGFloat y2 = height - [self.axisAttached heighForVal:point.low];

    CALayer* lh = [BaseLayer layerOfLineFrom:CGPointZero to:CGPointMake(0, y1-y2+1) withColor:color andWidth:1];
    lh.position = CGPointMake(x, y2);
    
    if (point.open > point.close) {
        y1 = height - [self.axisAttached heighForVal:point.open];
        y2 = height - [self.axisAttached heighForVal:point.close];
    }else{
        y1 = height - [self.axisAttached heighForVal:point.close];
        y2 = height - [self.axisAttached heighForVal:point.open];
    }
    
    CGFloat ocWidth = 8;
    if (self.pointWidth <= ocWidth+2) {
        ocWidth = self.pointWidth - 2;
    }
    CALayer* oc = [BaseLayer layerOfLineFrom:CGPointZero to:CGPointMake(0, y1-y2+1) withColor:color andWidth:ocWidth];
    oc.position = CGPointMake(x, y2);
    
//    NSLog(@"StockPoint val:%.1f, height:%.1f", point.open, y1);
    [self addSublayer:oc];
    [self addSublayer:lh];
    
    if (animated) {
        CABasicAnimation* ani = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        ani.fromValue = [NSNumber numberWithFloat:0];
        ani.toValue = [NSNumber numberWithFloat:1.0];
        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        ani.duration = 1;
        
        [oc addAnimation:ani forKey:nil];
        [lh addAnimation:ani forKey:nil];

    }
    
}

@end
