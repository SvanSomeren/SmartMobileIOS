//
//  ViewController.swift
//  Workshop 4
//
//  Created by issd on 16/03/2018.
//  Copyright © 2018 issd. All rights reserved.
//
import CoreLocation
import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet var mapView: MKMapView!
    let annotation = MKPointAnnotation()
    let annotationCircle = MKCircle();
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations[0]
        mapView.setCenter(newLocation.coordinate, animated: true)
        annotation.coordinate = CLLocationCoordinate2D(latitude: newLocation.coordinate.latitude, longitude: newLocation.coordinate.longitude)
        mapView.addAnnotation(annotation)
    
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

