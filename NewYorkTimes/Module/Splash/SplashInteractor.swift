//
//  SplashInteractor.swift
//  NewYorkTimes
//
//  Created by Baris Akcay on 30.05.2024.
//

import Foundation

protocol SplashInteractorProtocol {
    func checkInternetConnection()
}

protocol SplashInteractorOutputProtocol {
    func internetConnection(status: Bool)
}

final class SplashInteractor {
    var output: SplashInteractorOutputProtocol?
}

extension SplashInteractor: SplashInteractorProtocol {
    
    func checkInternetConnection() {
        let internetStatus = API.shared.isConnectedToInternet()
        self.output?.internetConnection(status: internetStatus)
    }
}
