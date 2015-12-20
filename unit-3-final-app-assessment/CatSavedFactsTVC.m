//
//  CatSavedFactsTVC.m
//  unit-3-final-app-assessment
//
//  Created by Zoufishan Mehdi on 12/20/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "CatSavedFactsTVC.h"

@interface CatSavedFactsTVC ()

@property (nonatomic) NSArray* savedCatFacts;

@end

@implementation CatSavedFactsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.savedCatFacts = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"];
    
}



- (IBAction)doneButtonTapped:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.savedCatFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.savedCatFacts objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Fetch yourText for this row from your data source..
    NSString *yourText = [self.savedCatFacts objectAtIndex:indexPath.row];
    
    CGSize lableWidth = CGSizeMake(350, CGFLOAT_MAX); // 300 is fixed width of label. You can change this value
    CGSize requiredSize = [yourText sizeWithFont:[UIFont fontWithName:@"Times New Roman" size:19] constrainedToSize:lableWidth lineBreakMode:NSLineBreakByWordWrapping]; // You can put your desire font
    
   
    int calculatedHeight = requiredSize.height+10;
    return (float)calculatedHeight;
}



@end
