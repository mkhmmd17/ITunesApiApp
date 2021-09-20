//
//  Service.swift
//  AppStore
//
//  Created by muslim on 19.09.2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    private init() {
        
    }
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, resp, err in

            if let err = err {
                print ("Failed to fetch data", err)
                completion([], nil)
            }

            guard let data = data else { return }

            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonErr {
                completion([], jsonErr)
                print("Failed to decode JSON", jsonErr)
            }
        }.resume()
    }
}
