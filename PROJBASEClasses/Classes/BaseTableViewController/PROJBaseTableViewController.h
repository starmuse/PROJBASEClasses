//
//  PROJBaseTableViewController.h
//  PROJProjectA
//
//  Created by 1 on 10/1/20.
//  Copyright © 2020 hausinTec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PROJBaseViewController.h"

#import "PROJTableViewModel.h"
#import "PROJBaseTableViewHeaderFooterView.h"
#import "PROJBaseTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN


///--------------------------------------------
/// @name PROJBaseTableViewControllerDataSource
///--------------------------------------------
@protocol PROJBaseTableViewControllerDataSource <NSObject>

@required
- (NSArray<NSString *> *)proj_classesRegistionForCells;// 提供 tableview 所需要的所有 cell 类型数组
- (__kindof PROJTableViewModel *)proj_tableViewModelForTableViewController;// 提供 tableview 所有要的 tableviewmodel.

@optional
- (UITableViewStyle)proj_tableViewStyle;
- (NSArray<NSString *> *)proj_classesRegistionForSectionHeader;
- (NSArray<NSString *> *)proj_classesRegistionForSectionFooter;

- (CGFloat)proj_estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(ios(7.0));
- (CGFloat)proj_estimatedHeightForHeaderInSection:(NSInteger)section API_AVAILABLE(ios(7.0));
- (CGFloat)proj_estimatedHeightForFooterInSection:(NSInteger)section API_AVAILABLE(ios(7.0));

@end

///--------------------------------------------
/// @name PROJBaseTableViewControllerDelegate
///--------------------------------------------
@protocol PROJBaseTableViewControllerDelegate <NSObject>

@end



///--------------------------------------------
/// @name PROJBaseTableViewController
///--------------------------------------------
@interface PROJBaseTableViewController : PROJBaseViewController
<UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching,
PROJBaseTableViewControllerDataSource, PROJBaseTableViewControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
