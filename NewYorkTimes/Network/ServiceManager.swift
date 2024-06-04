//
//  ServiceManager.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 4.06.2024.
//

import Foundation

protocol NewsServiceProtocol {
    
    func fetchNews(completion: @escaping(Result<NewsData, NetworkError>) -> Void)
}

extension API: NewsServiceProtocol {
    
    func fetchNews(completion: @escaping (Result<NewsData, NetworkError>) -> Void) {
        executeRequestFor(router: .home, completion: completion)
    }
}

