//
//  HomePresenter.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 31.05.2024.
//

import Foundation

protocol HomePresenterProtocol {
    
    func viewDidLoad()
    func didSelectRowAt(_ indexPath: IndexPath)
    func numberOfItems() -> Int
    func news(_ indexPath: IndexPath) -> News?
}

final class HomePresenter {
    
    unowned var view: HomeViewControllerProtocol!
    let router: HomeRouterProtocol
    let interactor: HomeInteractorProtocol
    
    private var news: [News] = []
    
    init(
        view: HomeViewControllerProtocol,
        router: HomeRouterProtocol,
        interactor: HomeInteractorProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    func viewDidLoad() {
        view.setupTableView()
        view.setTitle("Top News")
        fetchNews()
    }
    
    func didSelectRowAt(_ indexPath: IndexPath) {
        let source = news[indexPath.row]
        router.navigate(.detail(source: source))
    }
    
    func numberOfItems() -> Int {
        news.count
    }
    
    func news(_ indexPath: IndexPath) -> News? {
        news[safe: indexPath.row]
    }
    
    private func fetchNews() {
        view.showLoadingView()
        interactor.fetchNews()
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func fetchNewsOutput(result: NewsSourcesResult) {
        view.hideLoadingView()
        print(result)
        switch result {
        case .success(let response):
            guard let results = response.results else { return }
            self.news = results
            view.reloadData()
            
        case .failure(let error):
            DispatchQueue.main.async {
                self.view.showError(error.localizedDescription)
            }
        }
    }
}
