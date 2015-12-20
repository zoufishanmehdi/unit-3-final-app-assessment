//
//  ColorPickerCommunicationProtocol.h
//  ColorPicker
//
//  Created by Zoufishan Mehdi on 9/12/15.
//  Copyright © 2015 Zoufishan Mehdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ColorPickerCommunicationProtocol <NSObject>

@optional
- (void)addColor: (NSString *)colorAdded;

- (void)colorPicked: (UIColor *)colorDisplayed;

@end
