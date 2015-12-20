//
//  C4QCatFactDetailViewController.m
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsDetailViewController.h"
#import <AFNetworking/AFNetworking.h>

#define CAT_GIF_URL @"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"

@interface C4QCatFactsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *catLabel;
@property (weak, nonatomic) IBOutlet UIImageView *catImageView;
@property (nonatomic) NSString *catUrlString;

@end

@implementation C4QCatFactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.catLabel.text = self.catStringPassed;
    self.catImageView.clipsToBounds = YES;
    
    
    //API CALL
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
  
        NSArray *posts = [responseObject objectForKey:@"data"];
                  NSLog(@"%@", responseObject);
        
        int random = arc4random()%[posts count];
        
         NSDictionary *randomPost = [posts objectAtIndex:random];
        
        NSLog(@"%@", randomPost);
 
        
                NSDictionary *images = [randomPost objectForKey:@"images"];
        
         NSLog(@"%@", images);
                NSDictionary *originalStill = [images objectForKey:@"original_still"];
        
        NSLog(@"%@", originalStill);
                self.catUrlString = [originalStill objectForKey:@"url"];
        
        NSLog(@"%@", self.catUrlString);
        
        NSURL *imageURL = [NSURL URLWithString:self.catUrlString];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        self.catImageView.image = [UIImage imageWithData:imageData];
       
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@", error.userInfo);
        
    }];
 
    
    
}

@end
