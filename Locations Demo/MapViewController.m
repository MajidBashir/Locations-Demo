//
//  ViewController.m
//  Locations Demo
//
//  Created by IOS developer on 10/13/17.
//  Copyright © 2017 M Tribes. All rights reserved.
//

#import "MapViewController.h"
#import "CarInformationModel.h"
#import <MapKit/MapKit.h>
#import "CarsCustomAnnotation.h"
#import  <CoreLocation/CoreLocation.h>
#import "DataManager.h"


@interface MapViewController () <MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong) NSMutableArray *listOfLocations;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation* currentLocation;

@end

@implementation MapViewController

- (NSMutableArray*)listOfLocations {
    
    if (_listOfLocations ==nil) {
        _listOfLocations = [[NSMutableArray alloc]init];
    }
    return _listOfLocations;
}


- (void)addAnnotationForLocations:(NSArray *)locations {
    
    for (CarInformationModel *carInformationModel in locations) {
        NSAssert([carInformationModel isKindOfClass:[CarInformationModel class]], @"Location Data Array doesn't contain valid data");
        CarsCustomAnnotation *annotation = [[CarsCustomAnnotation alloc] initWithLocation:carInformationModel.coordinates.mapCoordinates
                                                                    title:carInformationModel.name
                                                                 subtitle:nil];
        [self.mapView addAnnotation:annotation];
    }
}


#pragma mark - CLLocation Manager Delegates
#pragma mark -

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    self.currentLocation = [locations lastObject];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
            self.mapView.showsUserLocation = true;
    }
}



- (void)startUpdatingLocation {
    if ([CLLocationManager locationServicesEnabled] ) {
        if (self.locationManager == nil )  {
            self.locationManager = [[CLLocationManager alloc] init];
            self.locationManager.delegate = self;
            self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
            self.locationManager.distanceFilter = kCLLocationAccuracyHundredMeters; //kCLDistanceFilterNone// kDistanceFilter;
        }
        [self.locationManager startUpdatingLocation];
    }
}

#pragma mark - viewBehaviours
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    
    [self startUpdatingLocation];
    
    if ([[DataManager sharedManager] isDataUpdated]) {
        //data manger has updated its data fetch it from shared instance.
        //UpdateUI
        [self.listOfLocations removeAllObjects];
        [self.listOfLocations addObjectsFromArray: [[DataManager sharedManager]completeData]];
        [self addAnnotationForLocations:self.listOfLocations];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(dataManagerDataUpdatedNotification:)
                                                 name:DATA_MANAGER_UPDATE_NOTIFICATION
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Utility method for Notification
#pragma mark -

- (void)dataManagerDataUpdatedNotification:(NSNotification *)notification {
    //data manger has updated its data fetch it from shared instance.
    //UpdateUI
    [self.listOfLocations removeAllObjects];
    [self.listOfLocations addObjectsFromArray: [[DataManager sharedManager]completeData]];
    [self addAnnotationForLocations:self.listOfLocations];
}



#pragma mark - MKMapViewDelegate
#pragma mark -

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    [self.locationManager requestWhenInUseAuthorization];
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    NSArray *annotations = [_mapView annotations];
    for (int i=0; i<[annotations count]; i++) {
        CarsCustomAnnotation *pins = (CarsCustomAnnotation*)[annotations objectAtIndex:i];
        if ([view isEqual:[_mapView viewForAnnotation:pins]]) {
            [[_mapView viewForAnnotation:pins] setHidden:NO];
        }else {
            [[_mapView viewForAnnotation:pins] setHidden:YES];
        }
    }
}


- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {

    NSArray *annotations = [_mapView annotations];
    for (int i=0; i<[annotations count]; i++) {
        CarsCustomAnnotation *pins = (CarsCustomAnnotation*)[annotations objectAtIndex:i];
            [[_mapView viewForAnnotation:pins] setHidden:NO];
        }
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    // If the annotation is the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[CarsCustomAnnotation class]] )
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView *pinView = (MKPinAnnotationView*) [mapView  dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        
        if (!pinView) {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                      reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.pinTintColor = [UIColor redColor];
            pinView.canShowCallout = YES;

        } else
            pinView.annotation = annotation;
        
        if (mapView.selectedAnnotations.count > 0 && ![mapView.selectedAnnotations containsObject:annotation]) {
            pinView.hidden = YES;
        }
        return pinView;
    }
    return nil;
}


@end
