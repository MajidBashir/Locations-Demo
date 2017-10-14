//
//  LocationPins.m
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import "LocationPins.h"

@implementation LocationPins
@synthesize coordinate;

- (id)initWithLocation:(CLLocationCoordinate2D)coord title:(NSString *)title subtitle:(NSString *)subtitle {
    self = [super init];
    if (self) {
        coordinate = coord;
        _title = title;
        _subtitle = subtitle;
    }
    return self;
}

@end
