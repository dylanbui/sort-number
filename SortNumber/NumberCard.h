//
//  NumberCard.h
//  SortNumber
//
//  Created by Dylan Bui on 6/19/14.
//  Copyright (c) 2014 Dylan Bui. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumberCardDelegate;

@interface NumberCard : UIView


@property(nonatomic, assign) NSInteger noneValue;
@property(nonatomic, assign) NSInteger number;
@property(nonatomic, assign) NSInteger row;
@property(nonatomic, assign) NSInteger column;
@property(nonatomic, assign) CGPoint new_center_point;
@property(nonatomic, weak) id<NumberCardDelegate> delegate;

@property(nonatomic, strong) UILabel* lblNum;




- (id)init;
- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame withNumber:(int)num;



@end


/*
 *Your application should implement this delegate
 */
@protocol NumberCardDelegate <NSObject>

@optional

/**
 * Called just before the request is sent to the server.
 */
//- (void)requestLoading:(NumberCard *)card;

- (void)numberCard:(NumberCard*)card swipeGestureRecognizer:(UISwipeGestureRecognizer*)gestureRecognizer;

@end
