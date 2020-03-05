//
//  GTBaseTableViewController.h
//  wheelFactory
//
//  Created by GTY on 2020/3/5.
//  Copyright © 2020 YuGuTou. All rights reserved.
//

#import "GTBaseViewController.h"
#import "MJRefresh.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, BaseTavleViewStyle) {
    BaseTavleViewStylePlain,          // regular table view
    BaseTavleViewStyleGrouped         // preferences style table view
};

@interface GTBaseTableViewController : GTBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MJRefreshNormalHeader *header;
@property (nonatomic, strong) MJRefreshAutoNormalFooter *footer;

@property (nonatomic, strong) UITableView *tableView;



@end

NS_ASSUME_NONNULL_END
