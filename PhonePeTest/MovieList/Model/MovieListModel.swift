

import Foundation


struct MainMovieData: Codable {
    let page: Int
    let results: [MovieDetail]
    let total_pages: Int
    let total_results: Int
}

struct MovieDetail: Codable {
    let adult: Bool
    let backdrop_path: String
    let original_title: String
    let vote_average: Double
    let title: String
    let id: Int
    let poster_path: String // main one
    var playlists: [String]?
}



//    https://image.tmdb.org/t/p/w500
//    eg: https://image.tmdb.org/t/p/w500/p60VSQL7usdxztIGokJPpHmKWdU.jpg
