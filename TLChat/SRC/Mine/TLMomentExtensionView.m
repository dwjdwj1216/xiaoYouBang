//
//  TLMomentExtensionView.m
//  TLChat
//
//  Created by 戴王炯 on 5/1/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLMomentExtensionView.h"
#import "TLMomentExtensionView+TableView.h"

#define     EDGE_HEADER     5.0f

@interface TLMomentExtensionView ()

@property (nonatomic, strong) UITableView *tableView;

@end
@implementation TLMomentExtensionView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).mas_offset(EDGE_HEADER);
            make.left.and.right.mas_equalTo(self);
            make.bottom.mas_equalTo(self).priorityLow();
        }];
        
        [self registerCellForTableView:self.tableView];
    }
    return self;
}

- (void)setExtension:(TLMomentExtension *)extension
{
    _extension = extension;
    [self.tableView reloadData];
}

- (void)drawRect:(CGRect)rect
{
    CGFloat startX = 20;
    CGFloat startY = 0;
    CGFloat endY = EDGE_HEADER;
    CGFloat width = 6;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, startX, startY);
    CGContextAddLineToPoint(context, startX + width, endY);
    CGContextAddLineToPoint(context, startX - width, endY);
    CGContextClosePath(context);
    [[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:245.0/255.0 alpha:1.0] setFill];
    [[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:245.0/255.0 alpha:1.0]setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark - # Getter -
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_tableView setBackgroundColor:[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:245.0/255.0 alpha:1.0]];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setScrollsToTop:NO];
        [_tableView setScrollEnabled:NO];
    }
    return _tableView;
}
@end
