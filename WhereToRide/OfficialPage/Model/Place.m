//
//  Place.m
//  WhereToRide
//
//  Created by 冷锐鹏 on 2022/3/28.
//

#import "Place.h"
#import "Comment.h"

@interface Place ()
@property(nonatomic,copy,readwrite)NSString *destination;
//Location数组存放位置信息的经纬坐标
@property(nonatomic,strong)NSArray * location;
//图片信息
@property (nonatomic, strong)NSArray<NSData *> * photos;
//完成人数
@property (nonatomic, assign)NSInteger completeCount;
//喜欢人数
@property (nonatomic, assign)NSInteger likeCount;
//评分
@property (nonatomic, assign)float score;
//评论信息
@property (nonatomic, strong)NSArray<Comment *> *comments;
//目的地描述
@property (nonatomic, copy, readwrite)NSString *descript;

@end

@implementation Place

@end
