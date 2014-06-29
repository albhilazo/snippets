/* MapViewController.h ************************************************************************** */

#import <MapKit/MapKit.h>

// Controller protocols
<MKMapViewDelegate>




/* MapViewController.m ************************************************************************** */

#import "Annotation.h"

// viewDidLoad
outletMapView.delegate = self;

CLLocationCoordinate2D ctrpoint;
ctrpoint.latitude = latCoor;
ctrpoint.longitude = longCoor;
Annotation *annotation = [[Annotation alloc] initWithCoordinate:ctrpoint
	                                                      // ID:(NSUInteger *)index
                                                          Title:title
                                                    andSubtitle:[NSString stringWithFormat:@"lat: %.2f - long: %.2f",
                                                                 latCoor,
                                                                 longCoor]];
[outletMapView addAnnotation:annotation];
[outletMapView setCenterCoordinate:[annotation coordinate] animated:YES];


/**
 * Called when clicking a pinpoint in the map
 */
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    static NSString *identifier = @"Annotation";
    MKPinAnnotationView * annotationView = (MKPinAnnotationView*)[outletMapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.pinColor = MKPinAnnotationColorRed;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
    }else {
        annotationView.annotation = annotation;
    }

    /* Clicking the annotation loads a detail view:
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    detailButton.tag = (NSInteger)[annotation ident];
    [detailButton addTarget:self
                     action:@selector(viewDetail:)	// - (IBAction)viewDetailEarthquake:(id)sender
           forControlEvents:UIControlEventTouchUpInside];
    annotationView.rightCalloutAccessoryView = detailButton;
    */
	
    return annotationView;
}




/* Annotation.h ********************************************************************************* */

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>
@property (nonatomic, assign) NSUInteger *ident;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate Title:(NSString *)title andSubtitle:(NSString *)subtitle;
-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate ID:(NSUInteger *)id Title:(NSString *)title andSubtitle:(NSString *)subtitle;
@end




/* Annotation.m ********************************************************************************* */

#import "Annotation.h"

@implementation Annotation

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate Title:(NSString *)title andSubtitle:(NSString *)subtitle
{
    if ((self = [super init])) {
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subtitle;
    }
    return self;
}

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate ID:(NSUInteger *)id Title:(NSString *)title andSubtitle:(NSString *)subtitle
{
    if ((self = [super init])) {
        self.coordinate = coordinate;
        self.ident = id;
        self.title = title;
        self.subtitle = subtitle;
    }
    return self;
}

@end