//
//  ViewController+functionsCategory.m
//  Calculator
//
//  Created by Esraa Hassan on 3/5/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController+functionsCategory.h"

@implementation ViewController (functionsCategory)

//operations 1:div,2:mul,3:add,4:sub,5:percent

- (void)appendValue:(NSString *)value{
    if((self.operation==0 && self.num1==0 && self.num2==0)){
        self.numbersLabel.text=@"0";
        
    }
    if([self.numbersLabel.text isEqualToString:@"0"]|| [self.numbersLabel.text isEqualToString:@"not valid"]){
        self.numbersLabel.text = value;
        self.num2 = -1;
    }
    else{
        self.numbersLabel.text = [self.numbersLabel.text stringByAppendingString:value];
        self.num2 = -1;
        
    }
}

- (void)changeOperation:(int)operation andNumer :(NSString*)number{
    if(![number isEqualToString:@"0"]|| self.num1!=0){
        if(self.operation==0){
            self.num1=[number doubleValue];
            self.operation=operation;
            [self clearNumbersLabel];
        }
        else{
            self.operation=operation;
        }
    }
    
}
- (void)resetVariables{
    self.operation =0;
    self.num1=0;
    self.num2=0;
}
- (void)clearNumbersLabel{
    [self.numbersLabel setText:@"0"];
}

- (void)doOperation{
    switch (self.operation) {
            
        case 1:
            if(self.num2==0){
                self.numbersLabel.text =@"not valid";
                [self resetVariables];
            }
            else{
                self.numbersLabel.text =[NSString stringWithFormat: @"%.2f", (self.num1/self.num2)];
                [self resetVariables];
                
            }
            break;
            
        case 2:
            self.numbersLabel.text =[NSString stringWithFormat: @"%.2f", (self.num1*self.num2)];
            [self resetVariables];
            break;
            
            
        case 3:
            self.numbersLabel.text =[NSString stringWithFormat: @"%.2f", (self.num1+self.num2)];
            [self resetVariables];
            break;
            
        case 4:
            self.numbersLabel.text =[NSString stringWithFormat: @"%.2f", (self.num1-self.num2)];
            [self resetVariables];
            break;
        case 5:
            self.numbersLabel.text =[NSString stringWithFormat: @"%.2f", fmod(self.num1, self.num2)];
            [self resetVariables];
            
        default:
            break;
    }
}

@end
