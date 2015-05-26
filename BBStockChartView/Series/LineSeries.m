//
//  LineSeries.m
//  BBStockChartViewDemo
//
//  Created by ChenXiaoyu on 15/5/26.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "LineSeries.h"
#import "BBTheme.h"
@implementation LineSeries

-(instancetype)init{
    self = [super init];
    if (self) {
        self.width = [BBTheme theme].defLineWidth;
        self.color = [BBTheme theme].defLineColor;
    }
    return self;
}


- (void)addPoint:(float)p{
    [super.data addObject:[NSNumber numberWithFloat:p]];
}

- (void)drawPoint:(NSUInteger)idx animated:(BOOL)animated{
    if (idx == 0 || idx >= self.data.count) {
        return;
    }
    CGFloat height = self.bounds.size.height;
    float y1 = height - [self.axisAttached heighForVal:((NSNumber*)self.data[idx-1]).floatValue];
    float y2 = height - [self.axisAttached heighForVal:((NSNumber*)self.data[idx]).floatValue];
    CALayer* line = [BaseLayer layerOfLineFrom:CGPointMake((idx-1)*self.pointWidth, y1) to:CGPointMake(idx*self.pointWidth, y2) withColor:self.color andWidth:self.width];

    
    [self addSublayer:line];
}

- (void)prepareForDraw{
    self.axisAttached.touchBottom = YES;
    for (NSNumber* n in self.data) {
        [self.axisAttached addContainingVal:n.floatValue];
    }
    
}
@end
