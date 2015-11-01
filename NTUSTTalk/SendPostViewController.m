//
//  SendPostViewController.m
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/21.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import "SendPostViewController.h"

@interface SendPostViewController ()

@end

@implementation SendPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layout];
    // Do any additional setup after loading the view.
}

-(BOOL)automaticallyAdjustsScrollViewInsets
{
    return NO;
}
-(void)layout
{
    _Post_Content.layer.borderColor = [UIColor blackColor].CGColor;
    _Post_Content.layer.borderWidth =1.0;
    _Post_Content.layer.cornerRadius =5.0;
    [_Post_Content setFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.2, self.view.frame.size.width*0.8, self.view.frame.size.width*0.6)];
    self.navigationItem.title=_classification;
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

- (IBAction)PostSend:(UIBarButtonItem *)sender {
     [self SendData];
}

- (IBAction)Cancel:(UIBarButtonItem *)sender {
     [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}

-(void)SendData
{
    NSURL *aUrl = [NSURL URLWithString:@"http://130.211.247.67:8000/write_post/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request setHTTPMethod:@"POST"];
    NSString *postString=[NSString stringWithFormat:@"Post_Content=%@&author=%@&date=%@&classification=%@&User_ID=%@",_Post_Content.text,[_UserData valueForKey:@"name"],[self getCurrentTime],_classification,[_UserData valueForKey:@"id"]];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSLog(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        [_delegate Refresh];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }];

}

-(NSString*)getCurrentTime{
    NSDate *currentTime = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *resultString = [dateFormatter stringFromDate: currentTime];
    return resultString;
}


@end
