//
//  Airports.h
//  QantasAirportDetails
//
//  Created by CQUGSR on 5/03/2017.
//  Copyright © 2017 Tamanna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Airport : NSObject

    @property (nonatomic, strong)NSString *name;
    @property (nonatomic, strong)NSString *currency;
    @property (nonatomic, strong)NSString *country;
    @property (nonatomic, strong)NSString *airportTimezone;
    @property (nonatomic, strong) NSNumber *latitude;
    @property (nonatomic, strong) NSNumber *longitude;
    
-(id)initWithJSONData:(NSDictionary*)data;
    
@end
