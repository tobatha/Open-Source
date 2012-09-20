//
//  SecondViewController.m
//  Crappy1
//
//  Created by LIANG johnny on 9/11/12.
//  Copyright (c) 2012 LIANG johnny. All rights reserved.
//

#import "SecondViewController.h"
#import "CondoDetailPageViewController.h"

@interface SecondViewController (){
//    UILabel *label;

    UIView *navSubView;
    
    CondoDetailPageViewController *condoDetail;
}

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    navSubView = [[UIView alloc] initWithFrame:CGRectMake(60, 20, self.view.frame.size.width - 120, 44)];
    [navSubView setAlpha:0.0f];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, navSubView.frame.size.width, navSubView.frame.size.height)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"<My condo>";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    [navSubView addGestureRecognizer:tap];
    [tap release];
    [navSubView addSubview:label];
    
    [self.navigationController.view addSubview:navSubView];
    [self.navigationController.view bringSubviewToFront:navSubView];
    
    [self easeInOutWithObject:navSubView withOption:YES];
    [label release];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self easeInOutWithObject:navSubView withOption:NO];
    
    [navSubView performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.5f];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload{
    [super viewDidUnload];
    
    navSubView = nil;
    [navSubView release];
    
    condoDetail = nil;
    [condoDetail release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)easeInOutWithObject:(id)object withOption:(BOOL)option{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.5f];
    if (option) {
        [object setAlpha:1.0f];
    }else{
        [object setAlpha:0.0f];
    }
    [UIView commitAnimations];
}

-(void)tapped{
    if (condoDetail == nil) {
        condoDetail = [[CondoDetailPageViewController alloc] init];
    }
    [self presentModalViewController:condoDetail animated:YES];
}

@end
