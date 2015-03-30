//
//  StockSeries.h
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/8.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "Series.h"

@interface StockSeriesPoint : NSObject

@property (nonatomic) CGFloat open, close, low, high;

@end


@interface StockSeries : Series

-(void) addPointOpen:(CGFloat)o close:(CGFloat)c low:(CGFloat)l high:(CGFloat)h;

@end
