//
//  AddPlaceVC.swift
//  MemorablePlaces
//
//  Created by Eric H on 23/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class AddPlaceVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(activePlace)
        
        let uilpgr = UITapGestureRecognizer(target: self, action: #selector(AddPlaceVC.longpress(gestureRecognizer:)))
        
        uilpgr.numberOfTapsRequired = 1
        
        map.addGestureRecognizer(uilpgr)
        
        if activePlace == -1{
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
        

    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer){
        
        
        
        let touch = gestureRecognizer.location(in: map)
        
        let newCoordinate = self.map.convert(touch, toCoordinateFrom: self.map)
        
        let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.latitude)
        
        
        var title = ""
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error)
            in
            if error != nil{
                print(error)
                
            }else{
                if let placemark = placemarks?[0]{
                    
                    if placemark.subThoroughfare != nil {
                        title += placemark.subThoroughfare! + " "
                    }
                    if placemark.thoroughfare != nil{
                        title += placemark.thoroughfare!
                    }
                    
                }
            }
            
            if title == ""{
             title = "Added \(NSDate())"
            }
            
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = newCoordinate
            
            annotation.title = title
            
            self.map.addAnnotation(annotation)
            
            
            places.append(["name":title,"lat":String(newCoordinate.latitude),"long":String(newCoordinate.longitude)])
            
            UserDefaults.standard.set(places, forKey: "places")
            print(places)
        })
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
