//
//  Login.h
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/19.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface Login : ViewController<FBSDKLoginButtonDelegate>
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *LoginButton;
@property (strong, nonatomic) IBOutlet FBSDKProfilePictureView *UserPicture;
@property (strong, nonatomic) IBOutlet UILabel *GreetTitle;
@property (strong, nonatomic) IBOutlet UILabel *alert;
@property (strong,nonatomic) NSDictionary* UserData;
@end
