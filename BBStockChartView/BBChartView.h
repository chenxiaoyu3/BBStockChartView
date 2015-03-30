//
//  BBChartView.h
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/5.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Area/Area.h"
@interface BBChartView : UIView

@property (nonatomic, strong) NSMutableArray* areas;
@property (nonatomic, strong) NSMutableArray* areaHeights;

-(void)setHeighRatio:(CGFloat)heightRatio forArea:(Area*)area;
-(void)addArea:(Area *)area;

-(void)drawAnimated:(BOOL)animated;
-(void)reset;
@end
