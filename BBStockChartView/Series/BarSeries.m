//
//  BarSeries.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/5.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "BarSeries.h"
#import "BBTheme.h"

@implementation BarSeries

-(instancetype)init{
    self = [super init];
    if (self) {

    }
    return self;
}
- (void)addPoint:(float)p{
    [super.data addObject:[NSNumber numberWithFloat:p]];
}

- (void)drawPoint:(NSUInteger)idx animated:(BOOL)animated{
    if (idx >= self.data.count) {
        return;
    }
    CALayer* l = [[CALayer alloc] init];
    l.backgroundColor = [BBTheme theme].barFillColor.CGColor;
    l.borderColor = [BBTheme theme].barBorderColor.CGColor;
    l.borderWidth = 1;
    l.anchorPoint = CGPointMake(0, 1);
    CGFloat h =[self.axisAttached heighForVal:((NSNumber*)self.data[idx]).floatValue];
//    NSLog(@"draw val:%.1f atH:%f",((NSNumber*)self.data[idx]).floatValue, h);
    l.bounds = CGRectMake(0, 0, self.pointWidth-2, h);
    l.position = CGPointMake(idx * self.pointWidth, self.bounds.size.height);
    [self addSublayer:l];
    
    if (animated) {
        CABasicAnimation* ani = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
        ani.fromValue = [NSNumber numberWithFloat:0];
        ani.toValue = [NSNumber numberWithFloat:1.0];
        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        ani.duration = 1;
        [l addAnimation:ani forKey:nil];

    }
//    NSLog(@"Bar draw point:%d", idx);
    
}

- (void)prepareForDraw{
    self.axisAttached.touchBottom = NO;
    for (NSNumber* n in self.data) {
        [self.axisAttached addContainingVal:n.floatValue];
    }
    
}

//- (void)drawAnimated:(BOOL)animated{
//    
//    for (int i = 0; i < self.data.count; ++i) {
//        [self drawPoint:i animated:animated];
//    }
//}
//
//- (void)redrawAnimated:(BOOL)animated{
//    self.sublayers = nil;
//    [self drawAnimated:animated];
//}


@end
