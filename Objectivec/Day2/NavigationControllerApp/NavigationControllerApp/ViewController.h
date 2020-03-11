//
//  ViewController.h
//  NavigationControllerApp
//
//  Created by Esraa Hassan on 3/7/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunicatorProtocol.h"
@interface ViewController : UIViewController <CommunicatorProtocol>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

- (IBAction)nextButton:(UIButton *)sender;


@end

