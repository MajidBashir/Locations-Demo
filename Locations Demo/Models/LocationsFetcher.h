//
//  LocationsFetcher.h
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>


@interface LocationsFetcher : NSObject

- (void)fetchLocations :(void(^)(NSArray *locations, NSError *error))completionBlock;

@end
