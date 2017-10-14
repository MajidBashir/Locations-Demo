//
//  LocationObject.m
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import "CarInformationModel.h"

@implementation CarInformationModel
//
- (instancetype)initWithData :(NSDictionary*)dictionary {
    self = [super init];
    if (self) {
        _name    = dictionary[@"name"];
        _address      = dictionary [@"address"];
        _coordinates  = [[Coordinates alloc]initWithArray:dictionary[@"coordinates"]];
        _engineType  = dictionary [@"drive_id"];
        _exterior    = dictionary[@"speed"];
        _fuel    = dictionary[@"fuel"];
        _interior    = dictionary[@"interior"];
        _vin    = dictionary[@"vin"];
    }
    return self;
}


@end
