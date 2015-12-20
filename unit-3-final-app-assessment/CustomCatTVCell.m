//
//  CustomCatTVCell.m
//  unit-3-final-app-assessment
//
//  Created by Zoufishan Mehdi on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "CustomCatTVCell.h"

@implementation CustomCatTVCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)catButtonTapped:(UIButton *)sender {
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"]) {
        NSArray *catFactArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"];
        NSMutableArray *catMutableCopy = [catFactArray mutableCopy];
        [catMutableCopy addObject:self.catFact];
        NSArray *catArray = [catMutableCopy copy];
        [[NSUserDefaults standardUserDefaults] setObject:catArray forKey:@"savedCatFacts"];
       
    }
    else{
        NSArray *catFactArray = [[NSArray alloc]initWithObjects:self.catFact, nil];
        [[NSUserDefaults standardUserDefaults] setObject:catFactArray forKey:@"savedCatFacts"];
    }
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Saved"
                                  message:@"New cat fact saved!"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {
                                    [alert dismissViewControllerAnimated:YES completion:nil];
                                    
                                }];
    
    [alert addAction:yesButton];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    

}





@end
