//
//  OfficialViewController.m
//  WhereToRide
//
//  Created by 冷锐鹏 on 2022/3/28.
//

#import "OfficialViewController.h"
#import "Masonry.h"
#import "QiCardView.h"
#import "QiCardCell.h"
@interface OfficialViewController ()<QiCardViewDataSource,QiCardViewDelegate>
@property(nonatomic,strong)UIButton *settingBtn;
@property(nonatomic,strong)UILabel *today_task_label;
@property(nonatomic,strong)UIImageView *user_logo_imageView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIView *viewContainer;
@property(nonatomic,strong)QiCardView *cardView;
//唯一子view
@property(nonatomic,strong)UIView *view1;
@end

@implementation OfficialViewController
-(instancetype)init{
    if (self = [super init]) {
        self.tabBarItem.title = @"星选";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_icon_official"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_icon_official"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:({
        _settingBtn = [[UIButton alloc]init];
        [_settingBtn setImage:[UIImage imageNamed:@"setting_button_image"] forState:UIControlStateNormal];
        _settingBtn.userInteractionEnabled = YES;
        _settingBtn;
    })];
    [_settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(15);
        make.top.equalTo(self.mas_topLayoutGuideBottom).with.offset(0);
    }];
    
    [self.view addSubview:({
        _today_task_label = [[UILabel alloc]init];
        _today_task_label.text = @"今日任务";
        _today_task_label.font = [UIFont systemFontOfSize:36];
        _today_task_label.textColor = [UIColor whiteColor];
        _today_task_label;
    })];
    [_today_task_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_settingBtn.mas_left).with.offset(0);
        make.top.equalTo(_settingBtn.mas_bottom).with.offset(20);
    }];
    
    [self.view addSubview:({
        _user_logo_imageView = [[UIImageView alloc]init];
        _user_logo_imageView.image = [UIImage imageNamed:@"user_logo"];
        _user_logo_imageView;
    })];
    [_user_logo_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_settingBtn.mas_top);
        make.right.equalTo(self.view.mas_right).with.offset(-21);
    }];
    
    [self.view addSubview:({
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.backgroundColor = [UIColor lightGrayColor];
        _scrollView.layer.cornerRadius = 20;
        _scrollView;
    })];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_today_task_label.mas_bottom).with.offset(5);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    //scrollview的唯一subView
    [_scrollView addSubview:({
        _viewContainer = [[UIView alloc]init];
        _viewContainer;
    })];
    [_viewContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_scrollView);
        make.width.equalTo(_scrollView);
    }];
    
    [_viewContainer addSubview:({
        _cardView = [[QiCardView alloc]initWithFrame:CGRectMake(25.0, 22.67, self.view.frame.size.width - 50.0, 150)];
        _cardView.dataSource = self;
        _cardView.delegate = self;
        _cardView.visibleCount = 3;
        _cardView.lineSpacing = 15.0;
        _cardView.interitemSpacing = 10.0;
        _cardView.maxAngle = 10.0;
        _cardView.isAlpha = YES;
        _cardView.maxRemoveDistance = 100.0;
        _cardView.layer.cornerRadius = 10.0;
        //_cardView.backgroundColor = [UIColor whiteColor];
        [_cardView registerClass:[QiCardCell class] forCellReuseIdentifier:@"cardCell"];
        _cardView;
    })];
    [_cardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_viewContainer.mas_left).with.offset(15);
        make.top.equalTo(_viewContainer.mas_top).with.offset(15);
        make.right.equalTo(_viewContainer.mas_right).with.offset(-15);
        make.height.equalTo(self.view).multipliedBy(0.25);
    }];
    
    
    //last View
    [_viewContainer addSubview:({
        _view1 = [[UIView alloc]init];
        _view1.backgroundColor = [UIColor orangeColor];
        _view1;
    })];
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cardView.mas_bottom).with.offset(20);
        make.left.equalTo(_scrollView).with.offset(20);
        make.right.equalTo(_scrollView).with.offset(-20);
        make.height.equalTo(self.view).multipliedBy(2);
        make.bottom.equalTo(_viewContainer).with.offset(-20);
    }];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:44.0/255 green:44.0/255 blue:44.0/255 alpha:1]];
    
}

#pragma mark - QiCardViewDelegate

- (void)cardView:(QiCardView *)cardView didRemoveLastCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    [cardView reloadDataAnimated:YES];
}

- (void)cardView:(QiCardView *)cardView didRemoveCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    NSLog(@"didRemoveCell forRowAtIndex = %ld", index);
}

- (void)cardView:(QiCardView *)cardView didDisplayCell:(QiCardViewCell *)cell forRowAtIndex:(NSInteger)index {
    
    NSLog(@"didDisplayCell forRowAtIndex = %ld", index);
    
    NSLog(@"currentFirstIndex = %ld",cardView.currentFirstIndex);
    NSLog(@"%ld",index);
}

- (void)cardView:(QiCardView *)cardView didMoveCell:(QiCardViewCell *)cell forMovePoint:(CGPoint)point {
//    NSLog(@"move point = %@", NSStringFromCGPoint(point));
}
#pragma mark - QiCardViewDataSource

- (QiCardCell *)cardView:(QiCardView *)cardView cellForRowAtIndex:(NSInteger)index {
    QiCardCell *cell = [cardView dequeueReusableCellWithIdentifier:@"cardCell"];
    
    cell.layer.cornerRadius = 10.0;
    cell.layer.masksToBounds = YES;
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (NSInteger)numberOfCountInCardView:(UITableView *)cardView {
    return 3;
}
@end
