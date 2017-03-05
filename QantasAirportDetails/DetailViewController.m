//
//  DetailViewController.m
//  QantasAirportDetails
//
//  Created by CQUGSR on 5/03/2017.
//  Copyright © 2017 Tamanna. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController{
    
    CLLocationManager *locationManager;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _airportId.name;
    _country.text = [NSString stringWithFormat:@"Country: %@", _airportId.country];
    _currency.text = [NSString stringWithFormat:@"Currency: %@",_airportId.currency];
    _timezone.text = [NSString stringWithFormat:@"Timezone: %@",_airportId.airportTimezone];

    [self showMap];
}

-(void)showMap{
    
    self.mapView.delegate = self;
    locationManager.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    [locationManager stopUpdatingLocation];
    self.mapView.showsUserLocation = YES;
    self.mapView.zoomEnabled=YES;
    
    MKCoordinateRegion region = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake((CLLocationDegrees)[_airportId.latitude doubleValue], (CLLocationDegrees)[_airportId.longitude doubleValue]), 10000, 10000)];
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:CLLocationCoordinate2DMake((CLLocationDegrees)[_airportId.latitude doubleValue], (CLLocationDegrees)[_airportId.longitude doubleValue])];
    [annotation setTitle:_airportId.name];
    [annotation setSubtitle:_airportId.country];
    
    [self.mapView addAnnotation:annotation];

}


- (IBAction)mapTypes:(id)sender {
    
    if (self.segmentControl.selectedSegmentIndex == 0) {
        self.mapView.mapType = MKMapTypeStandard;
    }
    if (self.segmentControl.selectedSegmentIndex == 1) {
        self.mapView.mapType = MKMapTypeSatellite;
    }
    if (self.segmentControl.selectedSegmentIndex == 2) {
        self.mapView.mapType = MKMapTypeHybrid;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
