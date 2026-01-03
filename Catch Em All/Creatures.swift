//
//  Creatures.swift
//  Catch Em All
//
//  Created by Miguel on 12/31/25.
//

import Foundation


@Observable // Will watch objects for changes so that SwiftUI will redraw the interface when needed, like @State
class Creatures {
    private struct Returned: Codable {
        var count: Int
        var next: String //TODO: We want to change this to an optional
        // we add a Results array that is later defined as a Result structure, which holds name and url from the web.
        var results: [Creature]
    }
    
//    // the struct Result from the struct "Returned" from above
//    struct CreatureFromTheClass: Codable, Hashable {
//        var name: String
//        var url: String // url for detail on Pokemon
//    }

    // this "var urlString" or function is the first thing we do after creating the class.
    var urlString = "https://pokeapi.co/api/v2/pokemon"
    var count = 0
    var creaturesArray: [Creature] = []
    
    // this function or the "var urlString" is the first thing we do after creating the class.
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
            self.count = returned.count
            self.urlString = returned.next
            self.creaturesArray = returned.results
        } catch {
            print("😡 ERROR: Could not get data from \(urlString)")
        }
    }
}


// Will create a class to make a custom call to access data over the internet parce JSON, put it into custom data structures, use those to display interface.

// Need a structure that is the same as the info (key: value) we are pulling from the internet.
// Use URLSesion to gest the JSON data.
// Then we sort the data ourselves.
// This is done by creating a structure that confirms to Codable (by adding :Codable after the struct name).
// Struct must also have key and values that match the JSON.
// Then we use a JSONDecoder.
// The struct can be any name but prof G likes to call it "Returned"

// How do we get that JSON from the internet?
// With a function

// Steps:
// 1.)
// Name it, prof G likes to call it getData()
// Add  async  just before the opening curly,   func getData() async {
// async = code runs and the rest of the app does not have to wait on the results.
// When the function finishes, it runs what it needs to. Useful since internet can be slow.

// 2.)
// Create a URL to access the JSON.
// Strings need to be converted to a sepcial URL type to be used.
// Use a guard statement to covert the string to URL
// Print an error in case it does not work.
// If it does work we have a constant called "url" which contains the URL.

// 3.)
// DO Let Try Catch
// inside the try, use a  URL.Session.shared.data(from: url)  class (already made by swift) to get JSON data over the internet.
// Returns a status(in the form of a tuple, values (2 in this case) seperated by a comma), to notify if the call worked or not.
// This also runs async, with try await URLSession.shared.data(from:url)
// (data, _) is the tuple we receive.


// In the "do" add a guard statement to decode (using the JSONDecoder) the JSON, using the Retrurned struct & data. Have the result inside a constante called "returnted".
// If it works print the .count


// Catch & print an error in case it does not work.






// 1.) Get the URL.
// 2.) Put it un a variable (prof G likes "urlstring)
// 3.) Print the URL before we convert it to a URLType, to copy and paste in browser & make sure its what we want.
