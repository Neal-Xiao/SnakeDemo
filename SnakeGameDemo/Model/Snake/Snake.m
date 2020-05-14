//
//  SnakeModel.m
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/10.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import "Snake.h"

static const NSUInteger kMoveDistance = 10;

@interface Snake()

@property (nonatomic, assign) NSInteger firstPoint;
@property (nonatomic, strong) NSMutableArray<Position *> *snakeLenghList;

- (BOOL)isVerticalDirection:(UISwipeGestureRecognizerDirection)direciton;
- (BOOL)isHorizontalDireciton:(UISwipeGestureRecognizerDirection)direciton;

@end

@implementation Snake

#pragma mark - moveOneStep
- (NSArray<Position *> *)moveOneStep {
    
    switch (self.turnDirection) {
        case SnakeDirectionTop:
            for (int i = 0; i <= self.positionList.count - 1; i++) {
                
                if (i == 0) {
                    self.firstPoint = self.positionList[i].x;
                    self.positionList[i].y -= kMoveDistance;
                    
                } else {
                    if (self.positionList[i].x != self.firstPoint) {
                        switch (self.previousDirection) {
                            case SnakeDirectionLeft:
                                self.positionList[i].x -= kMoveDistance;
                                break;
                                
                            case SnakeDirectionRight:
                                self.positionList[i].x += kMoveDistance;
                            default:
                                break;
                                
                        }
                    } else {
                        self.positionList[i].y -= kMoveDistance;
                    }
                }
            }
            break;
            
        case SnakeDirectionLeft:
            for (int i = 0; i <= self.positionList.count - 1; i++) {
                if (i == 0) {
                    self.firstPoint = self.positionList[i].y;
                    self.positionList[i].x -= kMoveDistance;
                } else {
                    if (self.positionList[i].y != self.firstPoint) {
                        switch (self.previousDirection) {
                            case SnakeDirectionTop:
                                self.positionList[i].y -= kMoveDistance;
                                break;
                                
                            case SnakeDirectionBottom:
                                self.positionList[i].y += kMoveDistance;
                            default:
                                break;
                                
                        }
                    } else {
                        self.positionList[i].x -= kMoveDistance;
                    }
                }
            }
            break;
            
        case SnakeDirectionBottom:
            for (int i = 0; i <= self.positionList.count - 1; i++) {
                if (i == 0) {
                    self.firstPoint = self.positionList[i].x;
                    self.positionList[i].y += kMoveDistance;
                } else {
                    if (self.positionList[i].x != self.firstPoint) {
                        switch (self.previousDirection) {
                            case SnakeDirectionLeft:
                                self.positionList[i].x -= kMoveDistance;
                                break;
                                
                            case SnakeDirectionRight:
                                self.positionList[i].x += kMoveDistance;
                            default:
                                break;
                        }
                    } else {
                        self.positionList[i].y += kMoveDistance;
                    }
                }
            }
            break;
            
        case SnakeDirectionRight:
            for (int i = 0; i <= self.positionList.count - 1; i++) {
                if (i == 0) {
                    self.firstPoint = self.positionList[i].y;
                    self.positionList[i].x += kMoveDistance;
                } else {
                    if (self.positionList[i].y != self.firstPoint) {
                        switch (self.previousDirection) {
                            case SnakeDirectionTop:
                                self.positionList[i].y -= kMoveDistance;
                                break;
                                
                            case SnakeDirectionBottom:
                                self.positionList[i].y += kMoveDistance;
                            default:
                                break;
                        }
                    } else {
                        self.positionList[i].x += kMoveDistance;
                    }
                }
            }
            break;
            
        default:
            break;
    }    
    return self.positionList;
}

#pragma mark - AddLegn

- (NSArray *)addLengh {
    
    self.snakeLenghList = [NSMutableArray array];
    Position *lastPosition = [[Position alloc] init];
    switch (self.turnDirection) {
            
        case SnakeDirectionTop:
            [self.snakeLenghList addObjectsFromArray:self.positionList];
            lastPosition.x = self.snakeLenghList.lastObject.x;
            lastPosition.y = self.snakeLenghList.lastObject.y + 10;
            [self.snakeLenghList addObject:lastPosition];
            self.positionList = self.snakeLenghList;
            break;
            
        case SnakeDirectionLeft:
            [self.snakeLenghList addObjectsFromArray:self.positionList];
            lastPosition.y = self.snakeLenghList.lastObject.y;
            lastPosition.x = self.snakeLenghList.lastObject.x + 10;
            [self.snakeLenghList addObject:lastPosition];
            self.positionList = self.snakeLenghList;
            break;
            
        case SnakeDirectionBottom:
            [self.snakeLenghList addObjectsFromArray:self.positionList];
            lastPosition.y = self.snakeLenghList.lastObject.y - 10;
            lastPosition.x = self.snakeLenghList.lastObject.x;
            [self.snakeLenghList addObject:lastPosition];
            self.positionList = self.snakeLenghList;
            break;
            
        case SnakeDirectionRight:
            [self.snakeLenghList addObjectsFromArray:self.positionList];
            lastPosition.y = self.snakeLenghList.lastObject.y;
            lastPosition.x = self.snakeLenghList.lastObject.x - 10;
            [self.snakeLenghList addObject:lastPosition];
            self.positionList = self.snakeLenghList;
            break;
            
        default:
            break;
    }
    return self.positionList;
}

- (BOOL)isTouchBody {

    for (int i = 1; i <= self.positionList.count - 1; i++) {
        if ([self.positionList.firstObject isEqual:self.positionList[i]]) {
            return true;
        }
    }
    return false;
}

- (BOOL)isTouchWallWithX:(NSInteger)x y:(NSInteger)y {
    
    if (self.positionList.firstObject.x >= x || self.positionList.firstObject.x <=0) {
        
        return true;
    }
    
    if (self.positionList.firstObject.y >= y || self.positionList.firstObject.y <=0) {
        
        return true;
    }
    
    return false;
}

- (BOOL)isCorrectturnDirection{
    if (([self isVerticalDirection:self.previousSwipeDirection] &&
         [self isVerticalDirection:self.turnSwipeDirection]) ||
        ([self isHorizontalDireciton:self.previousSwipeDirection] &&
         [self isHorizontalDireciton:self.turnSwipeDirection])) {
        return false;
    }
    return true;
}

- (BOOL)isVerticalDirection:(UISwipeGestureRecognizerDirection)direction {
    
    if (direction == UISwipeGestureRecognizerDirectionUp ||
        direction == UISwipeGestureRecognizerDirectionDown) {
        return true;
    }
    return false;
}

- (BOOL)isHorizontalDireciton:(UISwipeGestureRecognizerDirection)direction {
    
    if (direction == UISwipeGestureRecognizerDirectionRight ||
        direction == UISwipeGestureRecognizerDirectionLeft) {
        return true;
    }
    return false;
}
@end
