//
//  ViewController.m
//  webViewDemo
//
//  Created by Esraa Hassan on 3/11/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"

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


- (IBAction)syncButtonAction:(id)sender {
    NSURL* url = [[NSURL alloc] initWithString:@"http://www.yahoo.com"];
    
    NSString * result = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    [_webView loadHTMLString:result baseURL:url];
    
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receivedData appendData:data];

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSURL* url = [[NSURL alloc] initWithString:@"http://www.yahoo.com"];
    
    NSString *result = [[NSString alloc] initWithData:_receivedData encoding:NSUTF8StringEncoding];
    [_webView loadHTMLString:result baseURL:url];
}
- (IBAction)aSyncButtonAction:(id)sender {
    
     NSURL* url = [[NSURL alloc] initWithString:@"http://www.yahoo.com"];
    
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}
@end
