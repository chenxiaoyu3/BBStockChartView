//
//  Series.m
//  BBChart
//
//  Created by ChenXiaoyu on 15/1/5.
//  Copyright (c) 2015年 ChenXiaoyu. All rights reserved.
//

#import "Series.h"

@implementation Series

- (instancetype)init{
    self = [super init];
    if (self) {
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}
-(void)drawPoint:(NSUInteger)idx animated:(BOOL)animated{
    
}


- (void)drawAnimated:(BOOL)animated{
    
}

-(float)pointWidth{
    CGFloat w = self.bounds.size.width;
    if ( _data.count == 0) {
        return w;
    }
    return w / _data.count;

}
@end
