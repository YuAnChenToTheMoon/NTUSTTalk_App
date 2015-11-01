//
//  PostTableViewController.h
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/19.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface PostTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)classfication:(UIBarButtonItem *)sender;
@property (strong,nonatomic) UIRefreshControl *RefreshControl;
@property (strong,nonatomic) NSDictionary* UserData;
@property (strong, nonatomic) IBOutlet UITableView *PostTableView;
@property(strong,nonatomic)REFrostedViewController *rootViewController;
- (IBAction)SendPost:(UIBarButtonItem *)sender;
-(void)FetchData;
-(void)Refresh;
@end


