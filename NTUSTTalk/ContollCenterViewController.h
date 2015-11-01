//
//  ContollCenterViewController.h
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/19.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContollCenterViewController : UITabBarController
@property(strong,nonatomic)NSString* item;
-(void)refresh:(NSString*)item;
@end
