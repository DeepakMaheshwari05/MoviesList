//
//  UserListCell.swift
//  UserList
//
//  Created by GWL-29 on 20/05/21.
//

import UIKit

class MoviesListCell: UITableViewCell {

    // MARK: IBOutlet
    @IBOutlet weak var imgImage: UIImageView!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblRelease: UILabel!
    
    // MARK: Variable
    var viewModel: MoviesListCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Private Methods
    private func bindViewModel() {
        self.lblTitle.text = viewModel?.title
        self.lblRating.text = "Rating :" + (viewModel!.voteAverage ?? "")!  + "(\(viewModel!.voteCount ?? ""))"
        self.lblRelease.text = viewModel?.releaseDate
//        self.lblWebsite.text = viewModel?.websiteText
        // Create URL
        let url = URL(string: self.viewModel?.imageUrl ?? "")!
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.imgImage.image = UIImage(data: data)
                }
            }
            
            task.resume()
        
    }
    
    
}
