//
//  ViewController.h
//  webServiceDeom
//
//  Created by Esraa Hassan on 3/11/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate,UIAlertViewDelegate>
@property NSString *status;
- (IBAction)registerButtonAction:(id)sender;
- (IBAction)loginButtonAction:(id)sender;

@property NSMutableData * receivedData;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

