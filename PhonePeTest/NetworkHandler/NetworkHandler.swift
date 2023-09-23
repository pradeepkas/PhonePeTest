

import Foundation


protocol Requestable {
    var basePath: String {get}
    var method: String {get}
    var httpType: String {get}
    var queryItems: [String: String] {get}
}


extension Requestable {
    
    //https://api.themoviedb.org/3/movie/popular?language=en-US&page=2
    var basePath: String {
        return "https://api.themoviedb.org/3/movie/popular"
    }
    
    func asRequest() ->  URLRequest? {
        var urlComponents = URLComponents(string: basePath + method)
        urlComponents?.queryItems = queryItemConversion
        guard let url = urlComponents?.url else {return nil}
        let request = URLRequest(url: url)
        return request
    }
    
    func asURL() -> URL? {
        var urlComponents = URLComponents(string: basePath + method)
        urlComponents?.queryItems = queryItemConversion
        return urlComponents?.url
    }
    
    var queryItems: [String: String] {
        return ["app_id": "25bc7dbb48da45af9ce2eae5f93eb257"]
    }
    
    var queryItemConversion: [URLQueryItem] {
        return queryItems.map({URLQueryItem(name: $0.key, value: $0.value)})
    }
}


enum PayPayRequestHandler: Requestable {
    
    case movieList

    var method: String {
        switch self {
        case .movieList:
            return "latest.json"
        }
    }
    
    var httpType: String {
        return "get"
    }
}

enum RequestErrorHandler: Error {
    case urlNotfound
    case noData
    case error(String)
    case noFileExist
}


enum APIState {
    case loading
    case data
    case none
    case error(RequestErrorHandler)
    
    func isLoading() -> Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
}
