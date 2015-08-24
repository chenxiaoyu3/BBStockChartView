//
//  Area.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/5.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "Area.h"

@implementation Area
-(instancetype)init{
    self = [super init];
    if (self) {
        _theSeries = [[NSMutableArray alloc] init];
        _leftAxis = [[AxisY alloc] init];
        _rightAxis = [[AxisY alloc] init];
        _bottomAxis = [[AxisX alloc] init];
        
        _axisYwidth = 50;
        _axisXheight = 30;
        [self addSublayer:_leftAxis];
        [self addSublayer:_rightAxis];
        [self addSublayer:_bottomAxis];
    }
    return self;
}

- (void)addSeries:(Series *)series{
    series.position = CGPointZero;
    series.anchorPoint = CGPointZero;
    series.axisAttached = self.leftAxis;
    [self addSublayer:series];
    [self.theSeries addObject:series];
}

-(void)prepareForDraw{
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    // adjust sublayer's size
    
    _leftAxis.bounds = CGRectMake(0, 0, _axisYwidth, height - _axisXheight);
    _leftAxis.anchorPoint = CGPointZero;
    _leftAxis.position = CGPointZero;
    
    _bottomAxis.bounds = CGRectMake(0, 0, width - _axisYwidth, _axisXheight);
    _bottomAxis.anchorPoint = CGPointZero;
    _bottomAxis.position = CGPointMake(_axisYwidth, height - _axisXheight);
    
    NSUInteger maxIdxNum = 0;
    for (Series* s in _theSeries) {
        s.bounds = CGRectMake(0, 0, width - _axisYwidth, height -_axisXheight);
        s.position = CGPointMake( _axisYwidth, 0);
        [s prepareForDraw];
        if (s.data.count > maxIdxNum) {
            maxIdxNum = s.data.count;
        }
    }
    _bottomAxis.idxNum = maxIdxNum;
    
}


- (void)drawAnimated:(BOOL)animated{
    
    for (Series* s in _theSeries) {
        [s drawAnimated:animated];
    }
    // 因为在series draw的时候，才会addContainingVal，所以axis的draw必须在series draw后面进行
    [_leftAxis drawAnimated:animated];
    [_bottomAxis drawAnimated:animated];
    //    [_rightAxis drawAnimated:YES];
}
- (void)redrawAnimated:(BOOL)animated{
    for (Series* s in _theSeries) {
        [s redrawAnimated:animated];
    }
    [_leftAxis redrawAnimated:animated];
    [_bottomAxis redrawAnimated:animated];
}

@end
