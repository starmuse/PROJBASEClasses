//
//  PROJBaseTableViewCell.h
//  PROJProjectA
//
//  Created by 1 on 10/1/20.
//  Copyright © 2020 hausinTec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PROJTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

///--------------------------------------------
/// @name PROJBaseTableViewCell
///--------------------------------------------
@interface PROJBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) NSIndexPath *proj_indexPath;// 当前 cell 所处的 indexPath
@property (nonatomic, strong) __kindof PROJTableViewCellModel *proj_cellModel;// 持有一个 PROJTableViewCellModel 类型的 cellModel
@property (nonatomic, weak) id delegate;// 由子类覆写，已经交由tableviewcontroller


- (void)override_configSubviews;

@end

NS_ASSUME_NONNULL_END
