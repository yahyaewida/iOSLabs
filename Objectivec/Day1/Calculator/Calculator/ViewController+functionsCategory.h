//
//  ViewController+functionsCategory.h
//  Calculator
//
//  Created by Esraa Hassan on 3/5/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (functionsCategory)

//functions
-(void) clearNumbersLabel;
-(void) appendValue:(NSString*) value;
-(void)doOperation;
- (void)changeOperation:(int)operation andNumer :(NSString*)number;
-(void)resetVariables;


@end
