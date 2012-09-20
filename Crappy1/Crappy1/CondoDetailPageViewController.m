//
//  CondoDetailPageViewController.m
//  Crappy1
//
//  Created by LIANG johnny on 9/11/12.
//  Copyright (c) 2012 LIANG johnny. All rights reserved.
//

#import "CondoDetailPageViewController.h"

@interface CondoDetailPageViewController (){
    
}

@end

@implementation CondoDetailPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self dismissModalViewControllerAnimated:YES];
}


@end
