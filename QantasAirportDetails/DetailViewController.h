//
//  DetailViewController.h
//  QantasAirportDetails
//
//  Created by CQUGSR on 5/03/2017.
//  Copyright © 2017 Tamanna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Airport.h"
#import <MapKit/MapKit.h>


@interface DetailViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) NSDate *detailItem;
@property (nonatomic, strong) Airport *airportId;
@property (weak, nonatomic) IBOutlet UILabel *country;
@property (weak, nonatomic) IBOutlet UILabel *currency;
@property (weak, nonatomic) IBOutlet UILabel *timezone;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

- (IBAction)mapTypes:(id)sender;






@end

