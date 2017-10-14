//
//  LocationsFetcher.m
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import "LocationsFetcher.h"
#import "CarInformationModel.h"


#define URL_STRING @"http://data.m-tribes.com/locations"


@implementation LocationsFetcher

- (void)fetchLocations :(void(^)(NSArray *locations, NSError *error))completionBlock {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSMutableArray *allElements = [[NSMutableArray alloc]init];
    
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [manager GET:URL_STRING
          parameters:nil
            progress:nil
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 NSDictionary *reponse = (NSDictionary*)responseObject;
                 NSArray *placemarks = reponse[@"placemarks"];
                 for (NSDictionary *data in placemarks) {
                     CarInformationModel *lData= [[CarInformationModel alloc]initWithData:data];
                     [allElements addObject:lData];
                 }
                 if (completionBlock) {
                     completionBlock(allElements,nil);
                 }
             } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 if (completionBlock)
                     completionBlock (nil, error);
             }];
    });
    
}

@end
