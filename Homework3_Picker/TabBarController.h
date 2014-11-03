//
//  TabBarController.h
//  Homework3_Picker
//
//  Created by Quique Lores on 10/22/14.
//  Copyright (c) 2014 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TabBarController : UITabBarController <UITabBarControllerDelegate>

@property (nonatomic) NSString *number;
@property (nonatomic) NSString *suit;
@property (nonatomic) int guesses;

@property (nonatomic) NSString *guessedValue;
@property (nonatomic) NSString *guessedSuit;

-(BOOL) checkGuess;


@end
