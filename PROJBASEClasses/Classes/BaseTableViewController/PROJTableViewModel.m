//
//  PROJTableViewModel.m
//  PROJProjectA
//
//  Created by 1 on 10/1/20.
//  Copyright © 2020 hausinTec. All rights reserved.
//

#import "PROJTableViewModel.h"

@implementation PROJTableViewModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"sections" : PROJTableViewSectionModel.class};
}
@end

@implementation PROJTableViewSectionModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"cells" : PROJTableViewCellModel.class};
}
@end

@implementation PROJTableViewSectionInfoModel
@end

@implementation PROJTableViewSectionHeaderFooterModel
@end

@implementation PROJTableViewCellModel
@end
