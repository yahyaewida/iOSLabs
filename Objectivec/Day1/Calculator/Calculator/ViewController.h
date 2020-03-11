//
//  ViewController.h
//  Calculator
//
//  Created by Esraa Hassan on 3/5/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property double num1;
@property double num2;
@property NSString *result;
@property int operation;

@property (weak, nonatomic) IBOutlet UILabel *numbersLabel;

@property (weak, nonatomic) IBOutlet UIButton *divButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *mulButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *addButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *subButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *equalButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *percentButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *signButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *clearButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *nineButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *eightButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *sevenButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *sixButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *fiveButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *fourButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *threeButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *twoButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *oneButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *dotButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *zeroButtonOutlet;

- (IBAction)divButtonAction:(id)sender;

- (IBAction)mulButtonAction:(id)sender;
- (IBAction)addButtonAction:(id)sender;
- (IBAction)subButtonAction:(id)sender;
- (IBAction)equalButtonAction:(id)sender;
- (IBAction)percentButtonAction:(id)sender;
- (IBAction)signButtonAction:(id)sender;
- (IBAction)clearButtonAction:(id)sender;
- (IBAction)nineButtonAction:(id)sender;

- (IBAction)eightButtonAction:(id)sender;
- (IBAction)sevenButtonAction:(id)sender;
- (IBAction)sixButtonAction:(id)sender;
- (IBAction)fiveButtonAction:(id)sender;
- (IBAction)fourButtonAction:(id)sender;
- (IBAction)threeButtonAction:(id)sender;
- (IBAction)twoButtonAction:(id)sender;
- (IBAction)oneButtonAction:(id)sender;
- (IBAction)dotButtonAction:(id)sender;
- (IBAction)zeroButtonAction:(id)sender;


@end

