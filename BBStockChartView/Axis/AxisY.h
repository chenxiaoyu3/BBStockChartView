//
//  AxisY.h
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/5.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BaseLayer.h"

@interface AxisY : BaseLayer

@property (nonatomic) CGFloat minVal;
@property (nonatomic) CGFloat maxVal;

@property (nonatomic, readonly) CGFloat designHight;

// For barSeries, the minValue shouldn't touch the bottom
@property (nonatomic) BOOL touchBottom;

-(void)addContainingVal:(CGFloat) val;

-(CGFloat)heighForVal:(CGFloat) val;
-(CGFloat)valForHeigth:(CGFloat) height;

@end
