//
//  Al_QiblaViewController.h
//  Al-Qibla
//
//  Created by Yacin Nadji on 12/17/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

// lat/long are north/east respectively
#define MECCA_LATITUDE 21.416667
#define MECCA_LONGITUDE 39.816667
#define cot(x) (1 / tan(x))

@interface Al_QiblaViewController : UIViewController <CLLocationManagerDelegate> {
  
  IBOutlet UITextField *north;
  IBOutlet UITextField *east;
  IBOutlet UILabel *degrees;
  CLLocationManager *locationManager;
}

@property (retain, nonatomic) UITextField *north;
@property (retain, nonatomic) UITextField *east;
@property (retain, nonatomic) UILabel *degrees;
@property (retain, nonatomic) CLLocationManager *locationManager;

- (double)angleToMecca:(CLLocation *)currentLocation;
- (IBAction)getCurrentLocation;
- (IBAction)updateAngle;
- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundClick:(id)sender;

@end

