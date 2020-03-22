//
//  MainViewController.h
//  MapViewDemo
//
//  Created by Esraa Hassan on 3/22/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colleague.h"

@interface MainViewController : UIViewController<NSURLConnectionDelegate>

@property NSString *status;
@property NSMutableData * receivedData;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
- (IBAction)loginButtonAction:(id)sender;
- (IBAction)registerButtonAction:(id)sender;

@end
