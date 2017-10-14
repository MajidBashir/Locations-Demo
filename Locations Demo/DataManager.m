//
//  DataManager.m
//  Locations Demo
//
//  Created by IOS developer on 10/14/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//



#import "DataManager.h"
#import "LocationsFetcher.h"

@implementation DataManager

@synthesize completeData;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static DataManager *sharedDataManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataManager = [[self alloc] init];
    });
    return sharedDataManager;
}


- (void)fetchdata {
    self.isDataUpdated = false;
    self.completeData  = [[NSArray alloc]init];
    LocationsFetcher *locFetcher = [[LocationsFetcher alloc]init];
    [locFetcher fetchLocations:^(NSArray *locations, NSError *error) {
        if (!error) {
            self.completeData = locations;
            self.isDataUpdated = true;
            [[NSNotificationCenter defaultCenter] postNotificationName:DATA_MANAGER_UPDATE_NOTIFICATION object:nil];
        }
    }];
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

@end
