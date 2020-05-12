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
#import "Snake.h"
#import "Position.h"
#import "Fruit.h"

static const NSUInteger kSnakeDefaultBodyLength = 10;

static const NSUInteger kFruitDefaultBodyLength = 5;

@interface GameViewController ()

@property (nonatomic, strong) Draw2D *drawView;
@property (nonatomic, assign) SnakeDirection turnDireciton;
@property (nonatomic, assign) SnakeDirection previousDirection;
@property (nonatomic, strong) Position *position;
@property (nonatomic, strong) Snake *snake;
@property (nonatomic, strong) Fruit *fruit;
@property (nonatomic, copy) NSArray *swipeGestureDirectionList;
@property NSTimer *timer;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"GamePage";
    
    [self initDrawView];
    
    [self setupSnakeSwipeGestureRecognizerUp];
    
    [self setupSnakeSwipeGestureRecognizerLeft];
    
    [self setupSnakeSwipeGestureRecognizerDown];
    
    [self setupSnakeSwipeGestureRecognizerRight];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(snakeMove) userInfo:nil repeats:true];
    
}

- (void)initDrawView {
    
    self.drawView = [[Draw2D alloc] init];
        
    [self.view addSubview:self.drawView];
    
    [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.snake.turnDirection = SnakeDirectionLeft;
    
    NSMutableArray<Position *> *mutablePositionList = [[NSMutableArray<Position *> alloc] init];
        
    for (int i = 0; i <= 1; i++) {
        
        self.position = [[Position alloc] init];
        
        if (i == 0) {
            
            self.position.x = self.view.frame.size.width / 2 - kSnakeDefaultBodyLength;
            
            self.position.y = self.view.frame.size.height / 2;
            
        } else {
            
            self.position.x = self.view.frame.size.width / 2;
            
            self.position.y = self.view.frame.size.height / 2;
        }
        
        [mutablePositionList addObject:self.position];
    }
    
    self.snake.positionList = mutablePositionList;
    
    [self randomFruit];
    
    self.drawView.fruit = self.fruit;
    
    self.drawView.lines = self.snake.positionList;
}

- (void)randomFruit {
    
    self.fruit = [[Fruit alloc] init];
    
    self.fruit.x = (arc4random() % (int)self.view.frame.size.width - 10) + 10;
    
    self.fruit.y = (arc4random() % (int)self.view.frame.size.height - 10) + 10;
    
}

- (void)setupSnakeSwipeGestureRecognizerUp {
    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(snakeSwipeGestureHandler:)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.drawView addGestureRecognizer:swipeGestureRecognizer];
    
}

- (void)setupSnakeSwipeGestureRecognizerLeft {
    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(snakeSwipeGestureHandler:)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.drawView addGestureRecognizer:swipeGestureRecognizer];
    
}

- (void)setupSnakeSwipeGestureRecognizerDown {
    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(snakeSwipeGestureHandler:)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.drawView addGestureRecognizer:swipeGestureRecognizer];
    
}

- (void)setupSnakeSwipeGestureRecognizerRight {
    
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(snakeSwipeGestureHandler:)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.drawView addGestureRecognizer:swipeGestureRecognizer];
    
}

- (void)snakeSwipeGestureHandler:(UISwipeGestureRecognizer *)recognizer {
    
    switch (recognizer.direction) {
            
        case UISwipeGestureRecognizerDirectionUp:
            
            self.snake.previousDirection = self.snake.turnDirection;
            
            self.snake.turnDirection = SnakeDirectionTop;
            
            [self snakeMove];
            
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
            
            self.snake.previousDirection = self.snake.turnDirection;
            
            self.snake.turnDirection = SnakeDirectionLeft;
                        
            [self snakeMove];
            
            break;
            
        case UISwipeGestureRecognizerDirectionDown:
            
            self.snake.previousDirection = self.snake.turnDirection;
            
            self.snake.turnDirection = SnakeDirectionBottom;
                        
            [self snakeMove];
            
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            
            self.snake.previousDirection = self.snake.turnDirection;
            
            self.snake.turnDirection = SnakeDirectionRight;
                        
            [self snakeMove];
            
            break;
            
        default:
            break;
    }
}


- (void)snakeMove {
    
    self.drawView.lines = [self.snake moveOneStep];
    
    [self.drawView setNeedsDisplay];
}


- (Snake *)snake {
    if (!_snake) {
        _snake = [[Snake alloc] init];
    }
    return _snake;
}

@end
