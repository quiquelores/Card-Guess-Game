//
//  CheckItViewController.m
//  Homework3_Picker
//
//  Created by Quique Lores on 10/23/14.
//  Copyright (c) 2014 nyu.edu. All rights reserved.
//

#import "CheckItViewController.h"
#import "TabBarController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface UIApplication (extended)
-(void) terminateWithSuccess;
@end


@interface CheckItViewController ()

@property (strong, nonatomic) IBOutlet UILabel *guessLabel;
@property (strong, nonatomic) IBOutlet UILabel *guessCounter;
@property (strong, nonatomic) IBOutlet UILabel *guessDisplay;


@end

@implementation CheckItViewController {
    SystemSoundID winSoundID;
}

@synthesize tBController;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.tBController = (TabBarController*)[self parentViewController];
    self.guessDisplay.text = [NSString stringWithFormat:@"Your guess was: %@ %@", self.tBController.guessedValue, self.tBController.guessedSuit];
    
    if([self.tBController checkGuess]){
        self.guessLabel.textColor = [UIColor greenColor];
        self.guessLabel.text = @"RIGHT! exiting...";
        [self performSelector:@selector(playWinSound)
                   withObject:nil
                   afterDelay:0.3];
    } else{
        self.guessLabel.textColor = [UIColor redColor];
        self.guessLabel.text = @"WRONG.";
    }
    self.guessCounter.text = [NSString stringWithFormat:@"Number of guesses: %i",self.tBController.guesses];
} //end viewDidAppear

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)playWinSound
{
    if (winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win"
                                                  withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL,
                                         &winSoundID);
    }
    AudioServicesPlaySystemSound(winSoundID);
    [self performSelector:@selector(terminate) withObject:nil afterDelay:3];
} //end playWinSound

-(void) terminate {
    [[UIApplication sharedApplication] terminateWithSuccess];
} //end terminate


@end
