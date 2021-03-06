//
//  ViewController.swift
//  FindingTheUserLocation
//
//  Created by Eric H on 16/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        
        /*
        let latitude = userLocation.coordinate.latitude
        
        let longitude = userLocation.coordinate.longitude
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        */
        
        CLGeocoder().reverseGeocodeLocation(userLocation) {(placemarks, error) in
         
            if error != nil{
                print(error)
                
            }else{
                if let placemark = placemarks?[0]{
                    
                    var subThoroughFare = ""
                    
                    if placemark.subThoroughfare != nil{
                        subThoroughFare = placemark.subThoroughfare!
                        
                    }
                    
                    var thoroughFare = ""
                    
                    if placemark.thoroughfare != nil{
                        thoroughFare = placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    
                    if placemark.subLocality != nil{
                        subLocality = placemark.subLocality!
                    }
                    
                    var sumAdminArea = ""
                    
                    if placemark.subAdministrativeArea != nil{
                        sumAdminArea = placemark.subAdministrativeArea!
                    }
                    
                    var postalCode = ""
                    
                    if placemark.postalCode != nil{
                        postalCode = placemark.postalCode!
                    }
                    
                    var country = ""
                    
                    if placemark.country != nil{
                        country = placemark.country!
                    }
                    
                    
                    
                    print(subThoroughFare + thoroughFare + "\n" + subLocality + sumAdminArea + "\n" + postalCode + "\n" + country)
                }
                
            }
            
        }
    }

}

