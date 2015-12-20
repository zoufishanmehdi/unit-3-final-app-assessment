//
//  CustomCatTVCell.h
//  unit-3-final-app-assessment
//
//  Created by Zoufishan Mehdi on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCatTVCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *catFactLabel;
@property (nonatomic) NSString *catFact;
@property (weak, nonatomic) IBOutlet UIButton *addButton;



@end
