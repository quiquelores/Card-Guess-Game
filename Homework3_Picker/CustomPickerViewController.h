//
//  CustomPickerViewController.h
//  Homework3_Picker
//
//  Created by Quique Lores on 10/22/14.
//  Copyright (c) 2014 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"

@interface CustomPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic) NSArray *numbers;
@property (nonatomic) NSArray *suits;
@property (nonatomic, strong) TabBarController* tBController;
@end
