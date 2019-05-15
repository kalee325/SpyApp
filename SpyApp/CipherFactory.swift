//
//  Ciphers.swift
//  SpyApp
//
//  Created by Ka Lee on 5/14/19.
//  Copyright © 2019 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

protocol CipherProtocol {
    func encrypt(plaintext: String, secret: String) -> String
    func decrypt(plaintext: String, secret: String) -> String
}

struct CipherFactory {
    
    private var ciphers: [String: CipherProtocol] = [
        "Caesar": CaesarCipher(),
        "Alphanumeric": AlphanumericCaesarCipher(),
        "ReversedCaesar": ReversedCaesarCipher(),
        "Binary": BinaryCipher()
        ]
    
    func cipher(for key: String) -> CipherProtocol {
        return ciphers[key]!
    }
}
