//
//  ViewController.m
//  MapViewDemo
//
//  Created by Esraa Hassan on 3/22/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "CustomAnotation.h"
@interface ViewController ()

@end

@implementation ViewController
CustomAnotation* annotation;

- (void)viewDidLoad {
    [super viewDidLoad];
    annotation = [CustomAnotation new];
    CLLocationManager* locationManager=[CLLocationManager new];
    locationManager.delegate = self;
    _receivedData = [NSMutableData new];

    [locationManager requestAlwaysAuthorization];
    
    /*
    annotation.coordinate = [locationManager location].coordinate;
    
    annotation.title =@"My Location";
    
    _longitudeTextField.text = [NSString stringWithFormat:@"%f",[locationManager location].coordinate.longitude];
    
    _latitudeTextField.text = [NSString stringWithFormat:@"%f", [locationManager location].coordinate.latitude];
    
    [_mapView removeAnnotation:annotation];
    [_mapView addAnnotation:annotation];
    */
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)touchAction:(id)sender {
    printf("test\n");
    CGPoint point = [sender locationInView:_mapView];
    CLLocationCoordinate2D touchCoordintaes = [_mapView convertPoint:point toCoordinateFromView:_mapView];
    [_mapView removeAnnotation:annotation];
    annotation.coordinate = touchCoordintaes;
    annotation.title =@"My Location";
    
    _longitudeTextField.text = [NSString stringWithFormat:@"%f", annotation.coordinate.longitude];
    
    _latitudeTextField.text = [NSString stringWithFormat:@"%f", annotation.coordinate.latitude];
    
    [_mapView addAnnotation:annotation];
    
}

- (IBAction)selectAvatar:(id)sender {
    
    TableViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"avatarScreen"];
    
    secondView.registerationView=self;
    [self presentViewController:secondView animated:YES completion:nil];
}
- (void)getAvatar:(UIImage *)avatarImage:(NSString*)imageName {
    
    _imageName = imageName;
    [_avatarImageView setImage:avatarImage];
}


- (IBAction)registerAction:(id)sender {
    
    
    NSString* name = _nameTextField.text;
    NSString* phone = _phoneTextField.text;
    NSString* longitude = _longitudeTextField.text;
    
    NSString* latitude = _latitudeTextField.text;
    
    UIImage* avatarImage = [_avatarImageView image];
    
    if(![name isEqualToString:@""] && ![phone isEqualToString:@""] && ![longitude isEqualToString:@""]  && ![latitude isEqualToString:@""] && avatarImage!=nil){
    
        NSURLRequest * request = [[NSURLRequest alloc] initWithURL:[self prepareURL:name:phone:[longitude floatValue]:[latitude floatValue]]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
    }else{
         UIAlertView* view = [[UIAlertView alloc] initWithTitle:@"not valid data" message:@"please enter data first" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    }
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
        
        ViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"mainScreen"];
        
        [self presentViewController:secondView animated:YES completion:nil];
        
    }
    _receivedData = [NSMutableData new];
    
    
}


- (IBAction)updateMapDataAction:(id)sender {
    
    CLLocationCoordinate2D coordintaes;
    
    if(![_latitudeTextField.text isEqualToString:@""]){
    
    coordintaes.latitude = [_latitudeTextField.text floatValue];
    
    coordintaes.longitude = [_longitudeTextField.text floatValue];
    
    [_mapView removeAnnotation:annotation];
    annotation.coordinate = coordintaes;
    annotation.title =@"My Location";
    }
    else{
        UIAlertView* view = [[UIAlertView alloc] initWithTitle:@"not valid data" message:@"please enter data first" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    }
    
    
    [_mapView addAnnotation:annotation];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_receivedData appendData:data];
    
}


-(NSURL*) prepareURL:(NSString*)name : (NSString*)phone: (float) longitude:(float) latitude{
    
    //NSString* test =[_avatarImageView image].accessibilityIdentifier;
    
   
    
    NSString* fullName=[NSString stringWithFormat:@"http://jets.iti.gov.eg/FriendsApp/services/user/register?name=%@&phone=%@&age=%@&imageURL=%@&longitude=%f&latitude=%f",name,phone,@"24",_imageName,longitude,latitude];
    
    NSURL* url = [[NSURL alloc] initWithString:fullName];
    
    return url;
    
}

@end
