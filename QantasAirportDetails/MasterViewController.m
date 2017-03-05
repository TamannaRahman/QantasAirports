//
//  MasterViewController.m
//  QantasAirportDetails
//
//  Created by CQUGSR on 5/03/2017.
//  Copyright © 2017 Tamanna. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController{
    
    NSDictionary *post;
    NSMutableArray *airportsDetailArray;
    NSMutableArray *airportsNameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    airportsDetailArray = [[NSMutableArray alloc] init];
    airportsNameArray = [[NSMutableArray alloc] init];
    [self createActivityIndicator];
    [self.activityIndicator startAnimating];
    
    self.ref = [[FIRDatabase database] referenceFromURL:@"https://qantasairportdetails.firebaseio.com/"];
    [self.ref keepSynced:YES];
    
    [self fetchDataCompletion:^(bool success){
        
        if (success && airportsDetailArray) {
            
            [self.tableView reloadData];
            [self.activityIndicator stopAnimating];
        }
    }];

}

-(void)createActivityIndicator{
    
    UIActivityIndicatorView *actInd=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    actInd.color=[UIColor blackColor];
    
    [actInd setCenter:self.view.center];
    
    self.activityIndicator=actInd;
    [self.view addSubview:self.activityIndicator];
}

-(void)fetchDataCompletion:(void(^)(bool success))completion{
    
    
    [[self.ref queryOrderedByKey] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
        
        
        for ( FIRDataSnapshot *child in snapshot.children) {
            
            post = child.value;
        }

        for(NSDictionary *eachAirport in post)
        {
            Airport *airports = [[Airport alloc] initWithJSONData:eachAirport];
            [airportsDetailArray addObject:airports];
            [airportsNameArray addObject:airports.name];
        }
        completion(YES);
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        controller.airportId = airportsDetailArray[indexPath.row];
        
            NSLog(@"Is of type: %@", [airportsDetailArray[indexPath.row] class]);
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return airportsDetailArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Airport *airport = airportsDetailArray[indexPath.row];
    cell.textLabel.text = airport.name;
    cell.detailTextLabel.text = airport.country;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}




@end
