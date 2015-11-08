//
//  WebController.m
//  跟我走
//
//  Created by mac on 15/10/26.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "WebController.h"

@interface WebController ()<UIWebViewDelegate>
{
    UIWebView *_webView;
    UIActivityIndicatorView *_activityIndicatorView;

}
@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    _webView.delegate = self;
    
    _webView.scalesPageToFit = YES;
    
    [self.view addSubview:_webView];
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc]
                              
                              initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    
    [_activityIndicatorView setCenter: self.view.center] ;
    
    [_activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleGray];
    [self.view addSubview : _activityIndicatorView] ;
    
    NSURL *url =[NSURL URLWithString:_model.jump_url];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    
    [_webView loadRequest:request];
    
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView

{
    
    [_activityIndicatorView startAnimating] ;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView

{
    
    [_activityIndicatorView stopAnimating];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error

{
    
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alterview show];
    
    
}

@end
