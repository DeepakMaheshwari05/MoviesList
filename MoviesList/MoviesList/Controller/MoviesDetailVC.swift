//
//  MoviesDetailVC.swift
//  UserList
//
//  Created by GWL-29 on 20/05/21.
//

import UIKit

class MoviesDetailVC: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lbloverView: UILabel!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblRelease: UILabel!
    
    
    // MARK: Variables
    var viewModel: MoviesListCellViewModel?
    
    //MARK: View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    //MARK: Private Methods
    func loadData() {
        self.lblTitle.text = viewModel?.title
        self.lbloverView.text = viewModel?.description
        self.lblRating.text = (self.lblRating.text ?? "") + (viewModel!.voteAverage ?? "")  + " \(viewModel!.voteCount ?? ""))"
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

