//
//  ViewController.m
//  InputCheck
//
//  Created by Esraa Hassan on 3/6/20.
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


- (IBAction)checkInputButton:(id)sender {
    
    NSNumberFormatter *nf = [NSNumberFormatter new];
    
    if(![_inputTextField.text isEqualToString:@""]){
        if ([nf numberFromString:_inputTextField.text] != nil){
            _resultLabel.text =@"textField contains  number";
        }
        else{
            _resultLabel.text =@"textField contains text" ;
        }
    }
    else{
        printf("input textField \n");
    }
}
@end
