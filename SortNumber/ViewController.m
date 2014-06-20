//
//  ViewController.m
//  SortNumber
//
//  Created by Dylan Bui on 6/19/14.
//  Copyright (c) 2014 Dylan Bui. All rights reserved.
//

// http://i-gorod.org/itblog/2012/08/15/objective-c-swipe-left-right-up-down/

#import "ViewController.h"

#import "NumberCard.h"
#import "TwoDArray.h"

#define TOTAL_COL 6
#define TOTAL_ROW 9



@interface ViewController () <UIGestureRecognizerDelegate, NumberCardDelegate> {
    
    int chessboard[TOTAL_ROW][TOTAL_COL];
    
    NSMutableArray* arrCardNumber;
    
    NumberCard* noneCard;
    
    TwoDArray* dArrChessBoard;
}


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dArrChessBoard = [[TwoDArray alloc] initWithRows:TOTAL_ROW columns:TOTAL_COL];
    
    float w = 50;
    float h = 50;
    
    float padding_left = 3;
    float padding_top = 3;
    float margin_top = 60;
    
//    float dong = 9;
//    float cot = 6;
    
    arrCardNumber = [[NSMutableArray alloc] init];
    
    int number = 0;
    for (int dong = 0; dong < TOTAL_ROW; dong++)
    {
        float y = margin_top + (padding_top + h) * dong + padding_top;
        for (int cot = 0; cot < TOTAL_COL; cot++)
        {
            float x = (padding_left + w) * cot + padding_left;
            CGRect frame = CGRectMake(x, y, w, h);

//            NSLog(@"LOG VAL : %@", NSStringFromCGRect(frame)); /* DEBUG LOG */
            if (dong == 0 && cot == 0)
            {
                chessboard[dong][cot] = 0;
                
                noneCard = [[NumberCard alloc] initWithFrame:frame withNumber:0];
                noneCard.row = dong;
                noneCard.column = cot;
                noneCard.noneValue = 0;
                [arrCardNumber addObject:noneCard];
                
                [dArrChessBoard insertObject:noneCard atRow:dong column:cot];
                
            } else
            {
                chessboard[dong][cot] = 1;
                
                NumberCard* card = [[NumberCard alloc] initWithFrame:frame withNumber:number];
                card.row = dong;
                card.column = cot;
                card.delegate = self;
                card.noneValue = 1;
                
                [arrCardNumber addObject:card];
                
                [dArrChessBoard insertObject:card atRow:dong column:cot];
                
                [self.view addSubview:card];
            
//            UILabel* v = [[UILabel alloc] initWithFrame:frame];
//            [v setBackgroundColor:[UIColor grayColor]];
//            [v setText:[NSString stringWithFormat:@"%d",number]];
//            [self.view addSubview:v];
            }
            number++;
            
        }
            
    }
    
    [self debug2Darray];
    
//    UISwipeGestureRecognizer *swipeLeftRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
//    [swipeLeftRight setDirection:(UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft
//                                  | UISwipeGestureRecognizerDirectionUp
//                                  | UISwipeGestureRecognizerDirectionDown)];
//    [self.view addGestureRecognizer:swipeLeftRight];
    
//    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self
//                                                                                     action:@selector(handleGesture:)];
//    [recognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
//    
//    UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self
//                                                                                     action:@selector(handleGesture:)];
//    [recognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
//    
//    
//    UISwipeGestureRecognizer *recognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self
//                                                                                         action:@selector(handleGesture:)];
//    [recognizerUp setDirection:UISwipeGestureRecognizerDirectionUp];
//    
//    UISwipeGestureRecognizer *recognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self
//                                                                                          action:@selector(handleGesture:)];
//    [recognizerDown setDirection:UISwipeGestureRecognizerDirectionDown];
//    
//    [self.view addGestureRecognizer:recognizerLeft];
//    [self.view addGestureRecognizer:recognizerRight];
//    
//    [self.view addGestureRecognizer:recognizerUp];
//    [self.view addGestureRecognizer:recognizerDown];

    
}

//- (void)handleGesture:(UISwipeGestureRecognizer*)gestureRecognizer
//{
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
//}

-(void)numberCard:(NumberCard *)card swipeGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer
{
    NSLog(@"LOG VAL : %@", [card description]); /* DEBUG LOG */
    
    if ([gestureRecognizer direction] == UISwipeGestureRecognizerDirectionLeft)
    {
        BOOL result = FALSE;
        NSMutableArray* arrTemp = [[NSMutableArray alloc] init];
        
        for (int i = card.column; i >= 0; i--)
        {
            @autoreleasepool {
                

//            NSLog(@"LOG VAL : i = %d", i); /* DEBUG LOG */
            NumberCard* myCard = [dArrChessBoard objectAtRow:card.row column:i];
            NSLog(@"LOG VAL : %d = %@" ,i ,[myCard description]); /* DEBUG LOG */
            if (myCard.noneValue == 1)
            {
                result = FALSE;
                [arrTemp addObject:myCard];
                
            } else
            {
                result = TRUE;
                [arrTemp addObject:myCard];
                break;
            }
            }
            
            
        }
        
        NSLog(@"LOG VAL : [arrTemp count] = %d", [arrTemp count]); /* DEBUG LOG */
        
        if (result == TRUE) // co th di chuyen
        {
//            noneCard = card;
//            noneCard.noneValue = 0;
//            noneCard.center = card.center;
//            noneCard.row = card.row;
//            noneCard.column = card.column;
//            noneCard.number = 0;
//            [dArrChessBoard insertObject:noneCard atRow:card.row column:card.column];
            
            
            // Di chuyen cac card con lai
            for (int i = 0; i < [arrTemp count] - 1; i++)
            {
                @autoreleasepool {
                    

                NSLog(@"LOG VAL : %@", @""); /* DEBUG LOG */
                NumberCard* currentCard = [arrTemp objectAtIndex:i];
                
                NSLog(@"LOG VAL : [currentCard description] %@", [currentCard description]); /* DEBUG LOG */
                
                NumberCard* nextCard = [arrTemp objectAtIndex:i + 1];
                
                NSLog(@"LOG VAL : [nextCard description] %@", [nextCard description]); /* DEBUG LOG */
                
                
                currentCard.center = nextCard.center;
//                currentCard.noneValue = 1;
//                currentCard.number = nextCard.number;
                currentCard.row = nextCard.row;
                currentCard.column = nextCard.column;
                
                [dArrChessBoard insertObject:currentCard atRow:nextCard.row column:nextCard.column];
                    
                NSLog(@"LOG VAL : %@", @"----------------------"); /* DEBUG LOG */
                    [self debug2Darray];
                    

                }
//                [arrTemp replaceObjectAtIndex:i withObject:nextCard];
            }
            
            // Di chuyen noneCard vao vi tri hien tai
//            noneCard = card;
//            noneCard.noneValue = 0;
//            noneCard.center = card.center;
            NSLog(@"LOG VAL : %@", @""); /* DEBUG LOG */
            NSLog(@"LOG VAL : %@", @""); /* DEBUG LOG */
            NSLog(@"LOG VAL : [noneCard description] %@", [noneCard description]); /* DEBUG LOG */
            NSLog(@"LOG VAL : [Card description] %@", [card description]); /* DEBUG LOG */
            NSLog(@"LOG VAL : [[arrTemp count] description] %@", [arrTemp objectAtIndex:0]); /* DEBUG LOG */
            NSLog(@"LOG VAL : [arrTemp count] %d", [arrTemp count]); /* DEBUG LOG */
            
            // Di chuyen cac card con lai
            for (int i = 0; i < [arrTemp count]; i++)
            {
                NSLog(@"LOG VAL : %@", [[arrTemp objectAtIndex:i] description]); /* DEBUG LOG */
                
            }
            
//            [dArrChessBoard insertObject:noneCard atRow:card.row column:card.column];
            
//            card.noneValue = 0;
//            card.number = 0;
//            noneCard = card;
//            noneCard.noneValue = 0;
//            noneCard.center = card.center;
//            noneCard.row = card.row;
//            noneCard.column = card.column;
//            [dArrChessBoard insertObject:noneCard atRow:card.row column:card.column];
            
//            [arrTemp replaceObjectAtIndex:[arrTemp count]-1 withObject:nextCard];
            
        }
        else
        {
            NSLog(@"LOG VAL : %@", @"khogn di chuyen duoc"); /* DEBUG LOG */
        }
        
        
        [self debug2Darray];
        
        NSLog(@"LOG VAL : %@", @"tam xong"); /* DEBUG LOG */
        
        
    }else if ([gestureRecognizer direction] == UISwipeGestureRecognizerDirectionRight)
    {
        
        NSLog(@"LOG VAL : %@", @"RIGHT"); /* DEBUG LOG */
        
    }else if ([gestureRecognizer direction] == UISwipeGestureRecognizerDirectionUp)
    {
        NSLog(@"LOG VAL : %@", @"UP"); /* DEBUG LOG */
        
    }else if ([gestureRecognizer direction] == UISwipeGestureRecognizerDirectionDown)
    {
        NSLog(@"LOG VAL : %@", @"DOWN"); /* DEBUG LOG */
        //Swipe from left to right
        //Do your functions here
    }

}

- (BOOL)isMoveCardToLeft:(NumberCard*)card
{
    if ((card.column - 1) > 0)
    {
        return chessboard[card.row][card.column - 1] == 0 ? TRUE : FALSE;
    }
    return FALSE;
}

- (BOOL)isMoveCardToRight:(NumberCard*)card
{
    if (card.column + 1 < TOTAL_COL)
    {
        return chessboard[card.row][card.column + 1] == 0 ? TRUE : FALSE;
    }
    return FALSE;
}

- (void)debug2Darray
{
    NSString* strCot = @"";
    for (int i = 0; i < TOTAL_ROW; i++)
    {
        strCot = @"";
        for (int j = 0; j < TOTAL_COL; j++)
        {
            NumberCard* card = [dArrChessBoard objectAtRow:i column:j];
            strCot = [NSString stringWithFormat:@"%@ - [%d:%d - %d:%d]", strCot, i, j, card.noneValue, card.number];
        }
        NSLog(@"LOG VAL : %@", strCot); /* DEBUG LOG */
    }
    
}


@end
