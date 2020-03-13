//
//  ViewController.h
//  webViewDemo
//
//  Created by Esraa Hassan on 3/11/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate>
@property NSMutableData * receivedData;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)syncButtonAction:(id)sender;
- (IBAction)aSyncButtonAction:(id)sender;

@end

