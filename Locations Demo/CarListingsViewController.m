//
//  CarListingsViewController.m
//  Locations Demo
//
//  Created by IOS developer on 10/14/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import "CarListingsViewController.h"
#import "CarInformationCell.h"
#import "CarInformationModel.h"
#import "DataManager.h"


@interface CarListingsViewController ()

@property(strong,nonatomic) NSArray *allListings;
@property (weak, nonatomic) IBOutlet UITableView *CarListingTableview;

@end

@implementation CarListingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataUpdated:)
                                                 name:@"MyDataUpdatedNotification"
                                               object:nil];

}

-(void)dataUpdated:(NSNotification*)notification {
    
    self.allListings = [[NSArray alloc]initWithArray: [[DataManager sharedManager] completeData]];
    [self.CarListingTableview reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Tableview data source and delegates
#pragma mark -


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    static NSString *identifier = @"CarInformationCellIdentifier";
    CarInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                               forIndexPath:indexPath];
    CarInformationModel *model = self.allListings[indexPath.row];
    [cell configureWithItem:model];

    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allListings.count;
}

@end
