//
//  Draw2D.m
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/9.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import "Draw2D.h"

@implementation Draw2D

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 5);
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    CGContextMoveToPoint(context, self.snakeCurrentXPosition, self.snakeCurrentYPosition);
    
    CGContextAddLineToPoint(context, self.snakeCurrentXPosition,
                            self.snakeCurrentYPosition);
    
    CGPoint points[] = {
        CGPointMake(0, 0)
    };
        
    CGContextStrokePath(context);
}


@end
