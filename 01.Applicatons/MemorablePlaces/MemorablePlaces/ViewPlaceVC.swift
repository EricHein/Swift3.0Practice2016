//
//  ViewPlaceVC.swift
//  MemorablePlaces
//
//  Created by Eric H on 23/10/2016.
//  Copyright © 2016 FabledRealm. All rights reserved.
//

import UIKit
import MapKit

class ViewPlaceVC: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(activePlace)
        
        if places.count > activePlace {
            
            if let name = places[activePlace]["name"]{
                if let lat = places[activePlace]["lat"]{
                    if let long = places[activePlace]["long"]{
                        if let latitude = Double(lat){
                            if let longitude = Double(long){
                                
                                let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                let region = MKCoordinateRegion(center: coordinate, span: span)
                                
                                map.setRegion(region, animated: true)
                                
                                let annotation = MKPointAnnotation()
                                
                                annotation.coordinate = coordinate
                                annotation.title = name
                                
                                map.addAnnotation(annotation)
                                
                                
                            }
                        }
                    }
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
