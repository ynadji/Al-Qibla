//
//  Al_QiblaViewController.m
//  Al-Qibla
//
//  Created by Yacin Nadji on 12/17/09.
//  Copyright Georgia Institute of Technology 2009. All rights reserved.
//

#import "Al_QiblaViewController.h"

@implementation Al_QiblaViewController

@synthesize north;
@synthesize east;
@synthesize degrees;
@synthesize locationManager;

- (IBAction)getCurrentLocation {
  [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *)oldLocation {
  north.text = [NSString stringWithFormat:@"%3.5f", 
                newLocation.coordinate.latitude];
  east.text = [NSString stringWithFormat:@"%3.5f", 
               newLocation.coordinate.longitude];
}

- (IBAction)updateAngle {
  CLLocation *loc = [[[CLLocation alloc] initWithLatitude:[north.text doubleValue] longitude:[east.text doubleValue]] autorelease];
  double angle = [self angleToMecca:loc];
  degrees.text = [[NSString alloc] initWithFormat:@"%f", angle];
}

/**
 * Click invisible background button (to leave keyboard
 * when no "Done" button exists.
 */
- (IBAction)backgroundClick:(id)sender {
  [north resignFirstResponder];
  [north resignFirstResponder];
}

- (IBAction)textFieldDoneEditing:(id)sender {
  [sender resignFirstResponder];
}

/*
 Then, the spherical triangle would have:
 Angle "A" = 90 Degrees (the difference in the Longitudes of "B" and "C") 
 Side  "b" = 10 Degrees (90 - Latitude of Point "C" = 90 - 80 = 10 Deg)
 Side  "c" = 10 Degrees (90 - Latitude of Point "B" = 90 - 80 = 10 Deg)
 
 A = north pole
 B = kabbah
 C = current location
                 __                                   __
            -1  |                 SIN A                 |
 C   =   TAN    |  -----------------------------------  |
                |__  sin b  cot c   -   cos b  COS A  __|
 */
- (double)angleToMecca:(CLLocation *)currentLocation {
  double A = MECCA_LONGITUDE - currentLocation.coordinate.longitude;
  double b = 90.0 - currentLocation.coordinate.latitude;
  double c = 90.0 - MECCA_LATITUDE;
  NSLog(@"tan -1( sin(%f) / ( sin(%f) * cot(%f) - cos(%f) * cos(%f)))", A, b, c, b, A);
  return atan(
   sin(A) /
   ( sin(b) * (1 / tan(c)) - cos(b) * cos(A) )
              );
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [super viewDidLoad];
  self.locationManager = [[[CLLocationManager alloc] init] autorelease]; 
  self.locationManager.delegate = self;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
