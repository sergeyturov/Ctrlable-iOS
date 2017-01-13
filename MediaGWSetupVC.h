//
//  MediaGWSetupVC.h
//  ctrlable
//
//  Created by Ronald In 't Velt on 05/11/15.
//  Copyright © 2015 WaveSquare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaGWSetupVC : UIViewController
{
    id delegate;
}

- (void)showInViewController:(UIViewController *)vc;
- (IBAction)close:(id)sender;

@end
