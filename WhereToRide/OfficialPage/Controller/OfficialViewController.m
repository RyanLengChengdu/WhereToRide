//
//  OfficialViewController.m
//  WhereToRide
//
//  Created by 冷锐鹏 on 2022/3/28.
//

#import "OfficialViewController.h"

@interface OfficialViewController ()

@end

@implementation OfficialViewController
-(instancetype)init{
    if (self = [super init]) {
        self.tabBarItem.title = @"官方推荐";
        self.tabBarItem.image = [UIImage systemImageNamed:@"map.fill"];
        self.tabBarItem.selectedImage = [UIImage systemImageNamed:@"map.fill"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
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
