//
//  ViewController.swift
//  Maps
//
//  Created by Eric H on 16/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude: CLLocationDegrees = 27.175244
        
        let longitude: CLLocationDegrees = 78.039
        
        let latdelta: CLLocationDegrees = 0.05
        
        let longdelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latdelta, longitudeDelta: longdelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        //ANNOTATION
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Taj Mahal"
        
        annotation.subtitle = "Impressive"
        
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        let test = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        
        test.minimumPressDuration = 1
        
        map.addGestureRecognizer(test)
        
    
        
    }
    
    func longpress(gestureRecognizer: UIGestureRecognizer){
        let touchLocation = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchLocation, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New Location"
        
        annotation.subtitle = "Test Location"
        
        map.addAnnotation(annotation)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

