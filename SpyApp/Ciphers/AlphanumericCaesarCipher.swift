//
//  AlphanumericCaesarCipher.swift
//  SpyApp
//
//  Created by Ka Lee on 5/14/19.
//  Copyright © 2019 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphanumericCaesarCipher: CipherProtocol {
    func encrypt(plaintext: String, secret: String) -> String {
        guard let secretInt = Int.init(secret) else {
            return "Please enter a secret integer"
        }
        
        var encode = ""
        let newplaintext = plaintext.uppercased()
        
        for (_, character) in newplaintext.enumerated() {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            var shiftedCharacter: String = ""
            
            if secretInt > 0 {
                
                shiftedCharacter = shiftForward(&shiftedUnicode, shiftByInt: secretInt)
                encode = encode + shiftedCharacter
                
            } else if secretInt < 0 {
                shiftedCharacter = shiftBackward(&shiftedUnicode, shiftByInt: secretInt)
                encode = encode + shiftedCharacter
            } else {
                return plaintext
            }
        }
        return encode
    }
    
    func decrypt(plaintext: String, secret: String) -> String {
        guard let secretInt = Int.init(secret) else {
            return "Please enter a secret integer"
        }
        
        var decode = ""
        let newplaintext = plaintext.uppercased()
        
        for (_, character) in newplaintext.enumerated() {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode
            var shiftedCharacter: String = ""
            
            if secretInt > 0 {
                
                shiftedCharacter = shiftBackward(&shiftedUnicode, shiftByInt: secretInt)
                decode = decode + shiftedCharacter
                
            } else if secretInt < 0 {
                shiftedCharacter = shiftForward(&shiftedUnicode, shiftByInt: secretInt)
                decode = decode + shiftedCharacter
            } else {
                return plaintext
            }
        }
        return decode
    }
    
    private func shiftForward (_ shiftedUnicode: inout UInt32, shiftByInt: Int) -> String {
        var shiftedChar = ""
        
        for _ in 1 ... abs(shiftByInt) {
            shiftedUnicode = shiftedUnicode + UInt32(1)
            
            // 9 maps to A
            if shiftedUnicode>57 && shiftedUnicode<65 {
                shiftedUnicode=65
            }
            
            // Z maps to 0
            if shiftedUnicode > 90 {
                shiftedUnicode = 48
            }
            shiftedChar = String(UnicodeScalar(UInt8(shiftedUnicode)))
        }
        
        return shiftedChar
    }
    
    private func shiftBackward(_ shiftedUnicode: inout UInt32, shiftByInt: Int) -> String {
        var shiftedChar = ""
        
        for _ in 1 ... abs(shiftByInt) {
            shiftedUnicode = shiftedUnicode - UInt32(1)
            
            // A maps to 9
            if shiftedUnicode>57 && shiftedUnicode<65 {
                shiftedUnicode=57
            }
            
            // 0 maps to Z
            if shiftedUnicode < 48 {
                shiftedUnicode = 90
            }
            shiftedChar = String(UnicodeScalar(UInt8(shiftedUnicode)))
        }
        
        return shiftedChar
    }
}
