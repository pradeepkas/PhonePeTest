

import UIKit


final class MovieListCell: UITableViewCell {
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var playlists: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var movieImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        starButton.setTitle("", for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ data: MovieDetail?) {
        guard let data = data else {return}
        movieName.text = data.title
        rating.text = "Rating : \(data.vote_average)"

        movieImage.setImagePhonePe(data.poster_path)
        
    }
    
    
    @IBAction
    func movieStarButtonTapped(_ button: UIButton) {
        print("movieStarButtonTapped")
    }
    
}
