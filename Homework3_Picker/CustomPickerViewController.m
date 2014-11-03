//
//  CustomPickerViewController.m
//  Homework3_Picker
//
//  Created by Quique Lores on 10/22/14.
//  Copyright (c) 2014 nyu.edu. All rights reserved.
//

#import "CustomPickerViewController.h"
#import "CheckItViewController.h"
#import "TabBarController.h"

@interface CustomPickerViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) NSArray* images;

@end

@implementation CustomPickerViewController

@synthesize tBController;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initiate array of images fo r picker
    self.images = @[[UIImage imageNamed:@"hearts.png"], [UIImage imageNamed:@"spades.png"], [UIImage imageNamed:@"diamonds.png"], [UIImage imageNamed:@"clubs.jpeg"]];
    // initiate arrays of cards
    self.numbers = @[@"The Ace of", @"The Two of", @"The Three of", @"The four of", @"The five of", @"The six of", @"The seven of", @"The eight of", @"The nine of", @"The ten of", @"The Jack of", @"The Queen of", @"The King of"];
    self.suits = @[@"Hearts", @"Spades", @"Diamonds", @"Clubs"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) viewWillDisappear:(BOOL)animated {
    //send guessed card info to tabBarController, for other viewControllers to know the guessed card
    tBController = (TabBarController*)[self parentViewController];
    tBController.guessedValue = self.numbers[[self.picker selectedRowInComponent:0]];
    tBController.guessedSuit = self.suits[[self.picker selectedRowInComponent:1]];
} //end viewWillDisappear


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
} //end numberOfComponentsInPickerView

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0){
        return [self.numbers count];
    }
    return [self.suits count];
} //end pickerView numberOfRowsInComponent

#pragma mark Picker Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if(component == 0 && row < [self.numbers count]){
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 100, 20)];
        UILabel *valueLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 20)];
        [valueLab setTextColor:[UIColor blackColor]];
        [valueLab setBackgroundColor:[UIColor clearColor]];
        valueLab.text = self.numbers[row];
        [view addSubview:valueLab];
        return view;
    }
    else if(component == 1 && row < [self.images count]){
        UIImage* image = self.images[row];
        UIImageView *im = [[UIImageView alloc] initWithImage:image];
        return im;
    }
    return nil;
} //end pickerView viewForRow forComponent reusingView

@end
