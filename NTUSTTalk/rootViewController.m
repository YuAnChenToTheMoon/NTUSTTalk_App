//
//  rootViewController.m
//  
//
//  Created by 陳俞安 on 2015/6/19.
//
//

#import "rootViewController.h"

@interface rootViewController ()

@end

@implementation rootViewController

- (void)awakeFromNib
{

    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ControllerCenter"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Classification"];
    self.menuViewSize=CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.height);
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

@end
