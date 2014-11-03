//
//  TabBarController.m
//  Homework3_Picker
//
//  Created by Quique Lores on 10/22/14.
//  Copyright (c) 2014 nyu.edu. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    srandom(time(NULL));
    
    //generate array of values and suits. and pick a random card
    NSArray *numbers = @[@"The Ace of", @"The Two of", @"The Three of", @"The four of", @"The five of", @"The six of", @"The seven of", @"The eight of", @"The nine of", @"The ten of", @"The Jack of", @"The Queen of", @"The King of"];
    NSArray *suits = @[@"Hearts", @"Spades", @"Diamonds", @"Clubs"];
    self.number = numbers[random()% [numbers count]];
    self.suit = suits[random() % [suits count]];
} // end viewDidLoad

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) checkGuess{
    self.guesses++;
    if(self.number == self.guessedValue && self.suit == self.guessedSuit){
        return TRUE;
    }
    return FALSE;
} //end checkGuess

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
