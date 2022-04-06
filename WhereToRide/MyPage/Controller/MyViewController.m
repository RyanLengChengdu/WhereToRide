//
//  MyViewController.m
//  WhereToRide
//
//  Created by 冷锐鹏 on 2022/3/28.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController
-(instancetype)init{
    if (self = [super init]) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.title = @"星选";
        self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_icon_my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_my"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
