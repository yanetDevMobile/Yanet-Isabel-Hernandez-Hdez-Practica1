//
//  RutasViewController.swift
//  Practica1
//
//  Created by usuario on 1/10/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit
import MapKit
class RutasViewController: UIViewController {

    var nombre : String!
    var time : Double!
    var segundos :Double!
    var timeHoras : String!
    
    @IBOutlet weak var notasTxt: UITextView!
    @IBOutlet weak var adeudoLbl: UILabel!
    @IBOutlet weak var personaVisitaLbl: UILabel!
    @IBOutlet weak var codigoPostalLbl: UILabel!
    @IBOutlet weak var direccionLbl: UILabel!
    @IBOutlet weak var delegacionLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    func calculaTiempo(segundos: Double) ->String{
       let horas = Int(segundos/3600)
        let minutos = Int((segundos-Double(horas)*3600)/60)
       return String(horas) + ":" + String(minutos) + "hrs"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = nombre
        var latitude: CLLocationDegrees = 19.3093196
        var longitude: CLLocationDegrees = -99.1957093
        var latDelta: CLLocationDegrees = 0.5
        var lonDelta: CLLocationDegrees = 0.5
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        var coordinates = CLLocationCoordinate2D(latitude: 19.3948, longitude: -99.1736)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        var  coordinates2 = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        map.delegate = self
        
       
        map.setRegion(region, animated: true)
        if(name.text == "Juan"){
            latitude = 19.3093196
            longitude  = -99.1957093
            adeudoLbl.text = "600.00"
            personaVisitaLbl.text = "Lucia"
            notasTxt.text = "Se realiza mantenimiento por falla en impresion"
            timeLbl.text = timeHoras
           
            
        }else{
            latitude = 19.298833
            longitude  = -99.1887596
            coordinates2 = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            adeudoLbl.text = "900.00"
            personaVisitaLbl.text = "Petra"
            notasTxt.text = "Se notifica que alquien estarà en lugar de la persona inicialmente enviada"
            
        }
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Ciudad de México"
        
        annotation.subtitle = "Me encuentro aqui."
        
        annotation.coordinate = coordinates
        
        map.addAnnotation(annotation)
        
        map.selectAnnotation(annotation, animated: true)
        
        // 19.3948,-99.1736
       
        
        //MARK: Trazando ruta
        let sourcePlacemark = MKPlacemark.init(coordinate: coordinates)
        let sourceMapItem = MKMapItem.init(placemark: sourcePlacemark)
        let destinationPlacemark = MKPlacemark.init(coordinate: coordinates2)
        let destinationMapItem = MKMapItem.init(placemark: destinationPlacemark)
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
     
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {
            (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            let route = response.routes[0]
            self.time = route.expectedTravelTime
            self.timeLbl.text = self.calculaTiempo(segundos: self.time)
            self.map.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegion(rect), animated: true)
            
        }
        
            //Obtener direccion
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(CLLocation(latitude: coordinates2.latitude, longitude: coordinates2.longitude)){
            (sourcePlacemark, error)in
            if(error != nil ){
                print (error)
            }
            if let placemarks = sourcePlacemark{
                self.delegacionLbl.text = placemarks[0].subLocality
               self.direccionLbl.text = placemarks[0].name
                self.codigoPostalLbl.text = placemarks[0].postalCode
            }
        }
        
    }
        
        
       
       
        

        // Do any additional setup after loading the view.
    }
    
    
extension RutasViewController: MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineDashPattern = [2,4];
        renderer.lineWidth = 4.0
        renderer.alpha = 1
        return renderer
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


