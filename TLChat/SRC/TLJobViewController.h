//
//  TLJobViewController.h
//  TLChat
//
//  Created by 戴王炯 on 4/21/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLMessageManager+ConversationRecord.h"
#import "JobSearchViewController.h"
#import "CompanyListViewController.h"
#import "SchoolListViewController.h"
#import "BannerView.h"
#import "ShareHelper.h"
#import "TLJobHelper.h"
//#import "TLMenuViewController.h"

@interface TLJobViewController : TLTableViewController

@property (nonatomic, strong) UISegmentedControl *uiSC;

@property (nonatomic, strong) CompanyListViewController *companyListVC;
@property (nonatomic, strong) SchoolListViewController *schoolListVC;
@property (nonatomic, strong) JobSearchViewController *searchVC;

@property (nonatomic,strong) ShareHelper *shareHelper;

@property (nonatomic,strong) TLJobHelper *jobHelper;

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) BannerView *bannerView;

@end
