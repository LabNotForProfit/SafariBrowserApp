//
//  WebviewViewController.m
//  SaferiTNG
//
//  Created by JeffChiu on 3/15/16.
//  Copyright © 2016 JeffChiu. All rights reserved.
//

#import "WebviewViewController.h"

@interface WebviewViewController () < UIWebViewDelegate, UITextFieldDelegate >
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.delegate = self;
    [self loadWebPage:@"http://www.mobilemakers.co"];
}

- (void) webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"finished");
    [self.activityIndicator stopAnimating];
}





- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:textField.text]];
    [self loadWebPage:textField.text];
    return YES;
}

-(void)loadWebPage:(NSString *)webString {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:webString]];
    //NSURLRequest *request = [[NSURLRequest requestWithURL:[NSURL URLWithString:webString]];
    [self.webView loadRequest:request];
}
@end
