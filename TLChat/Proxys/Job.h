//
//  Job.h
//  TLChat
//
//  Created by 戴王炯 on 4/30/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "TLBaseDataModel.h"

@interface Job : TLBaseDataModel
/// ID
@property (nonatomic, strong) NSString *jobID;
/// 名字
@property (nonatomic, strong) NSString *name;
// 图标
@property (nonatomic, strong) NSString *iconPath;

#pragma mark - 列表用
/**
 *  拼音
 *
 *  来源：备注 > 昵称 > 用户名
 */
@property (nonatomic, strong) NSString *pinyin;

@property (nonatomic, strong) NSString *pinyinInitial;
@end
