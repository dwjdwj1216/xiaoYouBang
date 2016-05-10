//
//  TLMomentsViewController+Proxy.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMomentsViewController+Proxy.h"

@implementation TLMomentsViewController (Proxy)
- (void)loadData
{
    self.data = [NSMutableArray arrayWithArray:self.proxy.testData];
    [self.tableView reloadData];
}
@end
