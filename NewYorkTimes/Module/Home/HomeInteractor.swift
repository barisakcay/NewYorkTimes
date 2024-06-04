//
//  HomeInteractor.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 31.05.2024.
//

import Foundation

fileprivate var newsService: NewsServiceProtocol = API()

typealias NewsSourcesResult = Result<NewsData, NetworkError>

protocol HomeInteractorProtocol {
    
    func fetchNews()
}

protocol HomeInteractorOutputProtocol {
    
    func fetchNewsOutput(result: NewsSourcesResult)
}

final class HomeInteractor {
    
    var output: HomeInteractorOutputProtocol?
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func fetchNews() {
        newsService.fetchNews { [weak self] result in
            guard let self else { return }
            self.output?.fetchNewsOutput(result: result)
        }
    }
}
