//
//  ViewController.m
//  StorkTest
//
//  Created by Josh Holtz on 6/7/14.
//  Copyright (c) 2014 Stork. All rights reserved.
//

#import "ViewController.h"

#import <Stork/Stork.h>
#import <Stork/StorkLoaderViewController.h>

@interface ViewController ()

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) StorkLoaderViewController *storkLoaderViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    // Adding webview to our view controller for Stork to use
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    
    // Prepare delivery - configure Stork
    [[Stork sharedClient] prepareDeliveryWithProjectToken:@"03d413312404f36f6b5e8b4defd69b8c" withVersion:@"0.0.0"];
    [[Stork sharedClient] prepareDeliveryWithWebView:self.webView];
    
    // OPTIONAL - Use this fancy view controller to show loading status
    self.storkLoaderViewController = [StorkLoaderViewController addToViewController:self withStork:[Stork sharedClient]];
    
    // Start Stork delivery - Stork now handles downloads and updates
    [[Stork sharedClient] deliver];
    
}

@end
