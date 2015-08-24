//
//  Area.h
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/5.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseLayer.h"
#import "Series.h"
#import "AxisY.h"
#import "AxisX.h"

@interface Area : BaseLayer

@property (nonatomic, strong) NSMutableArray* theSeries;
@property (nonatomic, strong) AxisY* leftAxis;
@property (nonatomic, strong) AxisY* rightAxis;
@property (nonatomic, strong) AxisX* bottomAxis;

//percentage
@property (nonatomic) CGFloat axisYwidth;
@property (nonatomic) CGFloat axisXheight;
-(void) addSeries:(Series*)series;

-(void) drawAnimated:(BOOL)animated;
-(void) redrawAnimated:(BOOL)animated;

@end
