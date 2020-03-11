//
//  ViewController.h
//  ColleaguesTableApp
//
//  Created by Esraa Hassan on 3/7/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colleague.h"
#import "CommunicatorProtocol.h"
@interface ViewController : UIViewController

@property Colleague* colleague;
@property id<CommunicatorProtocol> tableViewScreen;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

