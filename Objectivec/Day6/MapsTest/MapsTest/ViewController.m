//
//  ViewController.m
//  MapsTest
//
//  Created by Esraa Hassan on 3/14/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "MapController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_mapView setZoomEnabled:YES];
    [_mapView showsUserLocation];
    MapController* map = [[MapController alloc] init];
    CLLocationCoordinate2D location ;
    location.longitude = 32.726172;
    location.latitude =26.165269;
    
    
    
    MKPointAnnotation * point = [MKPointAnnotation new];
   // [point setCoordinate:location];
    [point setCoordinate:location];
    point.title =@"Home";
    point.subtitle=@"Qena";
    [_mapView addAnnotation:point];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
