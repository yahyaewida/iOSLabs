//
//  ViewController.m
//  webServiceDeom
//
//  Created by Esraa Hassan on 3/11/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _receivedData = [NSMutableData new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) doAction{
    NSString * name = _nameTextField.text ;
    NSString *phone =_phoneTextField.text ;
    
    
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[self prepareURL:name :phone]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
    
}

- (IBAction)registerButtonAction:(id)sender {
    
    [self doAction];
   
}

- (IBAction)loginButtonAction:(id)sender {
    [self doAction];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receivedData appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:_receivedData options:NSJSONReadingAllowFragments error:nil];
    
    _status = [dictionary objectForKey:@"status"];
    
    if([_status isEqualToString:@"FAILING"]){
        UIAlertView *uiView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"already Registered" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [uiView show];
        
        
    }
    else{
         UIAlertView *uiView = [[UIAlertView alloc] initWithTitle:@"Sucess" message:@"Registered successfully" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [uiView show];
    }
    _receivedData = [NSMutableData new];
    
    
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex ==0){
        if(![_status isEqualToString:@"FAILING"]){
            
            TableViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"secondView"];
            
            [self presentViewController:secondView animated:YES completion:nil];
        }
    }
}

-(NSURL*) prepareURL:(NSString*) name: (NSString*) phone{
    NSString* fullName=[NSString stringWithFormat:@"http://jets.iti.gov.eg/FriendsApp/services/user/register?name=%@&phone=%@",name,phone];
    NSURL* url = [[NSURL alloc] initWithString:fullName];
    
    return url;

}
@end
