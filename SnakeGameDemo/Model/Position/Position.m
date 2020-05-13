//
//  SnakePosition.m
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/10.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import "Position.h"

@implementation Position

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    } else if ([other isKindOfClass:[self class]]) {
        
        Position *position = (Position *)other;
        if (self.x == position.x && self.y == position.y) {
            return YES;
        } else {
            return NO;
        }
        
    } else {
        return NO;
    }
}

- (NSUInteger)hash
{
    return [self hash];
}

@end
