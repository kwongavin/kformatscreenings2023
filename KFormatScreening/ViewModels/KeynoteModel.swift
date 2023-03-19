//
//  KeynoteModel.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/18/23.
//

import Foundation

class KeynoteModel: ObservableObject {
    
    @Published var keynotes = [Keynote]()
    
    init() {
        
        self.keynotes = getLocalKeynoteData()
        
    }
    
    func getLocalKeynoteData() -> [Keynote] {
        
        let pathString = Bundle.main.path(forResource: "keynotedata", ofType: "json")
        
        guard pathString != nil else {
            return [Keynote]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                
                let keynoteData = try decoder.decode([Keynote].self, from: data)
                
                return keynoteData
            }

        } catch {
            print(error) // Error parsing local JSON data
        }
        return [Keynote]()
    }
}
