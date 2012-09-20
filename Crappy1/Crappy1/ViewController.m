//
//  ViewController.m
//  Crappy1
//
//  Created by LIANG johnny on 9/11/12.
//  Copyright (c) 2012 LIANG johnny. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
    
    SecondViewController *secViewController;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_async(dispatch_get_main_queue(), ^(void){
        [self jsonParser];
    });
}

- (void)viewDidUnload{
    [super viewDidUnload];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        return YES;
    }else{
        return NO;
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (secViewController == nil) {
        secViewController = [[SecondViewController alloc] init];
    }
    
    [self.navigationController pushViewController:secViewController animated:YES];
}

-(void)jsonParser{
    
    NSError *error;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:JSON_LINK]];
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Json connection failed." message:@"Unable to access json data." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        
        return;
    }
    
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    
    if (jsonObj != nil && error == nil) {
        if ([jsonObj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = (NSDictionary *)jsonObj;
            
            NSLog(@"dictionary json = %@", dic);
        }else if([jsonObj isKindOfClass:[NSArray class]]){
            NSArray *array = (NSArray *)jsonObj;
            
            NSLog(@"array json = %@", array);
        }
    }
}

@end
