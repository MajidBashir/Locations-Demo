//
//  Coordinates.h
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Coordinates : NSObject
@property(nonatomic, strong) NSString *latitude;
@property(nonatomic, strong) NSString *longitude;
@property(nonatomic, strong) NSString *altitude;
@property(nonatomic) CLLocationCoordinate2D mapCoordinates;

- (instancetype)initWithArray:(NSArray*)latLng;

@end
