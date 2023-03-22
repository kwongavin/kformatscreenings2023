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
        getRemoteData { keynotes in
            DispatchQueue.main.async {
                self.keynotes = keynotes
            }
        }
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
    
    func getRemoteData(completion: @escaping ([Keynote]) -> Void) {

        guard let url = URL(string: "https://raw.githubusercontent.com/kwongavin/kformatscreenings2023/main/KFormatScreening/Data/keynotedata.json") else { completion([])
            return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion([])
                return
            }
            
            do {
                let companies = try JSONDecoder().decode([Keynote].self, from: data)
                completion(companies)
            } catch {
                completion([])
            }
        }.resume()
    }
    
}
