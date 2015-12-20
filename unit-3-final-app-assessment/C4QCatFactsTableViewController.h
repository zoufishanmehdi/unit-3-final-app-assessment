//
//  C4QCatsTableViewController.h
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorPickerCommunicationProtocol.h"


@interface C4QCatFactsTableViewController : UITableViewController

@property (nonatomic, weak) id <ColorPickerCommunicationProtocol> delegate;

@end
