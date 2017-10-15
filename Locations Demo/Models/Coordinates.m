//
//  Coordinates.m
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import "Coordinates.h"

@implementation Coordinates

- (instancetype)initWithArray:(NSArray*)latLng{
    self = [super init];
    if (self) {
        self.latitude = [latLng[1] doubleValue];
        self.longitude = [latLng[0] doubleValue];
        self.altitude = [latLng[2] doubleValue];
    }
    return self;
}
- (CLLocationCoordinate2D)mapCoordinates {
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}
@end
