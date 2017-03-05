//
//  Airports.m
//  QantasAirportDetails
//
//  Created by CQUGSR on 5/03/2017.
//  Copyright © 2017 Tamanna. All rights reserved.
//

#import "Airport.h"

@implementation Airport

-(id)initWithJSONData:(NSDictionary*)data{
        self = [super init];
        if(self){
            
            self.name =  [data valueForKey:@"display_name"];
            self.currency = [data valueForKey:@"currency_code"];
            self.country = [[data valueForKey:@"country"] objectForKey:@"display_name"];
            self.airportTimezone = [data valueForKey:@"timezone"];
            self.latitude = [[data valueForKey:@"location"] objectForKey:@"latitude"];
            self.longitude = [[data valueForKey:@"location"] objectForKey:@"longitude"];
        }
        return self;
        
}

    
@end
