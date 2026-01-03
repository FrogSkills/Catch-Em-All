//
//  CreatureDetail.swift
//  Catch Em All
//
//  Created by Miguel on 1/3/26.
//

import Foundation


@Observable // Will watch objects for changes so that SwiftUI will redraw the interface when needed, like @State
class CreatureDetail {
    private struct Returned: Codable {
        var height: Double
        var weight: Double
        var sprites: Sprite
    }
    
    struct Sprite: Codable {
        var front_default: String
    }
    var urlString = ""
    var height = 0.0
    var weight = 0.0
    var imageURL = ""
    
    func getData() async {
        print("🕸️ We are accesing the URL \(urlString)")
        
        // Create a URL
        guard let url = URL(string: urlString) else {
            print("😡 Error: Could not create a URL from \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Try to decode JSON data into our own data structures
            guard let returned = try?  JSONDecoder().decode(Returned.self, from: data) else {
                print("😡 JSON Error: Could not decode returned JSON data")
                return
            }
            self.height = returned.height
            self.weight = returned.weight
            self.imageURL = returned.sprites.front_default
        } catch {
            print("😡 ERROR: Could not get data from \(urlString)")
        }
    }
}
