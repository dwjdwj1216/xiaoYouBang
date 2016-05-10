//
//  ContentCellHelper.m
//  TLChat
//
//  Created by 戴王炯 on 4/28/16.
//  Copyright © 2016 李伯坤. All rights reserved.
//

#import "ContentCellHelper.h"
#import "ContentItem.h"

@implementation ContentCellHelper

- (id) init
{
    if (self = [super init]) {
        self.contentData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void) p_initTestData
{
    ContentItem *item0 = [ContentItem createMenuWithiconPath:nil name:nil content:nil time:nil type:nil];
    ContentItem *item1 = [ContentItem createMenuWithiconPath:@"user1" name:@"insomnium" content:@"阿里是一家非常注重企业文化的公司，公司环境也是一流的，同事间互相理解，在阿里，你要找个人，直接内网搜名字，5秒钟内可以联系到ta。你要办一件事，联系相关人员，亲切解答，甚至直接到你的工位上解决你的问题。" time:@"2016-4-22" type:@"职员评价"];
    ContentItem *item2 = [ContentItem createMenuWithiconPath:@"user2" name:@"鸟叔" content:@"在淘宝城实习一段时间。说说我的看法。关于自然环境方面。已经有辣么多图了。就不说了。自然环境固然重要，但是社会环境也必不可少。食堂排队，要是插队，就等着周围人奋起攻之吧。食堂大，人多而不乱。\r大家平等互爱相互理解。\r实在是工作、生活的好居处~~" time:@"2016-4-19" type:@"职员评价"];
    ContentItem *item3 = [ContentItem createMenuWithiconPath:@"user3" name:@"kb0bk" content:@"阿里加班还行吧，周一到周五肯定要在晚上10之后才回去，周六、周日自己可以选择，没事干可以来公司还管饭。但是我认为加班跟阿里无关，作为一个幸运的菜鸟，我深知阿里同届太多比我强的牛人，加上岗位的拥抱变化，我如果不努力可能连试用期都危险（当然这里试用期是按照我自己要求的标准，阿里试用期应该还是很轻松的），所以加班是我自己的选择。" time:@"2016-4-18" type:@"职员评价"];
    [self.contentData addObjectsFromArray:@[@[item0,item1,item2,item3]]];
}

@end
