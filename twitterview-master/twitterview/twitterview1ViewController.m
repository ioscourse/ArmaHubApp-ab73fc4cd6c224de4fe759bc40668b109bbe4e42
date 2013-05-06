//
//  twitterview1ViewController.m
//  twitterview
//
//  Created by Charles Konkol on 4/15/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "twitterview1ViewController.h"



@implementation twitterview1ViewController
@synthesize webview;

NSString * urlString;

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

   //Original Twitter Load First
    
    NSString * userAgent = @"Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+(KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3";
    urlString = @"http://reader.mac.com/mobile/v1/http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=goliveoriginal";
    NSURL *URL = [NSURL URLWithString:urlString];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:URL];
    [req setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    NSURLResponse* response = nil;
    NSError* error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:req
                                         returningResponse:&response
                                                     error:&error];
    [webview loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:URL];

    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)Original:(NSString*)rssfeed
{
    NSString * userAgent = @"Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+(KHTML, like Gecko) Version/3.0 Mobile/1A543a Safari/419.3";
    NSString * urlString = rssfeed;
    NSURL *URL = [NSURL URLWithString:urlString];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:URL];
    [req setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    NSURLResponse* response = nil;
    NSError* error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:req
                                         returningResponse:&response
                                                     error:&error];
    [webview loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:URL];

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [webview release];
    [super dealloc];
}

- (IBAction)btnOriginal:(id)sender {
    urlString = @"http://reader.mac.com/mobile/v1/http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=GoLiveOriginal";
    [self Original:urlString];
}

- (IBAction)btnJenn:(id)sender {
    urlString = @"http://reader.mac.com/mobile/v1/http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=JenDeWeerdt";
    [self Original:urlString];
}
- (IBAction)btnNancy:(id)sender {
    urlString = @"http://reader.mac.com/mobile/v1/http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=nancyalcorn";
    [self Original:urlString];
}

- (IBAction)btnBack:(id)sender {
   [self Original:urlString]; 
}
- (IBAction)btnSheila:(id)sender {
    urlString = @"http://reader.mac.com/mobile/v1/http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=SheilaWalsh";
    [self Original:urlString];
}

@end
