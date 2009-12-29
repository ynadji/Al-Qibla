//
//  Al_QiblaAppDelegate.h
//  Al-Qibla
//
//  Created by Yacin Nadji on 12/17/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Al_QiblaViewController;

@interface Al_QiblaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Al_QiblaViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Al_QiblaViewController *viewController;

@end

