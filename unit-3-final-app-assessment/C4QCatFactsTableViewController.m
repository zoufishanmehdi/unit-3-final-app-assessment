//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "CustomCatTVCell.h"
#import "C4QCatFactsDetailViewController.h"

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController ()  <UITableViewDataSource,
UITableViewDelegate>

@property(nonatomic)NSArray *catLadyArray;

//@property(nonatomic)NSMutableArray *catLadyMutableArray;

@property (strong, nonatomic) IBOutlet UITableView *catFactsTableView;

@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    
    //API CALL
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"http://catfacts-api.appspot.com/api/facts?number=100" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
            self.catLadyArray = [responseObject objectForKey:@"facts"];
               NSLog(@"%@", responseObject);
            
            [self.tableView reloadData]; 
    
    
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"%@", error.userInfo);
            
        }];
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
   self.tableView.estimatedRowHeight = 40.0; // for example. Set your average height
    self.tableView.rowHeight = UITableViewAutomaticDimension;

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catLadyArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{


    CustomCatTVCell *catCell = [tableView dequeueReusableCellWithIdentifier:@"CatCellID"];
    [tableView registerNib:[UINib nibWithNibName:@"CustomCatTVCell" bundle:nil] forCellReuseIdentifier:@"CatCellID"];
    catCell = [tableView dequeueReusableCellWithIdentifier:@"CatCellID"];

    catCell.catFactLabel.text = [self.catLadyArray objectAtIndex:indexPath.row];
    
    catCell.catFact = [self.catLadyArray objectAtIndex:indexPath.row];
   
    
    return catCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    C4QCatFactsDetailViewController *catDeetVC = (C4QCatFactsDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"catFactDetailVC"];
    catDeetVC.catStringPassed = self.catLadyArray[indexPath.row];
        [self.navigationController pushViewController:catDeetVC animated:YES];

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Fetch yourText for this row from your data source..
    NSString *yourText = [self.catLadyArray objectAtIndex:indexPath.row];
    
    CGSize lableWidth = CGSizeMake(320, CGFLOAT_MAX); // 300 is fixed width of label. You can change this value
    CGSize requiredSize = [yourText sizeWithFont:[UIFont fontWithName:@"Times New Roman" size:19] constrainedToSize:lableWidth lineBreakMode:NSLineBreakByWordWrapping]; // You can put your desire font
    
    int calculatedHeight = requiredSize.height+10;
    return (float)calculatedHeight;
}



@end
