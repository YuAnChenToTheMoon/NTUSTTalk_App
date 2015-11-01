//
//  classfication.m
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/19.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import "classfication.h"
#import "UIViewController+REFrostedViewController.h"
#import "ContollCenterViewController.h"


@interface classfication ()

@end

@implementation classfication
{
    NSArray *Items;
}

- (void)viewDidLoad {
    Items=[NSArray arrayWithObjects:@"活動宣傳",@"爆卦",@"失物招領",@"填問卷",@"心情",@"美食",@"租屋資訊", nil];
    [super viewDidLoad];
    [self layout];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)layout
{
    self.tableView.backgroundColor= [UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    self.tableView.separatorColor=[UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [Items count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor =[UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    cell.backgroundColor = [UIColor colorWithRed:255/255.0 green:0/255.0 blue:0/255.0 alpha:0.1];
    // Configure the cell...
    cell.textLabel.text=[Items objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   ContollCenterViewController* Center= (ContollCenterViewController*)self.frostedViewController.contentViewController;
    [self.frostedViewController hideMenuViewController];
    [Center refresh:Items[indexPath.row]];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
