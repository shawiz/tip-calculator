//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Sean Ren on 2/27/14.
//  Copyright (c) 2014 Sean Ren. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

- (IBAction)onTap:(id)sender;
- (void)saveDefaultTipPercent;
- (void)initDefaultTipPercent;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initDefaultTipPercent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self saveDefaultTipPercent];
}

- (void)saveDefaultTipPercent {
    NSInteger tipControlIndex = self.defaultTipControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipControlIndex forKey:@"default_tip_control_index"];
    [defaults synchronize];
}

- (void)initDefaultTipPercent {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultTipControlIndex = [defaults integerForKey:@"default_tip_control_index"];
    
    // by default, the index is 0. if we haven't set it yet, don't do anything
    if (defaultTipControlIndex != 0) {
        [self.defaultTipControl setSelectedSegmentIndex:defaultTipControlIndex];
    }
}

@end
