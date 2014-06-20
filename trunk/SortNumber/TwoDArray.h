//
//  TwoDArray.h
//  SortNumber
//
//  Created by Dylan Bui on 6/20/14.
//  Copyright (c) 2014 Dylan Bui. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kTwoDArrayEmptyKey @"kTwoDArrayEmptyKey"

#import <Foundation/Foundation.h>

@interface TwoDArray : NSObject

- (id) initWithRows:(int)x columns:(int)y;

- (BOOL) insertObject:(id)data atRow:(int)x column:(int)y;
- (id) objectAtRow:(int)x column:(int)y;

- (void) removeAllObjects;

@end