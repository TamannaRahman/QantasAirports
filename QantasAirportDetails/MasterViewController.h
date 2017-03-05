//
//  MasterViewController.h
//  QantasAirportDetails
//
//  Created by CQUGSR on 5/03/2017.
//  Copyright © 2017 Tamanna. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
#import "Airport.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property(nonatomic, strong) UIActivityIndicatorView *activityIndicator;


@end

