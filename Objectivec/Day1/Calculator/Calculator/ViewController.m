//
//  ViewController.m
//  Calculator
//
//  Created by Esraa Hassan on 3/5/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"
#import <Math.h>
#import "ViewController+functionsCategory.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //operations 1:div,2:mul,3:add,4:sub,5:percent
   
    _divButtonOutlet.layer.cornerRadius=50;
    _mulButtonOutlet.layer.cornerRadius=50;
    _addButtonOutlet.layer.cornerRadius=50;
    _subButtonOutlet.layer.cornerRadius=50;
    _equalButtonOutlet.layer.cornerRadius=50;
    _percentButtonOutlet.layer.cornerRadius=50;
    _signButtonOutlet.layer.cornerRadius=50;
    _clearButtonOutlet.layer.cornerRadius=50;
    _nineButtonOutlet.layer.cornerRadius=50;
    _eightButtonOutlet.layer.cornerRadius=50;
    _sevenButtonOutlet.layer.cornerRadius=50;
    _sixButtonOutlet.layer.cornerRadius=50;
    _fiveButtonOutlet.layer.cornerRadius=50;
    _fourButtonOutlet.layer.cornerRadius=50;
    _threeButtonOutlet.layer.cornerRadius=50;
    _twoButtonOutlet.layer.cornerRadius=50;
    _oneButtonOutlet.layer.cornerRadius=50;
    _dotButtonOutlet.layer.cornerRadius=50;
    _zeroButtonOutlet.layer.cornerRadius=50;
    _operation=0;
    


  
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)divButtonAction:(id)sender {
    [self changeOperation:1 andNumer: _numbersLabel.text];
   
}

- (IBAction)mulButtonAction:(id)sender {
    [self changeOperation:2 andNumer: _numbersLabel.text];
    
    
}

- (IBAction)addButtonAction:(id)sender {
    [self changeOperation:3 andNumer: _numbersLabel.text];
    
    
}

- (IBAction)subButtonAction:(id)sender {
    [self changeOperation:4 andNumer: _numbersLabel.text];
    
    
}

- (IBAction)equalButtonAction:(id)sender {
    if(_num1!=0){
        _num2 = [_numbersLabel.text doubleValue];
        [self doOperation];
    }
}

- (IBAction)percentButtonAction:(id)sender {
    [self changeOperation:5 andNumer: _numbersLabel.text];
}

- (IBAction)signButtonAction:(id)sender {
    if(![_numbersLabel.text isEqualToString:@"0"] &&![_numbersLabel.text containsString:@"-"]){
    _numbersLabel.text =[@"-" stringByAppendingString:_numbersLabel.text];
    }
    else if([_numbersLabel.text containsString:@"-"]){
        _numbersLabel.text =[_numbersLabel.text stringByReplacingOccurrencesOfString:@"-"
                                    withString:@""];
    }
}

- (IBAction)clearButtonAction:(id)sender {
    _num1 =0;
    _num2=0;
    [self clearNumbersLabel];
    
}

- (IBAction)nineButtonAction:(id)sender {
    [self appendValue:@"9"];
}

- (IBAction)eightButtonAction:(id)sender {
    [self appendValue:@"8"];
}

- (IBAction)sevenButtonAction:(id)sender {
    [self appendValue:@"7"];
}

- (IBAction)sixButtonAction:(id)sender {
    [self appendValue:@"6"];
}

- (IBAction)fiveButtonAction:(id)sender {
    [self appendValue:@"5"];
    
}

- (IBAction)fourButtonAction:(id)sender {
    [self appendValue:@"4"];
}

- (IBAction)threeButtonAction:(id)sender {
    [self appendValue:@"3"];
    
}

- (IBAction)twoButtonAction:(id)sender {
    [self appendValue:@"2"];
}

- (IBAction)oneButtonAction:(id)sender {
    [self appendValue:@"1"];
}

- (IBAction)dotButtonAction:(id)sender {
    if(![_numbersLabel.text containsString:@"."]){
    _numbersLabel.text = [_numbersLabel.text stringByAppendingString:@"."];
        _num2=-1;
    }
}

- (IBAction)zeroButtonAction:(id)sender {
     if(![_numbersLabel.text isEqualToString:@"0"] && _num2!=0){
     _numbersLabel.text = [_numbersLabel.text stringByAppendingString:@"0"];
     }
}


@end
