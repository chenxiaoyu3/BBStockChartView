//
//  AxisX.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/8.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "AxisX.h"
#import "BBTheme.h"
#import "BBChartUtils.h"

@implementation AxisX

- (void)drawAnimated:(BOOL)animated{
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    CALayer* line = [BaseLayer layerOfLineFrom:CGPointZero to:CGPointMake(width+2, 0) withColor:[BBTheme theme].axisColor andWidth:1];
    line.position = CGPointMake(-2, 1);
    line.anchorPoint = CGPointZero;
    [self addSublayer:line];
    
    CGFloat idxWidth = width / self.idxNum;
    NSUInteger maxLabelNum = width / 10;
    NSUInteger step = 1;
    CGFloat labelWidth = idxWidth;
    if (self.idxNum > maxLabelNum) {
        step = self.idxNum / maxLabelNum + 1;
        labelWidth = width / maxLabelNum;
    }

    for(int i = 0; i < self.idxNum; i += 1){
        NSString* text = nil;
        if (self.labelProvider) {
            text = [self.labelProvider textForIdx:i];
        }else{
            text = [NSString stringWithFormat:@"%d", i+1];
        }
        if (text && text.length > 0) {
//            NSLog(@"Draw x: %d", i);
            CATextLayer* label = [BaseLayer layerOfText:text withFont:@"HelveticaNeue" fontSize:[BBTheme theme].xAxisFontSize andColor:[BBTheme theme].axisColor];
            CGFloat w = [BBChartUtils textBoundsForFont:text andSize:[BBTheme theme].xAxisFontSize text:text].width;
            if (i == self.idxNum-1 || idxWidth*i+idxWidth/2+w > width) {
                label.alignmentMode = kCAAlignmentRight;
                label.bounds = CGRectMake(0, 0, w, height-3);
                label.anchorPoint = CGPointMake(1, 0);
            }else{
                label.alignmentMode = kCAAlignmentCenter;
                label.bounds = CGRectMake(0, 0, w, height-3);
                label.anchorPoint = CGPointMake(0.5, 0);
            }
            label.position = CGPointMake(idxWidth*i + idxWidth /2 , 5);
            [self addSublayer:label];
            
            
            CALayer* dash = [BaseLayer layerOfLineFrom:CGPointMake(idxWidth/2, 0) to:CGPointMake(idxWidth/2, 5) withColor:[BBTheme theme].axisColor andWidth:1];
            dash.anchorPoint = CGPointZero;
            dash.position = CGPointMake(idxWidth*i, 1);
            [self addSublayer:dash];
        }
    }
}

- (void)redrawAnimated:(BOOL)animated{
    self.sublayers = nil;
    [self drawAnimated:animated];
}
@end
