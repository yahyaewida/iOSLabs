//
//  ViewController.m
//  ColleagueApp
//
//  Created by Esraa Hassan on 3/5/20.
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
    
    Colleague* yahya =[Colleague new];
    yahya.name=@"yahya";
    yahya.phone=@"010";
    Colleague* ibrahim = [Colleague new];
    ibrahim.name=@"ibrahim";
    ibrahim.phone=@"011";
    Colleague* manar = [Colleague new];
    manar.name=@"manar";
    manar.phone=@"012";
    _colleagueArray = @[yahya,ibrahim,manar];
    _currentIndex=-1;
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)previousButton:(id)sender {
    if(_currentIndex==0){
        _currentIndex=_colleagueArray.count-1;
    }
    else{
        _currentIndex--;
    }
     _currentColleague =[_colleagueArray objectAtIndex:_currentIndex];
    [_nameLabel setText: _currentColleague.name];
    [_phoneLAbel setText: _currentColleague.phone];
    
}

- (IBAction)nextButton:(id)sender {
    
    if(_currentIndex==_colleagueArray.count-1){
        _currentIndex = 0;
    }
    else{
        _currentIndex++;
    }
    _currentColleague =[_colleagueArray objectAtIndex:_currentIndex];
    [_nameLabel setText: _currentColleague.name];
    [_phoneLAbel setText: _currentColleague.phone];
    
}
@end
