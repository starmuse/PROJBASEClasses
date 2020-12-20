//
//  PROJBaseTableViewController.m
//  PROJProjectA
//
//  Created by 1 on 10/1/20.
//  Copyright © 2020 hausinTec. All rights reserved.
//

#import "PROJBaseTableViewController.h"
#import <Masonry/Masonry.h>
@interface PROJBaseTableViewController ()

@end

@implementation PROJBaseTableViewController

#pragma mark - viewcontroller life cycle.-
+ (void)load {}
+ (void)initialize {}
- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}
// This is where subclasses should create their custom view hierarchy if they aren't using a nib. Should never be called directly.
- (void)loadView {[super loadView];}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.contentInset = UIEdgeInsetsZero;
}

- (void)viewWillAppear:(BOOL)animated {[super viewWillAppear:animated];}
- (void)viewWillLayoutSubviews {[super viewWillLayoutSubviews];}
- (void)viewDidLayoutSubviews {[super viewDidLayoutSubviews];}
- (void)viewDidAppear:(BOOL)animated {[super viewDidAppear:animated];}
- (void)viewWillDisappear:(BOOL)animated {[super viewWillDisappear:animated];}
- (void)viewDidDisappear:(BOOL)animated {[super viewDidDisappear:animated];}
- (void)dealloc {}
- (void)didReceiveMemoryWarning {}


#pragma mark - UITableViewDataSource.UITableViewDelegate.-
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSAssert1([self respondsToSelector:@selector(proj_tableViewModelForTableViewController)],
              @"Must implement protocol Method (proj_tableViewModelForTableViewController) by %@",
              self.class);
    
    return [self proj_tableViewModelForTableViewController].sectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSAssert1([self respondsToSelector:@selector(proj_tableViewModelForTableViewController)],
              @"Must implemnet protocol Method (proj_tableViewModelForTableViewController) by %@",
              self.class);
    
    return [self proj_tableViewModelForTableViewController].sectionModels[section].cells.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self respondsToSelector:@selector(proj_estimatedHeightForRowAtIndexPath:)]) {
        return [self proj_estimatedHeightForRowAtIndexPath:indexPath];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(proj_estimatedHeightForHeaderInSection:)]) {
        return [self proj_estimatedHeightForHeaderInSection:section];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    if ([self respondsToSelector:@selector(proj_estimatedHeightForFooterInSection:)]) {
        return [self proj_estimatedHeightForFooterInSection:section];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSAssert1([self respondsToSelector:@selector(proj_classesRegistionForCells)],
              @"Must implement protocol Method (proj_classesRegistionForCells) by %@",
              self.class);
    
    PROJTableViewCellModel *cellModel = [self proj_tableViewModelForTableViewController].sectionModels[indexPath.section].cells[indexPath.row];
    NSString *cellClassName = cellModel.cell_class;
    NSString *cellIdentifier = [cellClassName stringByAppendingString:@"_Identifier"];
    Class cellClass = NSClassFromString(cellClassName);
    PROJBaseTableViewCell *cell = (PROJBaseTableViewCell *)cellClass;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.proj_indexPath = indexPath;
    cell.proj_cellModel = cellModel;
    cell.delegate = self;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    PROJTableViewSectionModel *sectionModel = [self proj_tableViewModelForTableViewController].sectionModels[section];
    NSString *headerClassName = sectionModel.header.headerFooter_class;
    if (headerClassName == nil || headerClassName.length == 0) {
        return nil;
    }
    
    Class headerClass = NSClassFromString(headerClassName);
    NSString *headerIdentifier = [headerClassName stringByAppendingString:@"_Identifier"];
    PROJBaseTableViewHeaderFooterView *header = (PROJBaseTableViewHeaderFooterView *)headerClass;
    header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
    
    header.proj_section = section;
    header.proj_headerFooterModel = sectionModel.header;
    header.delegate = self;
    
    return header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    PROJTableViewSectionModel *sectionModel = [self proj_tableViewModelForTableViewController].sectionModels[section];
    NSString *footerClassName = sectionModel.footer.headerFooter_class;
    if (footerClassName == nil || footerClassName.length == 0) {
        return nil;
    }
    
    Class footerClass = NSClassFromString(footerClassName);
    NSString *footerIdentifier = [footerClassName stringByAppendingString:@"_Identifier"];
    PROJBaseTableViewHeaderFooterView *footer = (PROJBaseTableViewHeaderFooterView *)footerClass;
    footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerIdentifier];
    
    footer.proj_section = section;
    footer.proj_headerFooterModel = sectionModel.footer;
    footer.delegate = self;
    
    return footer;
}

#pragma mark - PROJBaseTableViewControllerDataSource.PROJBaseTableViewControllerDelegate.-
// implementated
- (UITableViewStyle)PROJ_tableViewStyle {
    return UITableViewStylePlain;
}


#pragma mark - properties:getters/setters-
- (UITableView *)tableView {
    if (_tableView != nil) return _tableView;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:[self proj_tableViewStyle]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    if (@available(iOS 10.0, *)) {// fetch
    }
    _tableView.prefetchDataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
    _tableView.sectionFooterHeight = UITableViewAutomaticDimension;
    
    // register cell class.
    NSAssert1([self respondsToSelector:@selector(proj_classesRegistionForCells)],
              @"Must implement protocol Method (proj_classesRegistionForCell) by %@",
              self.class);
    NSSet<NSString *> *cellClassNameSet = [NSSet setWithArray:[self proj_classesRegistionForCells]];
    [cellClassNameSet enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, BOOL * _Nonnull stop) {
        Class cellClass = NSClassFromString(obj);
        NSString *cellIdentifier = [obj stringByAppendingString:@"_Identifier"];
        [_tableView registerClass:cellClass forCellReuseIdentifier:cellIdentifier];
    }];
    
    // register sectionheader class.
    if ([self respondsToSelector:@selector(proj_classesRegistionForSectionHeader)]) {
        NSSet<NSString *> *sectionHeaderClassNameSet = [NSSet setWithArray:[self proj_classesRegistionForSectionHeader]];
        [sectionHeaderClassNameSet enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, BOOL * _Nonnull stop) {
            Class sectionHeaderClass = NSClassFromString(obj);
            NSString *sectionHeaderIdentifier = [obj stringByAppendingString:@"_Identifier"];
            [_tableView registerClass:sectionHeaderClass forHeaderFooterViewReuseIdentifier:sectionHeaderIdentifier];
        }];
    }
    
    // register sectionfooter class.
    if ([self respondsToSelector:@selector(proj_classesRegistionForSectionFooter)]) {
        NSSet<NSString *> *sectionFooterClassNameSet = [NSSet setWithArray:[self proj_classesRegistionForSectionFooter]];
        [sectionFooterClassNameSet enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, BOOL * _Nonnull stop) {
            Class sectionFooterClass = NSClassFromString(obj);
            NSString *sectionFooterIdentifier = [obj stringByAppendingString:@"_Identifier"];
            [_tableView registerClass:sectionFooterClass forHeaderFooterViewReuseIdentifier:sectionFooterIdentifier];
        }];
    }
    
    
    return _tableView;
}



@end
