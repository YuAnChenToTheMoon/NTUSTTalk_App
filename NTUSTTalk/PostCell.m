//
//  PostCell.m
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/21.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import "PostCell.h"

@implementation PostCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layout
{
    [_UserPicture setFrame:CGRectMake(5,10,60,60)];
    _UserPicture.layer.cornerRadius=30;
    _UserPicture.layer.masksToBounds=YES;
    [_Name setFrame:CGRectMake(75,6,self.frame.size.width,23)];
    [_classfication setFrame:CGRectMake(0,13,self.frame.size.width*0.97,self.frame.size.height*0.1)];
    [_Date setFrame:CGRectMake(75,30,self.frame.size.width,10)];
    [_Post_Content setFrame:CGRectMake(75,45,self.frame.size.width*0.78,self.frame.size.height)];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
