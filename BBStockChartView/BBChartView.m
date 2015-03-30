//
//  BBChartView.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/5.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "BBChartView.h"
#import "BarSeries.h"
#import "StockSeries.h"
#import "BBTheme.h"

@implementation BBChartView

- (instancetype)init{
    self = [super init];
    if (self) {
        [self _init];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _init];
    }
    return self;
}

- (void)_init{
    _areas = [[NSMutableArray alloc] init];
    _areaHeights = [[NSMutableArray alloc] init];
}

- (void)setHeighRatio:(CGFloat)heightRatio forArea:(Area *)area{
    if (self.areas.count < 2) {
        return;
    }
    CGFloat thisHeight = self.bounds.size.height * heightRatio;
    CGFloat otherHeight = (self.bounds.size.height - thisHeight) / (self.areas.count-1);
    [self.areas enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Area* cur = obj;
        if (cur == area) {
            self.areaHeights[idx] = [NSNumber numberWithFloat:thisHeight];
        }else{
            self.areaHeights[idx] = [NSNumber numberWithFloat:otherHeight];
        }
    }];
}
- (void)addArea:(Area *)area{
    [_areas addObject:area];
    [self.layer addSublayer:area];
    
    [self.areaHeights removeAllObjects];
    for (int i = 0; i < _areas.count; ++i) {
        [self.areaHeights addObject:[NSNumber numberWithFloat:1.0f/_areas.count*self.bounds.size.height]];
    }
    

}

- (void)prepareForDraw{
    CGFloat width = self.layer.bounds.size.width;
//    CGFloat height = self.layer.bounds.size.height;
    
    CGFloat curY = 0;
    for (int i = 0; i < self.areas.count; ++i) {
        Area* area = self.areas[i];
        CGFloat curHeight = [(NSNumber*)self.areaHeights[i] floatValue];
        area.bounds = CGRectMake(0, 0, width, curHeight);
        area.position = CGPointMake(0, curY);
        area.anchorPoint = CGPointZero;
        [area prepareForDraw];
        curY += curHeight;
    }
    
}
- (void)drawAnimated:(BOOL)animated{
    self.backgroundColor = [BBTheme theme].backgroundColor;
    [self prepareForDraw];
    for (Area* a in self.areas) {
        [a drawAnimated:animated];
    }
//    self.layer.borderWidth = 1;
//    self.layer.borderColor = [BBTheme defTheme].borderColor.CGColor;
}

- (void)reset{
    for (Area* area in self.areas) {
        [area removeFromSuperlayer];
    }
    [self.areas removeAllObjects];
    [self.areaHeights removeAllObjects];
}

@end
