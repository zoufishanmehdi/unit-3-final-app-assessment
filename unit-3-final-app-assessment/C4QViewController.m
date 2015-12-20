//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"
#import "ColorPickerCommunicationProtocol.h"
#import "C4QColorPickerViewController.h"
#import "C4QCatFactsTableViewController.h"
#import "C4QRootViewController.h"

@interface C4QViewController () <ColorPickerCommunicationProtocol>

@property (nonatomic) NSMutableArray *colors;

@end



@implementation C4QViewController


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.colors = [[NSMutableArray alloc] init];
    
}

-(void)prepareForSegue:(nonnull UIStoryboardSegue *)segue sender:(nullable id)sender {
    if (self.view.backgroundColor == [UIColor greenColor]) {
        C4QCatFactsTableViewController *catViewController = segue.destinationViewController;
        catViewController.delegate = self;
    } else {
    C4QColorPickerViewController *viewController = segue.destinationViewController;
    viewController.delegate = self;
    }
    
    
}

- (void)addColor: (NSString *)colorAdded {
    NSLog(@"%@", colorAdded);
}


- (void)colorPicked: (UIColor *)colorDisplayed {
    self.view.backgroundColor = colorDisplayed;
}



@end
