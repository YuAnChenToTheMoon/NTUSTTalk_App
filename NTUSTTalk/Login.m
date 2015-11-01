//
//  Login.m
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/19.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];
    _LoginButton.delegate=self;
    [self layout];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if([prefs dictionaryForKey:@"UserData"]==NULL)
    {
        _alert.text=@"登入後才可發文";
    }
    else
    {
        _alert.text=@"您已經登入 可以開始發文囉!";
    }

    // Do any additional setup after loading the view.
}

-(void)layout
{
    [_GreetTitle setFrame:CGRectMake(0, self.view.frame.size.height*0.2, self.view.frame.size.width,self.view.frame.size.height*0.1)];
     [_alert setFrame:CGRectMake(0, self.view.frame.size.height*0.27, self.view.frame.size.width,self.view.frame.size.height*0.1)];
    [_UserPicture setFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.4, self.view.frame.size.width*0.4,self.view.frame.size.width*0.4)];
    [_LoginButton setFrame:CGRectMake(self.view.frame.size.width*0.21, self.view.frame.size.height*0.7, self.view.frame.size.width*0.6,self.view.frame.size.height*0.05)];
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                                                   parameters:nil];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        _UserData=result;
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:_UserData forKey:@"UserData"];
        NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
        [center postNotificationName:@"NotifyUser" object:nil];
        // TODO: handle results or error of request.
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
     NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
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
