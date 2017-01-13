//
//  MediaGWSetupVC.m
//  ctrlable
//
//  Created by Ronald In 't Velt on 05/11/15.
//  Copyright © 2015 WaveSquare. All rights reserved.
//

#import "MediaGWSetupVC.h"
#import "Logger.h"


@interface MediaGWSetupVC ()

@end

@implementation MediaGWSetupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showInViewController:(UIViewController *)vc
{
  
    delegate = vc;
    
    // Observer tells us when the app quits, then we close this dialog as well
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(close:) name:UIApplicationWillResignActiveNotification object:nil];
    
    [vc presentModalViewController:self animated:YES];
    
//    [cancelButton setTitle:MyLocalizedString(@"DlgCancel", nil) forState:UIControlStateNormal];
//    [cancelButton setTitle:MyLocalizedString(@"DlgCancel", nil) forState:UIControlStateSelected];
    
   
//    [tableView reloadData];
}


- (IBAction)close:(id)sender
{
    [self dismiss:YES];
}

- (void)dismiss:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self dismissModalViewControllerAnimated:animated];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return UIInterfaceOrientationMaskAll;
    else
        return ((interfaceOrientation == UIInterfaceOrientationPortrait) ||
                (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown));
    
}


// For 6.0:
- (BOOL)shouldAutorotate
{
    WriteLog(LOG_LOW, @">>>> Shouldautorotate called!");
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown );
}

@end
