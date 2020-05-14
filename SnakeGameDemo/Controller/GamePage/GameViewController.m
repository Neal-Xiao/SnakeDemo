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
static const NSUInteger kFruitGenerateRandomNumberRange = 20;

@interface GameViewController ()

@property (nonatomic, strong) Draw2D *drawView;
@property (nonatomic, strong) Position *position;
@property (nonatomic, strong) Snake *snake;
@property (nonatomic, strong) Position *fruit;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeGestureRecognizer;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"GamePage";
    [self initDrawView];
    [self addSnakeSwipeGesture];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2
                                                  target:self
                                                selector:@selector(snakeMove)
                                                userInfo:nil
                                                 repeats:true];
}

#pragma mark - initDrawView

- (void)initDrawView {
    self.drawView = [[Draw2D alloc] init];
    [self.view addSubview:self.drawView];
    [self.drawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.snake.turnDirection = SnakeDirectionLeft;
    self.snake.previousDirection = SnakeDirectionLeft;
    self.snake.turnSwipeDirection = UISwipeGestureRecognizerDirectionLeft;
    self.snake.previousSwipeDirection = UISwipeGestureRecognizerDirectionLeft;
    NSMutableArray<Position *> *mutablePositionList = [[NSMutableArray<Position *> alloc] init];
    
    for (int i = 0; i <= 1; i++) {
        self.position = [[Position alloc] init];
        if (i == 0) {
            self.position.x = self.view.frame.size.width / 2 - kSnakeDefaultBodyLength;
            self.position.y = self.view.frame.size.height / 2;
            self.position.x = [self converNumberToTen:self.position.x];
            self.position.y = [self converNumberToTen:self.position.y];
        } else {
            self.position.x = self.view.frame.size.width / 2;
            self.position.y = self.view.frame.size.height / 2;
            self.position.x = [self converNumberToTen:self.position.x];
            self.position.y = [self converNumberToTen:self.position.y];
        }
        [mutablePositionList addObject:self.position];
    }
    
    self.snake.positionList = mutablePositionList;
    [self fruitRandomNumber];
    self.drawView.lines = self.snake.positionList;
}

#pragma mark - FruitRandomNumber

- (void)fruitRandomNumber {
    NSInteger x = kFruitGenerateRandomNumberRange + arc4random() %
    ((int)(self.view.frame.size.width - (kFruitGenerateRandomNumberRange * 2))
     - kFruitGenerateRandomNumberRange + 1);
    NSInteger y = kFruitGenerateRandomNumberRange + arc4random() %
    ((int)(self.view.frame.size.height - (kFruitGenerateRandomNumberRange * 2))
     - kFruitGenerateRandomNumberRange + 1);
    
    self.fruit = [[Position alloc] init];
    x = [self converNumberToTen:x];
    y = [self converNumberToTen:y];
    self.fruit.x = x;
    self.fruit.y = y;
    self.drawView.fruit = self.fruit;
}

#pragma mark - SetupSwipeGesture

- (void)setupSnakeSwipeGestureRecognizer:(UISwipeGestureRecognizerDirection)swipeGestureDireciton {
    self.swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(snakeSwipeGestureHandler:)];
    self.swipeGestureRecognizer.direction = swipeGestureDireciton;
    [self.drawView addGestureRecognizer:self.swipeGestureRecognizer];
}

- (void)addSnakeSwipeGesture {
    [self setupSnakeSwipeGestureRecognizer:UISwipeGestureRecognizerDirectionUp];
    [self setupSnakeSwipeGestureRecognizer:UISwipeGestureRecognizerDirectionLeft];
    [self setupSnakeSwipeGestureRecognizer:UISwipeGestureRecognizerDirectionDown];
    [self setupSnakeSwipeGestureRecognizer:UISwipeGestureRecognizerDirectionRight];
}

- (void)snakeSwipeGestureHandler:(UISwipeGestureRecognizer *)recognizer {
    self.snake.turnSwipeDirection = recognizer.direction;
    if (!self.snake.isCorrectturnDirection) {
        return;
    }
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            self.snake.previousDirection = self.snake.turnDirection;
            self.snake.turnDirection = SnakeDirectionTop;
            self.snake.previousSwipeDirection = self.snake.turnSwipeDirection;
            self.snake.turnSwipeDirection = UISwipeGestureRecognizerDirectionUp;
            [self snakeMove];
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
            self.snake.previousDirection = self.snake.turnDirection;
            self.snake.turnDirection = SnakeDirectionLeft;
            self.snake.previousSwipeDirection = self.snake.turnSwipeDirection;
            self.snake.turnSwipeDirection = UISwipeGestureRecognizerDirectionLeft;
            [self snakeMove];
            break;
            
        case UISwipeGestureRecognizerDirectionDown:
            self.snake.previousDirection = self.snake.turnDirection;
            self.snake.turnDirection = SnakeDirectionBottom;
            self.snake.previousSwipeDirection = self.snake.turnSwipeDirection;
            self.snake.turnSwipeDirection = UISwipeGestureRecognizerDirectionDown;
            [self snakeMove];
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            self.snake.previousDirection = self.snake.turnDirection;
            self.snake.turnDirection = SnakeDirectionRight;
            self.snake.previousSwipeDirection = self.snake.turnSwipeDirection;
            self.snake.turnSwipeDirection = UISwipeGestureRecognizerDirectionRight;
            [self snakeMove];
            break;
            
        default:
            break;
    }
}

- (NSInteger)converNumberToTen:(NSUInteger)number {
    NSInteger resultNumber = 0;
    for (int i = 0; i<=10; i++) {
        if ((number - i) % 10 == 0) {
            resultNumber = i;
            break;
        } else {
            continue;
        }
    }
    number -= resultNumber;
    return number;
}

- (void)addSnakeLengh {
    if ([self.snake.positionList.firstObject isEqual:self.fruit]) {
        [self.snake addLengh];
        [self fruitRandomNumber];
    }
}

- (void)clearObject {
    self.snake = nil;
    self.position = nil;
    self.drawView = nil;
    self.fruit = nil;
    self.timer = nil;
}

- (void)endGame {
    [self.timer invalidate];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GameOver"
                                                                   message:@"Try again or leave"
                                                            preferredStyle:UIAlertControllerStyleAlert
                                ];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:true completion:^{
            [self clearObject];
            [self.navigationController popViewControllerAnimated:true];
        }];
    }];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * _Nonnull action) {
        [self clearObject];
        [self dismissViewControllerAnimated:true
                                 completion:^{
            [self initDrawView];
            [self addSnakeSwipeGesture];
            self.timer = [NSTimer
                          scheduledTimerWithTimeInterval:0.2
                          target:self
                          selector:@selector(snakeMove)
                          userInfo:nil
                          repeats:true
                          ];
        }];
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:true completion:nil];
}

- (void)snakeMove {
    if ([self.snake isTouchBody]) {
        [self endGame];
    }
    if ([self.snake isTouchWallWithX:
         self.view.frame.size.width
        y:self.view.frame.size.height]) {
        [self endGame];
    }
    [self addSnakeLengh];
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
