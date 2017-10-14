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
    self.carNameLabel.text = model.name;
    self.carAddressLabel.text = model.address;
    self.carEngineTypeLabel.text = model.engineType;
    self.carExteriorLabel.text = model.exterior;
    self.carInteriorLabel.text = model.interior;
    self.carVinLabel.text = model.vin;
    
}
@end
