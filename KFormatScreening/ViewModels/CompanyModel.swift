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
}
