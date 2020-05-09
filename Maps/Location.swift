//
//  Location.swift
//  Maps
//
//  Created by Kittikawin Sontinarakul on 9/5/2563 BE.
//  Copyright © 2563 Kittikawin Sontinarakul. All rights reserved.
//

import Foundation
import CoreLocation

class Location: Codable {
    let latitude: Double
    let longitude: Double
    let date: Date
    let dateString: String
    let description: String
    
    init(_ location: CLLocationCoordinate2D, date: Date, descriptionString: String) {
      latitude =  location.latitude
      longitude =  location.longitude
      self.date = date
      dateString = Location.dateFormatter.string(from: date)
      description = descriptionString
    }
    
    convenience init(visit: CLVisit, descriptionString: String) {
      self.init(visit.coordinate, date: visit.arrivalDate, descriptionString: descriptionString)
    }
    
    static let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .medium
      formatter.timeStyle = .medium
      return formatter
    }()
    
}
