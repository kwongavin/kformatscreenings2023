//
//  CompanyModel.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import Foundation

class CompanyModel: ObservableObject {
    
    @Published var companies = [Company]()
    
    init() {
        self.companies = getLocalData()
        
//        getRemoteData { companies in
//            DispatchQueue.main.async {
//                self.companies = companies
//            }
//        }
    }
    
    func getLocalData() -> [Company] {
        
        let pathString = Bundle.main.path(forResource: "companydata", ofType: "json")
        
        guard pathString != nil else {
            return [Company]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                
                let companyData = try decoder.decode([Company].self, from: data)
                
                return companyData
            }
            
        } catch {
            print(error) // Error parsing local JSON data
        }
        return [Company]()
    }
    
    func getRemoteData(completion: @escaping ([Company]) -> Void) {

        guard let url = URL(string: "https://raw.githubusercontent.com/kwongavin/kformatscreenings2023/main/KFormatScreening/Data/companydata.json") else { completion([])
            return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion([])
                return
            }
            
            do {
                let companies = try JSONDecoder().decode([Company].self, from: data)
                completion(companies)
            } catch {
                completion([])
            }
        }.resume()
    }
    
}
