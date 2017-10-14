//
//  DataManager.h
//  Locations Demo
//
//  Created by IOS developer on 10/14/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#define DATA_MANAGER_UPDATE_NOTIFICATION  @"DataUpdatedNotification"
#import <Foundation/Foundation.h>

@interface DataManager : NSObject {
    NSArray *completeData;
}

@property (nonatomic, strong) NSArray *completeData;
@property (nonatomic, assign) BOOL isDataUpdated;
+ (id)sharedManager;
- (void)fetchdata;
@end
