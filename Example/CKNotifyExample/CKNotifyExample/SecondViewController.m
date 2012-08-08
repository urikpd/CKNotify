//
//  SecondViewController.m
//  CKNotifyExample
//
//  Created by Matthew Schettler on 3/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Advanced";

        // Don't forget to    #import "CKNotify.h"    in your .pch file

        
        int y = [UIScreen mainScreen].bounds.size.height - 320;
        int w = [UIScreen mainScreen].bounds.size.width - 10;
        
        UIButton *g = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [g setTitle:@"Green" forState:UIControlStateNormal];
        [g addTarget:self action:@selector(green) forControlEvents:UIControlEventTouchDown];
        [g setFrame:CGRectMake(5, y, w, 33)];
        [self.view addSubview:g];
        
        UIButton *r = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [r setTitle:@"Red" forState:UIControlStateNormal];
        [r addTarget:self action:@selector(red) forControlEvents:UIControlEventTouchDown];
        [r setFrame:CGRectMake(5, y+33*1, w, 33)];
        [self.view addSubview:r];
        
        UIButton *b = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [b setTitle:@"Blue" forState:UIControlStateNormal];
        [b addTarget:self action:@selector(blue) forControlEvents:UIControlEventTouchDown];
        [b setFrame:CGRectMake(5, y+33*2, w, 33)];
        [self.view addSubview:b];

        
        UIButton *c = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [c setTitle:@"Clear Alerts" forState:UIControlStateNormal];
        [c addTarget:self action:@selector(clearAll) forControlEvents:UIControlEventTouchDown];
        [c setFrame:CGRectMake(5, y+33*3, w, 33)];
        [self.view addSubview:c];

        
    }
    return self;
}

- (void)green {
    
    // Don't forget to    #import "CKNotify.h"    in your .pch file
    
    CKAlertView *alert = [[CKNotify sharedInstance] presentAlert:CKNotifyAlertTypeSuccess 
                                                       withTitle:@"You have sucessfully logged in"
                                                         andBody:@"Swipe left to logout\nSwipe right to fast switch users"
                                                          inView:self.view
                                                     forDuration:4.0];
    
    [alert setTapAction:nil onTarget:nil withObject:nil];  // disable tap
    
    [alert setSwipeLeftAction:@selector(red) onTarget:self withObject:nil];
    [alert setSwipeRightAction:@selector(swipeRight:) onTarget:self withObject:@"Matthew"];
    
    
}

- (void)swipeRight:(NSString *)name {
    
    NSString *title = [NSString stringWithFormat:@"Switching from %@...", name];
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
    [a show];
    [a release];
}

- (void)red {
    

        [[CKNotify sharedInstance] presentAlert:CKNotifyAlertTypeError
                                      withTitle:@"You have been logged out"
                                        andBody:nil
                                         inView:self.view
                                    forDuration:5.0];

}

- (void)blue {
    
    [[CKNotify sharedInstance] presentAlert:CKNotifyAlertTypeInfo withTitle:@"I come from the depths!" andBody:nil inView:self.view forDuration:4.0 fromLocation:CKNotifyAlertLocationBottom];
    
}


- (void)clearAll {
    
    [[CKNotify sharedInstance] dismissAllAlerts];
    
    // you could also use this call
//    [[CKNotify sharedInstance] dismissAllAlertsInView:self.view];

}

@end