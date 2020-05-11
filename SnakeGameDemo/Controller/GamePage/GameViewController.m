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

@property Draw2D *drawView;
@property DirectionType snackDirectionTYpe;
@property DirectionType previousDirectionType;
@property SnakePosition *snakePosition;
@property SnakeModel *snakeModel;
@property NSTimer *timer;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"GamePage";
    
    [self initDrawView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(snakeMove) userInfo:nil repeats:true];
    
}

- (void)initDrawView {
    
    self.drawView = [[Draw2D alloc] init];
    
    [self.view addSubview:self.drawView];
    
    self.drawView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.snakeModel = [[SnakeModel alloc] init];
    
    self.snakeModel.snakeDirectionType = DirectionTypeTop;
    
    self.snakeModel.previousDirectionType = DirectionTypeLeft;
    
    NSMutableArray<SnakePosition *> *mutablePositionArray = [[NSMutableArray<SnakePosition *> alloc] init];
    
    for (int i = 0; i <= 1; i++) {
        
        self.snakePosition = [[SnakePosition alloc] init];
        
        if (i == 0) {
            
            self.snakePosition.snakeXPosition = self.view.frame.size.width / 2 - 30;
            
            self.snakePosition.snakeYPosition = self.view.frame.size.height / 2;
            
        } else {
            
            self.snakePosition.snakeXPosition = self.view.frame.size.width / 2;
            
            self.snakePosition.snakeYPosition = self.view.frame.size.height / 2;
        }
        
        [mutablePositionArray addObject:self.snakePosition];
    }
        
    self.snakeModel.positionArray = mutablePositionArray;
    
    self.drawView.lines = self.snakeModel.positionArray;
}


- (void)snakeMove {
        
    self.drawView.lines = [self.snakeModel snakeMoveOneStep];
    
    [self.drawView setNeedsDisplay];
}

@end
