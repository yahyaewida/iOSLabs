//
//  ViewController.h
//  ColleagueApp
//
//  Created by Esraa Hassan on 3/5/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Colleague.h"
@interface ViewController : UIViewController

@property NSUInteger currentIndex;
@property NSArray* colleagueArray;
@property Colleague* currentColleague;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLAbel;





- (IBAction)previousButton:(id)sender;
- (IBAction)nextButton:(id)sender;

@end

