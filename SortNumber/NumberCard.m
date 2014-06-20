//
//  NumberCard.m
//  SortNumber
//
//  Created by Dylan Bui on 6/19/14.
//  Copyright (c) 2014 Dylan Bui. All rights reserved.
//

#import "NumberCard.h"

@interface NumberCard () <UIGestureRecognizerDelegate>
{


}



@end

@implementation NumberCard


@synthesize lblNum;
@synthesize noneValue;
@synthesize number;
@synthesize delegate;
@synthesize row, column;

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        number = 0 ;
        lblNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [lblNum setText:[NSString stringWithFormat:@"%d", number]];
        
        [lblNum setTextAlignment:NSTextAlignmentCenter];
        
        // Initialization code
        [self addSubview:lblNum];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame withNumber:(int)num
{
    self = [self initWithFrame:frame];
    if (self)
    {
        number = num;
        // Initialization code
        [lblNum setText:[NSString stringWithFormat:@"%d", num]];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
//    NSLog(@"LOG VAL : %d", number); /* DEBUG LOG */
    if (number % 2 == 0) {
        [lblNum setBackgroundColor:[UIColor grayColor]];
    } else {
        [lblNum setBackgroundColor:[UIColor blueColor]];
    }
    
    
    // Drawing code
    
    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(handleGesture:)];
    [recognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                          action:@selector(handleGesture:)];
    [recognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    
    UISwipeGestureRecognizer *recognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(handleGesture:)];
    [recognizerUp setDirection:UISwipeGestureRecognizerDirectionUp];
    
    UISwipeGestureRecognizer *recognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                         action:@selector(handleGesture:)];
    [recognizerDown setDirection:UISwipeGestureRecognizerDirectionDown];
    
    [self addGestureRecognizer:recognizerLeft];
    [self addGestureRecognizer:recognizerRight];
    
    [self addGestureRecognizer:recognizerUp];
    [self addGestureRecognizer:recognizerDown];
    
}

- (void)handleGesture:(UISwipeGestureRecognizer*)gestureRecognizer
{
    [delegate numberCard:self swipeGestureRecognizer:gestureRecognizer];
    
//    NSLog(@"LOG VAL : %@", @"vao day roi"); /* DEBUG LOG */
//    
//    if ([gestureRecognizer direction] == UISwipeGestureRecognizerDirectionLeft)
//    {
//        NSLog(@"LOG VAL : %@", @"LEFT"); /* DEBUG LOG */
//    }else if ([gestureRecognizer direction] == UISwipeGestureRecognizerDirectionRight){
//        NSLog(@"LOG VAL : %@", @"RIGHT"); /* DEBUG LOG */
//    }else if ([gestureRecognizer direction] == UISwipeGestureRecognizerDirectionUp){
//        NSLog(@"LOG VAL : %@", @"UP"); /* DEBUG LOG */
//    }else if ([gestureRecognizer direction] == UISwipeGestureRecognizerDirectionDown){
//        NSLog(@"LOG VAL : %@", @"DOWN"); /* DEBUG LOG */
//        //Swipe from left to right
//        //Do your functions here
//    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Card = %d, ROW = %d ; COLUMN = %d", number, row, column];
}

@end
