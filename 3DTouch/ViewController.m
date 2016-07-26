//
//  ViewController.m
//  3DTouch
//
//  Created by 超级腕电商 on 16/5/9.
//  Copyright © 2016年 super. All rights reserved.
//

#import "ViewController.h"
#import <SafariServices/SafariServices.h>
#define URL @"http://weibo.com/5726013703/profile?topnav=1&wvr=6&is_all=1"
@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property(nonatomic, strong)UILabel *weiboLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    //固定这么写
    [self showViewController:viewControllerToCommit sender:self];
}

-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    //location就是重压点坐标,如果按压点在label上执行以下方法
    if (location.x > 100 && location.x < 200 && location.y > 100 && location.y < 200) {
        SFSafariViewController *mySV = [[SFSafariViewController alloc]initWithURL:[NSURL URLWithString:URL]];
        //第一次按压时,弹出的窗口尺寸,再次按压则跳转到mySV
        mySV.preferredContentSize = CGSizeMake(0, 400);
          previewingContext.sourceRect = _weiboLabel.frame;//设置高亮区域
        return mySV;
    }
    return nil;
}

-(void)loadView
{
    [super loadView];
    _weiboLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _weiboLabel.text = @"我的微博";
    [self.view addSubview:_weiboLabel];
    //注册代理
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
