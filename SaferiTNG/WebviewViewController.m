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


//- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
//{
//    [self.activityIndicator stopAnimating];
//    
//    UIAlertController *alert =
//    [UIAlertController alertControllerWithTitle:@"Load failed"
//                                        message:error.localizedDescription
//                                 preferredStyle:UIAlertControllerStyleAlert
//     ];
//    UIAlertAction *homeButton =
//    [UIAlertAction actionWithTitle:@"Home"
//                             style:UIAlertActionStyleDefault
//                           handler:^(UIAlertAction * _Nonnull action)
//     {
//         [self loadWebPage:@"http://www.mobilemakers.co"];
//     }];
//    UIAlertAction *cancelButton =
//    [UIAlertAction actionWithTitle:@"Cancel"
//                             style:UIAlertActionStyleDefault
//                           handler:^(UIAlertAction * _Nonnull action) {}
//     ];
//    [alert addAction:homeButton];
//    [alert addAction:cancelButton];
//    [self presentViewController:alert animated:YES completion:nil];
//}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"load failed" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *goHomeButton =
        [UIAlertAction actionWithTitle:@"Go home"
                                 style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * _Nonnull action)
    {
        [self loadWebPage:@"http://www.mobilemakers.co"];
    }];
    
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"Cancel" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action)
        {
            
        }
        ];
    [alertController addAction:goHomeButton];
    [alertController addAction:cancelButton];
    [self presentViewController:alertController animated:YES completion:nil];
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
