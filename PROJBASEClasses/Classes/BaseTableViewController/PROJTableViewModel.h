//
//  PROJTableViewModel.h
//  PROJProjectA
//
//  Created by 1 on 10/1/20.
//  Copyright © 2020 hausinTec. All rights reserved.
//
// 依赖 YYModel

#import <UIKit/UIKit.h>
#import <YYKit/NSObject+YYModel.h>
@class PROJTableViewSectionModel;
@class PROJTableViewSectionInfoModel;
@class PROJTableViewSectionHeaderFooterModel;
@class PROJTableViewCellModel;

NS_ASSUME_NONNULL_BEGIN

///--------------------------------------------
/// @name PROJTableViewModel
///--------------------------------------------
// 用于描述整个 tableview
@interface PROJTableViewModel : NSObject<YYModel>
@property (nonatomic, strong) id headerModel;
@property (nonatomic, strong) NSMutableArray<PROJTableViewSectionModel *> *sectionModels;
@property (nonatomic, strong) id footerModel;
@end


///--------------------------------------------
/// @name PROJTableViewModel
///--------------------------------------------
// 用于描述整个 section
@interface PROJTableViewSectionModel : NSObject
@property (nonatomic, strong) __kindof PROJTableViewSectionInfoModel *info;
@property (nonatomic, strong) __kindof PROJTableViewSectionHeaderFooterModel *header;
@property (nonatomic, strong) NSMutableArray<PROJTableViewCellModel *> *cells;
@property (nonatomic, strong) __kindof PROJTableViewSectionHeaderFooterModel *footer;
@end

///--------------------------------------------
/// @name PROJTableViewModel
///--------------------------------------------
// 用于描述 section 的基本信息
@interface PROJTableViewSectionInfoModel : NSObject
@property (nonatomic, copy) NSString *sectionID;
@property (nonatomic, copy) NSString *sectionTitle;
@property (nonatomic, copy) NSString *flag;
@property (nonatomic, strong) id data;
@end

///--------------------------------------------
/// @name PROJTableViewModel
///--------------------------------------------
// 用于描述 section 的 header/footer
@interface PROJTableViewSectionHeaderFooterModel : NSObject
@property (nonatomic, copy) NSString *headerFooter_class;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *flag;
@property (nonatomic, strong) id data;
@end

///--------------------------------------------
/// @name PROJTableViewModel
///--------------------------------------------
// 用于描述整个 cell
@interface PROJTableViewCellModel : NSObject
@property (nonatomic, copy) NSString *cell_class;
@property (nonatomic, copy) NSString *destination_controller;
@property (nonatomic, strong) id server_model;
@property (nonatomic, strong) id viewModel;
@end

NS_ASSUME_NONNULL_END
