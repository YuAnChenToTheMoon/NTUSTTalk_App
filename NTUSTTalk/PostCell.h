//
//  PostCell.h
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/21.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *UserPicture;
@property (strong, nonatomic) IBOutlet UILabel *Name;
@property (strong, nonatomic) IBOutlet UILabel *Date;
@property (strong, nonatomic) IBOutlet UILabel *Post_Content;
@property (strong, nonatomic) IBOutlet UILabel *classfication;
-(void)layout;
@end
