//
//  SendPostViewController.h
//  NTUSTTalk
//
//  Created by 陳俞安 on 2015/6/21.
//  Copyright (c) 2015年 陳俞安. All rights reserved.
//

#import "ViewController.h"
@protocol SenddataProtocol <NSObject>
-(void)Refresh;
@end

@interface SendPostViewController : ViewController
@property (strong, nonatomic) IBOutlet UITextView *Post_Content;
- (IBAction)PostSend:(UIBarButtonItem *)sender;

- (IBAction)Cancel:(UIBarButtonItem *)sender;
@property (strong, nonatomic) NSString* classification;
@property (strong, nonatomic) NSDictionary* UserData;
@property(nonatomic,weak)id delegate;
@end
