//
//  PROJBaseTableViewCell.m
//  PROJProjectA
//
//  Created by 1 on 10/1/20.
//  Copyright © 2020 hausinTec. All rights reserved.
//

#import "PROJBaseTableViewCell.h"

@implementation PROJBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self == nil) return nil;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self override_configSubviews];
    
    return self;
}

- (void)override_configSubviews {}

@end
