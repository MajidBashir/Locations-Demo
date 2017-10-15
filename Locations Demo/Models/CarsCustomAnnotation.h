//
//  LocationPins.h
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
@interface CarsCustomAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    
}
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy, nullable) NSString *title;
@property (nonatomic, readonly, copy, nullable) NSString *subtitle;

- (id _Nullable )initWithLocation:(CLLocationCoordinate2D)coord title:(nullable NSString *)title subtitle:(nullable NSString *)subtitle;

@end
