//
//  AppDelegate.h
//  BLEExample_OSX
//
//  Created by cruinh on 5/15/14.
//  Copyright (c) 2014 Matthew Hayes. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CBPeripheralViewModel.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,CBPeripheralViewModelDelegate>

@property (assign) IBOutlet NSWindow *window;

@end
