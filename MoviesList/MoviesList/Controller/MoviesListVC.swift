//
//  MoviesListVC.swift
//  MoviesList
//
//  Created by GWL-29 on 29/05/21.
//

import UIKit

class MoviesListVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tblList: UITableView!
    
    //MARK: Variable
    private var objMoviesListViewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Fetch Users & Make UI Changes
        objMoviesListViewModel.arrList.bindAndFire() { [weak self] _ in
            DispatchQueue.main.async {
                self?.tblList.reloadData()
            }
        }
        objMoviesListViewModel.fetchList()
    }


}

//MARK: UITableView Delegate & DataSource Methods
extension MoviesListVC : UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objMoviesListViewModel.arrList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesListCell", for: indexPath) as? MoviesListCell else {
            return UITableViewCell()
        }
        cell.viewModel = objMoviesListViewModel.arrList.value[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MoviesListCell {
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let objMoviesDetailVC = storyBoard.instantiateViewController(withIdentifier: "MoviesDetailVC") as? MoviesDetailVC else {
                return
            }
            objMoviesDetailVC.viewModel = self.objMoviesListViewModel.arrList.value[indexPath.row]
            self.navigationController?.pushViewController(objMoviesDetailVC, animated: true)
        }
    }
}

