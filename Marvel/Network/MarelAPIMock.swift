//
//  MarelAPIMock.swift
//  Marvel
//
//  Created by gabriel.n.reynoso on 17/01/19.
//  Copyright © 2019 Thiago Lioy. All rights reserved.
//

import Foundation

class MarvelServiceMock: MarvelService {
    
    var mustSucced: Bool = true
    
    func fetchCharacters(query: String?, callback: @escaping (Result<[Character]>) -> Void) {
        
        let mocks: [Character] = [
            .init(id:0,name:"Adann",bio:"Campinas"),
            .init(id:1,name:"Isa",bio:"Recife"),
            .init(id:2,name:"Leonel",bio:"Brasília"),
            .init(id:3,name:"Gabriel",bio:"Manaus")
        ]
        
        if mustSucced {
            callback(.success(mocks))
        } else {
            callback(.error("Couldn't load characters this time. Try again later!"))
        }
    }
}
