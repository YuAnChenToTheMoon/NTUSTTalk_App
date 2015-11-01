//
//  ContollCenterViewController.m
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/19.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import "ContollCenterViewController.h"
#import "PostnavigationViewController.h"
#import "PostTableViewController.h"
#import "Login.h"
@interface ContollCenterViewController ()
@end

@implementation ContollCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(NotifyUser)
                   name:@"NotifyUser"
                 object:nil];
    // Do any additional setup after loading the view.
}

-(void)NotifyUser
{
    PostnavigationViewController* Postnavigation=(PostnavigationViewController*)[self viewControllers][0];
    PostTableViewController*PostTableView=(PostTableViewController*)Postnavigation.viewControllers[0];
    Login* login=(Login*)[self viewControllers][1];
    PostTableView.UserData=login.UserData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)refresh:(NSString*)item
{
    PostnavigationViewController *Postnavigation=(PostnavigationViewController*)[self viewControllers][0];
    PostTableViewController*PostTableView=(PostTableViewController*)Postnavigation.viewControllers[0];
    PostTableView.navigationItem.title=item;
    [PostTableView Refresh];
    
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
