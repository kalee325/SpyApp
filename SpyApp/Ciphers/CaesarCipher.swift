//
//  CaesarCipher.swift
//  SpyApp
//
//  Created by Ka Lee on 5/14/19.
//  Copyright © 2019 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct CaesarCipher: CipherProtocol {
    func encrypt(plaintext: String, secret: String) -> String {
        guard let secretInt = UInt32(secret) else {
            return "Please enter a secret integer"
        }
        
        var encode = ""
        for character in plaintext {
            guard let firstUnicodeScalar = character.unicodeScalars.first
                else{
                    continue
            }
            let unicode = firstUnicodeScalar.value
            let shiftedUnicode = unicode + secretInt
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            
            encode += shiftedCharacter
        }
        
        return encode
    }
    
    func decrypt(plaintext: String, secret: String) -> String {
        guard let secretInt = UInt32(secret) else {
            return "Please enter a secret integer"
        }
        
        var decode = ""
        for character in plaintext {
            guard let firstUnicodeScalar = character.unicodeScalars.first
                else{
                    continue
            }
            let unicode = firstUnicodeScalar.value
            let shiftedUnicode = unicode - secretInt
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            
            decode += shiftedCharacter
        }
        
        return decode
    }
}

