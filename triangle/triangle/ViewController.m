//
//  ViewController.m
//  triangle
//
//  Created by 李永强 on 15/3/6.
//  Copyright (c) 2015年 tongbaotu. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "TExplainViewController.h"
#import "WYPopoverController.h"
@interface ViewController () <WYPopoverControllerDelegate>
{
    TExplainViewController * myEvplainViewController ;
    WYPopoverController * myPopoverController ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    CustomView * myCustomView = [[CustomView alloc]initWithFrame:CGRectMake(100, 200, 200, 400)];
//    [self.view addSubview:myCustomView];
    UIButton * sender = [[UIButton alloc]initWithFrame:CGRectMake(100, 500, 100, 40)];

    [sender setTitle:@"showButton" forState:UIControlStateNormal];
    [sender setBackgroundColor:[UIColor grayColor]];
    [sender addTarget:self action:@selector(onClickSenderEvent:) forControlEvents:UIControlEventTouchUpInside];
     [self.view addSubview:sender];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)onClickSenderEvent:(UIButton *)sender
{
    if (myPopoverController != nil) {
        [self onClickDone:nil];
        return ;
    }
    myEvplainViewController = [[TExplainViewController alloc]init];
    myEvplainViewController.preferredContentSize = CGSizeMake(280, 50);
    myPopoverController = [[WYPopoverController alloc]initWithContentViewController:myEvplainViewController];
    myPopoverController.delegate = self ;
    myPopoverController.wantsDefaultContentAppearance = YES;
    myPopoverController.passthroughViews = @[sender];
       myPopoverController.popoverLayoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
    [myPopoverController presentPopoverFromRect:sender.bounds inView:sender permittedArrowDirections:WYPopoverArrowDirectionAny animated:YES options:WYPopoverAnimationOptionScale];


}
-(void)onClickDone:(UIButton *)sender
{
    [myPopoverController dismissPopoverAnimated:YES];
    myPopoverController.delegate = nil;
    myPopoverController = nil;
}

#pragma mark - WYPopoverControllerDelegate

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller
{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    myPopoverController = nil ;
 
}
@end
