//
//  LocationObject.h
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinates.h"

@interface CarInformationModel : NSObject

/*
 {
 "address": "Grosse ReichenstraÃŸe 7, 20457 Hamburg",
 "coordinates": [
 9.99622,
 53.54847,
 0
 ],
 "engineType": "CE",
 "exterior": "UNACCEPTABLE",
 "fuel": 45,
 "interior": "GOOD",
 "name": "HH-GO8480",
 "vin": "WME4513341K412697"
 }
 */

@property(nonatomic, strong)  NSString *name;
@property(nonatomic, strong)  NSString *address;
@property(nonatomic, strong)  Coordinates *coordinates;
@property(nonatomic, strong)  NSString *vin;
@property(nonatomic, strong)  NSString *fuel;
@property(nonatomic, strong)  NSString *engineType;
@property(nonatomic, strong)  NSString *exterior;
@property(nonatomic, strong)  NSString *interior;

- (instancetype)initWithData :(NSDictionary*)dictionary;

@end
