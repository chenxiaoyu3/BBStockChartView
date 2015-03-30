//
//  ViewController.h
//  BBStockChartViewDemo
//
//  Created by ChenXiaoyu on 15/3/26.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBStockChart.h"

@interface ViewController : UIViewController<AxisXLabelProvider>

@property (nonatomic) BBChartView* chartView;
@property (nonatomic) NSArray* chartData;
@end

