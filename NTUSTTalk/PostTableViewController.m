//
//  PostTableViewController.m
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/19.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import "PostTableViewController.h"
#import "PostCell.h"
#import "SendPostNavigationViewController.h"
#import "SendPostViewController.h"

@interface PostTableViewController ()

@end

@implementation PostTableViewController
{
    NSMutableArray *Posts;
    UIAlertView *alertView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _PostTableView.delegate=self;
    _PostTableView.dataSource=self;
    [self layout];
    [self ResumeUser];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)ResumeUser
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    _UserData=[prefs dictionaryForKey:@"UserData"];
    self.navigationItem.title=@"活動宣傳";
    [self Refresh];
}

-(void)Refresh
{
    [self FetchData];
    _PostTableView.hidden=YES;
    alertView = [[UIAlertView alloc] initWithTitle:nil message:@"載入貼文中\n請保持網路暢通" delegate:nil cancelButtonTitle:nil otherButtonTitles: nil];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator startAnimating];
    [alertView setValue:indicator forKey:@"accessoryView"];
    [alertView show];

}

-(void)layout
{
    _RefreshControl = [[UIRefreshControl alloc] init];
    [_RefreshControl addTarget:self action:@selector(FetchData)
                  forControlEvents:UIControlEventValueChanged];
    [_PostTableView addSubview:_RefreshControl]; //把RefreshControl加到TableView中
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SendPostNavigationViewController *SendPostViewNavagation=(SendPostNavigationViewController*)segue.destinationViewController;
    SendPostViewController* SendPostView=(SendPostViewController*)[SendPostViewNavagation viewControllers][0];
    SendPostView.classification=self.navigationItem.title;
    SendPostView.UserData=_UserData;
    SendPostView.delegate=self;
}

- (IBAction)SendPost:(UIBarButtonItem *)sender {
    if(_UserData==NULL)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"尚未登入\n登入後才可發文"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
   else
   {
       [self performSegueWithIdentifier:@"SendPost" sender:nil];
   }

}

-(void)FetchData
{
    NSURL *aUrl = [NSURL URLWithString:@"http://130.211.247.67:8000/read_post/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:20.0];
    
    [request setHTTPMethod:@"POST"];
    NSString *postString=[NSString stringWithFormat:@"classification=%@",self.navigationItem.title];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSMutableArray *testFeeds = [NSJSONSerialization JSONObjectWithData: data options:NSJSONReadingMutableContainers error:nil];
        Posts=testFeeds;
         [_RefreshControl endRefreshing];
         [_PostTableView reloadData];
        _PostTableView.hidden=NO;
         [alertView dismissWithClickedButtonIndex:0 animated:YES];
    }];
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
    return [Posts count];;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"forIndexPath:indexPath];
    [cell layout];
    NSDictionary *post=Posts[indexPath.row];
    cell.Name.text=[post valueForKey:@"作者"];
    cell.Date.text=[post valueForKey:@"日期"];
    cell.Post_Content.text=[post valueForKey:@"內容"];
    [cell.Post_Content sizeToFit];
    cell.classfication.text=self.navigationItem.title;
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=normal",[post valueForKey:@"User_ID"]]];
        //Do EXTREME PROCESSING!!!
    NSData  *data = [NSData dataWithContentsOfURL:url];
    cell.UserPicture.image = [UIImage imageWithData:data];
    // Configure the cell...
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *post=Posts[indexPath.row];
    CGRect rectToFit = [[post valueForKey:@"內容"] boundingRectWithSize:CGSizeMake(_PostTableView.frame.size.width*0.78, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0f]} context:nil];
    return rectToFit.size.height+62.0f;
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

- (IBAction)classfication:(UIBarButtonItem *)sender {
    [self.frostedViewController presentMenuViewController];
}
@end
