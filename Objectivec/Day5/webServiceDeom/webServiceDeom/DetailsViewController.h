//
//  DetailsViewController.h
//  webServiceDeom
//
//  Created by Esraa Hassan on 3/12/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colleague.h"

@interface DetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property UIImage* image;
- (IBAction)cancelButtonAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@property Colleague* colleague;
@end
