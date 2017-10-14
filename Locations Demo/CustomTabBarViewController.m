//
//  CustomTabBarViewController.m
//  Locations Demo
//
//  Created by IOS developer on 10/14/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "DataManager.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DataManager *datamanger = [DataManager sharedManager];
    if (!datamanger.isDataUpdated) {
        [datamanger fetchdata];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
