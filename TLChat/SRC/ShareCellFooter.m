//
//  ShareCellFooter.m
//  TLChat
//
//  Created by 戴王炯 on 4/25/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ShareCellFooter.h"
@interface ShareCellFooter()



@property (nonatomic, readwrite)int left;
@property (nonatomic, readwrite)int mid;
@property (nonatomic, readwrite)int right;
@property (nonatomic,strong) NSDictionary *origin;

@property (nonatomic,strong) NSDictionary *click;

@end
@implementation ShareCellFooter

-(ShareCellFooter *)init{
    if (self = [super init]) {
        self.leftImage = [UIImage imageNamed:@"share"];
        self.midImage = [UIImage imageNamed:@"collect"];
        self.rightImage = [UIImage imageNamed:@"like"];
        self.leftLabel = [[UILabel alloc]init];
        self.midLabel = [[UILabel alloc]init];
        self.rightLabel = [[UILabel alloc]init];
        self.leftLabel.attributedText = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%d",self.left] attributes:self.origin];
        self.midLabel.attributedText = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%d",self.mid] attributes:self.origin];
        self.rightLabel.attributedText = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%d",self.right] attributes:self.origin];
    }
    return self;
}

-(NSDictionary *)origin{
    if (!_origin) {
        _origin = @{
                    NSFontAttributeName:[UIFont systemFontOfSize:14],
                    NSForegroundColorAttributeName:[UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1]
                    };
    }
    return _origin;
}

-(NSDictionary *)click{
    if (!_click) {
        _click = @{
                    NSFontAttributeName:[UIFont systemFontOfSize:14],
                    NSForegroundColorAttributeName:[UIColor blueColor]
                    };
    }
    return _click;
}

-(int)left{
    if (!_left) {
        _left = 211;
    }
    return _left;
}

-(int)mid{
    if (!_mid) {
        _mid = 211;
    }
    return _mid;
}

-(int)right{
    if (!_right) {
        _right = 211;
    }
    return _right;
}
@end
