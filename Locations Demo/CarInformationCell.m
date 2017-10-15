//
//  CarInformationCell.m
//  Locations Demo
//
//  Created by IOS developer on 10/14/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import "CarInformationCell.h"

@implementation CarInformationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureWithItem :(CarInformationModel *)model{
    self.carNameLabel.text = model.name ? model.name : @"N/A";
    self.carAddressLabel.text = model.address ? model.address : @"N/A";
    self.carEngineTypeLabel.text = model.engineType ? model.engineType : @"N/A" ;
    self.carExteriorLabel.text = model.exterior ? model.exterior : @"N/A";
    self.carInteriorLabel.text = model.interior ? model.interior : @"N/A";
    self.carVinLabel.text = model.vin ? model.vin : @"N/A";
    
}
@end
