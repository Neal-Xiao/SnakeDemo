//
//  GameViewController.m
//  SnakeGameDemo
//
//  Created by Neal Xiao on 2020/5/8.
//  Copyright © 2020 NealXiao. All rights reserved.
//

#import "GameViewController.h"
#import "Draw2D.h"
#import <Masonry.h>
#import "SnakeModel.h"
#import "SnakePosition.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"GamePage";
    
    [self draw2DView];
}

-(void)draw2DView {
    
    Draw2D *drawView = [[Draw2D alloc] init];
    
    [self.view addSubview:drawView];
    
    drawView.translatesAutoresizingMaskIntoConstraints = false;
    
    [drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    SnakeModel *snakeModel = [[SnakeModel alloc] init];
    
    NSArray *snakePositionArray = snakeModel.positionArray;
    
    NSMutableArray<SnakePosition *> *positionArray = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= 3; i++) {
        
        SnakePosition *position = [[SnakePosition alloc] init];
        
        position.snakeXPosition = 100 * i;
        
        position.snakeYPosition = 100 * i;
        
        [positionArray addObject:position];
    }
    
    snakePositionArray = positionArray;
    
    drawView.lines = [[NSArray<SnakePosition *> alloc] init];
    
    drawView.lines = snakePositionArray;
}

@end
