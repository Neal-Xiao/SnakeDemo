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
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIGraphicsPushContext(context);
    
    CGContextSetLineWidth(context, 5);
    
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    
    CGPoint points[self.lines.count];
    
    if (!self.lines) {
        
    } else {
                
        for (int i = 0; i <= self.lines.count - 1; i++) {
            
            points[i] = CGPointMake(self.lines[i].x, self.lines[i].y);

        }
        
        CGContextAddLines(context, points, self.lines.count);
        
        CGContextAddRect(context, CGRectMake(self.fruit.x, self.fruit.y, 5, 5));
                
        CGContextStrokePath(context);
    }
    
    UIGraphicsPopContext();
    
}

@end
