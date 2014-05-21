//
//  CBPeripheralViewModel.h
//  BLEExample_OSX
//
//  Created by cruinh on 5/15/14.
//  Copyright (c) 2014 Matthew Hayes. All rights reserved.
//

#import <IOBluetooth/IOBluetooth.h>

#define kNotification_CBPeripheralViewModelDelegate_LogOutput @"kNotification_CBPeripheralViewModelDelegate_LogOutput"

@protocol CBPeripheralViewModelDelegate
- (void)viewModelIsReady:(id)sender;
- (NSData*)viewModelWantsCurrentDataToSend;
@end

@interface CBPeripheralViewModel : NSObject<CBPeripheralManagerDelegate>

@property (strong, nonatomic) CBPeripheralManager *peripheralManager;
@property (nonatomic, weak) NSObject<CBPeripheralViewModelDelegate> *delegate;
@property (nonatomic, readonly) BOOL isReady;

- (id)initWithDelegate:(NSObject<CBPeripheralViewModelDelegate>*)delegate;

- (void)startAdvertising;
- (void)stopAdvertising;

- (void)updateDataToSend:(NSData*)data;

@end
