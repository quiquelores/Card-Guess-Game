//
//  HintViewController.m
//  Homework3_Picker
//
//  Created by Quique Lores on 10/23/14.
//  Copyright (c) 2014 nyu.edu. All rights reserved.
//

#import "HintViewController.h"
#import "TabBarController.h"

@interface HintViewController ()

- (IBAction)confirmPressed:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;
@property (strong, nonatomic) IBOutlet UILabel *suitLabel;

@end

@implementation HintViewController

@synthesize tBController;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tBController = (TabBarController*)[self parentViewController];
    // Do any additional setup after loading the view.
}

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

- (IBAction)confirmPressed:(id)sender {
    //display guess
    self.valueLabel.text = [NSString stringWithFormat:@"%@ %@", self.tBController.number, self.tBController.suit];
    self.suitLabel.text = self.tBController.suit;
} //confirmPressed end

@end
