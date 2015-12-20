//
//  C4QColorPickerViewController.h
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "C4QViewController.h"
#import "ColorPickerCommunicationProtocol.h"


@interface C4QColorPickerViewController : UIViewController

@property (nonatomic, weak) id <ColorPickerCommunicationProtocol> delegate;

@end




