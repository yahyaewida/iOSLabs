//
//  ViewController.h
//  MapViewDemo
//
//  Created by Esraa Hassan on 3/22/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunicatorProtocol.h"
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController <CommunicatorProtocol,CLLocationManagerDelegate,NSURLConnectionDataDelegate>
@property NSString *status;

@property NSString* imageName;
@property NSMutableData * receivedData;

- (IBAction)registerAction:(id)sender;

- (IBAction)updateMapDataAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;

@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)touchAction:(id)sender;

- (IBAction)selectAvatar:(id)sender;


@end

