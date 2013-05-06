//
//  ArmaTwitter1ViewController.m
//  ArmaHubApp
//
//  Created by Joseph Whiteaker on 5/2/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "ArmaTwitter1ViewController.h"

#import "ArmaTwitter1ViewController.h"



@implementation ArmaTwitter1ViewController
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
      [super viewDidLoad];
    urlString = @"http://reader.mac.com/mobile/v1/http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=Armarauders";
    [self Original:urlString];

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

- (IBAction)btnArmauraders:(id)sender {
    urlString = @"http://reader.mac.com/mobile/v1/http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=Armarauders";
    [self Original:urlString];
}

- (IBAction)btnMecha:(id)sender {
    urlString = @"http://reader.mac.com/mobile/v1/http://api.twitter.com/1/statuses/user_timeline.rss?screen_name=Mechaworkshop";
    [self Original:urlString];
}

@end