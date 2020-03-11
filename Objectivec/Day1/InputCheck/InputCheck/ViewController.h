//
//  ViewController.h
//  InputCheck
//
//  Created by Esraa Hassan on 3/6/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
- (IBAction)checkInputButton:(id)sender;

@end

