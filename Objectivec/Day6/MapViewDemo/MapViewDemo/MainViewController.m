//
//  MainViewController.m
//  MapViewDemo
//
//  Created by Esraa Hassan on 3/22/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "DetailsViewController.h"
@implementation MainViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    
     _receivedData = [NSMutableData new];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receivedData appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:_receivedData options:NSJSONReadingAllowFragments error:nil];
    
    _status = [dictionary objectForKey:@"status"];
    
    if([_status isEqualToString:@"FAILING"]){
        UIAlertView *uiView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Not Registered" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [uiView show];
        
        
    }
    else{
        NSDictionary* values = [dictionary objectForKey:@"result"];
        
        Colleague* user = [Colleague new];
        user.phone =  [values objectForKey:@"phone"];
        user.name =  [values objectForKey:@"name"];
        user.imagePath =  [values objectForKey:@"imageUrl"];
        user.age =  [values objectForKey:@"age"];
        user.longitude = [values objectForKey:@"longitude"];
        user.latitude =  [values objectForKey:@"latitude"];
        
        
        
        DetailsViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"detailsView"];
        
        secondView.user = user;        
        [self presentViewController:secondView animated:YES completion:nil];
    }
    _receivedData = [NSMutableData new];
    
    
}

- (IBAction)loginButtonAction:(id)sender {
    
    
    
    NSString* phone = _phoneTextField.text;
  
    
    if( ![phone isEqualToString:@""] ){
        
        NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[self prepareURL:phone]];
        
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        [connection start];
    }else{
        UIAlertView* view = [[UIAlertView alloc] initWithTitle:@"not valid data" message:@"please enter data first" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    }
    
}

- (IBAction)registerButtonAction:(id)sender {
    ViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"registerMainScreen"];
    
    [self presentViewController:secondView animated:YES completion:nil];
}


-(NSURL*) prepareURL: (NSString*)phone{
    
    //NSString* test =[_avatarImageView image].accessibilityIdentifier;
    
    NSString* fullName=[NSString stringWithFormat:@"http://jets.iti.gov.eg/FriendsApp/services/user/findUser?phone=%@",phone];
    
    NSURL* url = [[NSURL alloc] initWithString:fullName];
    
    return url;
    
}
@end
