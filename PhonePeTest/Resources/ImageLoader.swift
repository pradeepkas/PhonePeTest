

import UIKit
import SDWebImage


let basePathForImage = "https://image.tmdb.org/t/p/w500"

extension UIImageView {
    
    func setImagePhonePe(_ path: String?) {
        
        //let imageWidth = Int(UIScreen.main.bounds.width) // can managa image size
        guard let path = path,
              let url = URL(string: basePathForImage + path) else {return}
        self.sd_setImage(with: url)
    }
}
