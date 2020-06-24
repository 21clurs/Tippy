//
//  ViewController.m
//  Tippy
//
//  Created by Clara Kim on 6/23/20.
//  Copyright © 2020 Clara Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *billLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Make the billField first responder
    [self.billField becomeFirstResponder];
}

- (IBAction)onTap:(id)sender {
    // When the view is tapped, dismiss keyboard
    NSLog(@"Hello");
    
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    // Update the tip and total as the bill is changed
    double bill = [self.billField.text doubleValue];
    
    NSArray* percentages = @[@(0.15), @(0.20), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditBegin:(id)sender {
    NSLog(@"here");
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y+10, self.billField.frame.size.width, self.billField.frame.size.height);
        self.billLabel.frame = CGRectMake(self.billLabel.frame.origin.x, self.billLabel.frame.origin.y+10, self.billLabel.frame.size.width, self.billLabel.frame.size.height);
        //[self.billField setFont:[UIFont systemFontOfSize:40]];
    }];
    /*
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha=0;
        self.totalLabel.alpha=0;
    }];
     */
}
- (IBAction)onEditEnd:(id)sender {
    NSLog(@"no here");
    CGRect newFrame = self.billField.frame;
    CGRect newLabelFrame = self.billLabel.frame;
    newFrame.origin.y -=10;
    newLabelFrame.origin.y -=10;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
        self.billLabel.frame = newLabelFrame;
        //[self.billField setFont:[UIFont systemFontOfSize:14]];
    }];
    /*
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha=1;
        self.totalLabel.alpha=1;
    }];
     */
}

@end
