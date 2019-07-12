//
//  BucketItem.swift
//  WengZheng Mini App
//
//  Created by Zheng, Alicia Ren (arz7cn) on 10/1/18.
//  Copyright © 2018 Jeremy Weng and Alicia Zheng. All rights reserved.
//

import Foundation

class BucketItem: NSObject {
    
    struct PropertyKeys {
        static let title = "title"
        static let details = "details"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let date = "date"
        var complete = false
    }
    
    let title: String
    let details: String
    let latitude: String
    let longitude: String
    let date: String
    var complete: Bool
    
    init(title: String, latitude: String, longitude: String, details: String, date: String) {
        self.title = title
        self.details = details
        self.latitude = latitude
        self.longitude = longitude
        self.date = date
        self.complete = false
    }
    
    func markComplete() {
        self.complete = !complete
    }
}
