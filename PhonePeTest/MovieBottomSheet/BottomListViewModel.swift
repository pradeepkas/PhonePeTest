

import Foundation


final class BottomListViewModel {
    
    let localHanlder: LocalData

    init(localHanlder: LocalData = LocalHandler()) {
        self.localHanlder = localHanlder
        self.loadPlayListData()
    }

    var playlistData = [String: [String]]()
    
    func loadPlayListData() {
        playlistData = localHanlder.getLocalPlayList()
    }

}
