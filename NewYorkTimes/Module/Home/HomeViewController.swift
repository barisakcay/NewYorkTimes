//
//  HomeViewController.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 31.05.2024.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    
    func setupTableView()
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func showError(_ message: String)
    func setTitle(_ title: String)
}

final class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

}

extension HomeViewController: HomeViewControllerProtocol {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: NewsCell.self)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func showError(_ message: String) {
        DispatchQueue.main.async {
            self.showAlert(with: "Oops!", message: "Something went wrong")
        }
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(indexPath)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(with: NewsCell.self, for: indexPath)
        
        if let news = presenter.news(indexPath) {
            cell.cellPresenter = NewsCellPresenter(view: cell, news: news)
        }
        
        return cell
    }
}
