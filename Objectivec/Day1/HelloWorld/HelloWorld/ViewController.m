//
//  ViewController.m
//  HelloWorld
//
//  Created by Esraa Hassan on 3/5/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"

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


- (IBAction)myButton:(id)sender {
    [_myLabel setText:@"Button Pressed"];
}
@end
