

import Foundation


final class MovieListViewModel {
    
    private(set) var movieList: [MovieDetail] = []
    
    private var currentState: APIState = .none {
        didSet {
            stateMonitor?(currentState)
        }
    }
    
    let movieRequest: NetworkRequestMovie
    let localHanlder: LocalData
    
    init(movieRequest: NetworkRequestMovie = HomeReqeusts(),
         localHanlder: LocalData = LocalHandler()) {
        self.movieRequest = movieRequest
        self.localHanlder = localHanlder
    }

    var playlistData = [String: [String]]()
    
    var stateMonitor: ((APIState) -> Void)?
    
    func fetchList() {
        currentState = .loading
        movieRequest.fetchMovieList { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let listData):
                self.movieList = listData.results
                self.updateDataWithPlayList()
                //self.currentState = .data
            case .failure(let error):
                self.currentState = .error(.error(error.localizedDescription))
            }
        }
    }
    
    func updateDataWithPlayList() {
        movieList = movieList.map({ obj in
            var obj = obj
            obj.playlists = playlistData["\(obj.id)"]
            return obj
        })
        self.currentState = .data
    }
    
    func loadPlayListData() {
        playlistData = localHanlder.getLocalPlayList()
    }
    
    func updatePlayListData(_ id: String, playList: String) {
        
    }
    
}

