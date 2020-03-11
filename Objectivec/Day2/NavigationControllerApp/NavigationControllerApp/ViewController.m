//
//  ViewController.m
//  NavigationControllerApp
//
//  Created by Esraa Hassan on 3/7/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clearTex{
    _nameTextField.text=@"";
}


- (IBAction)nextButton:(UIButton *)sender {
    SecondViewController* secondView=[self.storyboard instantiateViewControllerWithIdentifier:@"secondView"];
    
    secondView.labelValue=_nameTextField.text;
    secondView.firstView=self;
    
    [self.navigationController pushViewController:secondView animated:YES];
}

@end
