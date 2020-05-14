//
//  SnakeModel.h
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/10.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameViewController.h"
#import "Position.h"

NS_ASSUME_NONNULL_BEGIN

@interface Snake : NSObject

@property (nonatomic, copy) NSArray<Position *> *positionList;
@property (nonatomic, assign) SnakeDirection turnDirection;
@property (nonatomic, assign) SnakeDirection previousDirection;
@property (nonatomic, assign) UISwipeGestureRecognizerDirection previousSwipeDirection;
@property (nonatomic, assign) UISwipeGestureRecognizerDirection turnSwipeDirection;

- (NSArray *)moveOneStep;
- (NSArray *)addLengh;
- (BOOL)isTouchBody;
- (BOOL)isTouchWallWithX:(NSInteger)x y:(NSInteger)y;
- (BOOL)isCorrectturnDirection;
@end

NS_ASSUME_NONNULL_END
