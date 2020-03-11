//
//  ViewController.m
//  ColleaguesTableApp
//
//  Created by Esraa Hassan on 3/7/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"
#import "Colleague.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _nameLabel.text = _colleague.name;
    _phoneLabel.text = _colleague.phone;
    _ageLabel.text = [NSString stringWithFormat:@"%i", _colleague.age];;
    _addressLabel.text = _colleague.address;
    _emailLabel.text = _colleague.email;
  
    UIBarButtonItem* insertButton =[[UIBarButtonItem alloc] initWithTitle:@"insert" style:UIBarButtonItemStylePlain target:self action:@selector(insertButtonAction)];
    [self.navigationItem setRightBarButtonItem:insertButton];
}

-(void) insertButtonAction{
    Colleague* newColleague = [Colleague new];
    newColleague.name=@"Abd El-malek";
    newColleague.phone=@"010";
    newColleague.age = 24;
    newColleague.email = @"malek@gmail.com";
    newColleague.address =@"fayoum";
    [_tableViewScreen insertNewColleague:newColleague inSection:0];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
 
