//
//  TExplainViewController.m
//  triangle
//
//  Created by 李永强 on 15/3/6.
//  Copyright (c) 2015年 tongbaotu. All rights reserved.
//

#import "TExplainViewController.h"

@interface TExplainViewController ()

@end

@implementation TExplainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 280, 50)];
    label.text = @"据新浪微博网友爆料，在3月5日上午北京某影院“3.7女生节”促销中，一位被邀请到现场为女生提供取票、咨询等服务的男模突然遭遇“亲密互动”，拉扯间更被撤掉衣服，这一幕在现场引发了不少人围观，并引发网络热议";
    label.numberOfLines = 0;
//   label.backgroundColor = [UIColor grayColor];

    [self.view addSubview:label];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
