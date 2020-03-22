//
//  DetailsViewController.m
//  webServiceDeom
//
//  Created by Esraa Hassan on 3/12/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _nameLabel.text = _colleague.name;
    _phoneLabel.text = _colleague.phone;
    [_imageView setImage:_image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)cancelButtonAction:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
