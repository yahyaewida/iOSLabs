//
//  SecondViewController.h
//  NavigationControllerApp
//
//  Created by Esraa Hassan on 3/7/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunicatorProtocol.h"
@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property NSString* labelValue;
@property id<CommunicatorProtocol> firstView;
@end
