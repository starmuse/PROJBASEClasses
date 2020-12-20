//
//  PROJBaseTableViewHeaderFooterView.h
//  PROJProjectA
//
//  Created by 1 on 10/1/20.
//  Copyright © 2020 hausinTec. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PROJTableViewModel.h"

NS_ASSUME_NONNULL_BEGIN

///--------------------------------------------
/// @name PROJBaseTableViewHeaderFooterView
///--------------------------------------------
@interface PROJBaseTableViewHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, assign) NSInteger proj_section;
@property (nonatomic, strong) __kindof PROJTableViewSectionHeaderFooterModel *proj_headerFooterModel;
@property (nonatomic, weak) id delegate;

@end

NS_ASSUME_NONNULL_END
