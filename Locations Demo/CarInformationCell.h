//
//  CarInformationCell.h
//  Locations Demo
//
//  Created by IOS developer on 10/14/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInformationModel.h"

@interface CarInformationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *carNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *carAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *carEngineTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *carExteriorLabel;
@property (weak, nonatomic) IBOutlet UILabel *carInteriorLabel;
@property (weak, nonatomic) IBOutlet UILabel *carVinLabel;

-(void)configureWithItem :(CarInformationModel *)model;
@end
