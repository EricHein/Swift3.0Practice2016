//
//  ViewController.swift
//  LocationAware
//
//  Created by Eric H on 21/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var nearestAddressLabel: UILabel!
    
    
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
        
        
        latitudeLabel.text = "Latitude: " + String(userLocation.coordinate.latitude)
        
        longitudeLabel.text = "Longitude: " + String(userLocation.coordinate.longitude)
        
        courseLabel.text = "Course: " + String(userLocation.course)
        
        speedLabel.text = "Speed: " + String(userLocation.speed)
        
        altitudeLabel.text = "Altitude: " + String(userLocation.altitude)
        
        
        
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
                    
                    let string1 = String(subThoroughFare + thoroughFare + "\n" + subLocality + sumAdminArea + "\n" + postalCode + "\n" + country)
                    
                    self.nearestAddressLabel.text = string1
                    
                    print(subThoroughFare + thoroughFare + "\n" + subLocality + sumAdminArea + "\n" + postalCode + "\n" + country)
                }
                
            }
            
        }
        
    }


}

