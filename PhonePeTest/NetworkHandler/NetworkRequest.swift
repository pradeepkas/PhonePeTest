

import Foundation


protocol NetworkRequestMovie {
    func fetchMovieList(_ handler: @escaping ((Result<MainMovieData, RequestErrorHandler>) -> Void))
}


class HomeReqeusts: NetworkRequestMovie {
    
    let network: NetworkHandlerList
    
    init(network: NetworkHandlerList = NetworkManager()) {
        self.network = network
    }
    
    func fetchMovieList(_ handler: @escaping ((Result<MainMovieData, RequestErrorHandler>) -> Void)) {
        let network = NetworkManager(URLSessionPay(true))
        let mockRequest = MockData.listMock.getRequest()
        network.getData(type: MainMovieData.self, request: mockRequest) { result in
            handler(result)
        }
    }

    
    
}

