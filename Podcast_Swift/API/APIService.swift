//
//  APIService.swift
//  Podcast_Swift
//
//  Created by Abdul Basit on 18/06/2025.
//
import Alamofire

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Podcast]
}

class APIService {
    // singleton
    static let shared = APIService()
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping([Podcast]) -> ()) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term": searchText, "media": "podcast"]
        AF.request(url, parameters: parameters, encoding: URLEncoding.default).responseData { response in
            if let error = response.error {
                print("Failed to get podcasts:", error)
                return
            }
            guard let data = response.data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completionHandler(searchResult.results)
            }catch let decodeError {
                print("Failed to decode:", decodeError)
            }
        }
    }
}
