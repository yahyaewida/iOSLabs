//
//  ViewController.h
//  CopyText
//
//  Created by Esraa Hassan on 3/5/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)copyButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextField *textVield;

@end

