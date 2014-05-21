//
//  AppDelegate.m
//  BLEExample_OSX
//
//  Created by cruinh on 5/15/14.
//  Copyright (c) 2014 Matthew Hayes. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, strong) CBPeripheralViewModel *viewModel;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.viewModel = [[CBPeripheralViewModel alloc] initWithDelegate:self];
    [self _startListeningForNotifications];
}

#pragma mark - Notifications

- (void)_startListeningForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_onViewModelLogOutput:)
                                                 name:kNotification_CBPeripheralViewModelDelegate_LogOutput
                                               object:self.viewModel];
}

- (void)_stopListeningForNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kNotification_CBPeripheralViewModelDelegate_LogOutput
                                                  object:self.viewModel];
}

- (void)_onViewModelLogOutput:(NSNotification*)notification
{
    NSString *text = [notification.userInfo objectForKey:@"logOutput"];
    if (text)
    {
        NSString *newText = [NSString stringWithFormat:@"%@\n",text];
        
        NSLog(@"%@",newText);
        //        dispatch_async(dispatch_get_main_queue(), ^() {
        //            self.logTextView.text = [self.logTextView.text stringByAppendingString:newText];
        //        });
    }
}

#pragma mark - CBPeripheralViewModelDelegate methods

- (NSData*)viewModelWantsCurrentDataToSend
{
    return [@"Test Data" dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)viewModelIsReady:(id)sender
{
    [self.viewModel startAdvertising];
}

@end
