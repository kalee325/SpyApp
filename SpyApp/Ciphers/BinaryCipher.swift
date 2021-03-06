//
//  ReplaceCharCipher.swift
//  SpyApp
//
//  Created by Ka Lee on 5/15/19.
//  Copyright © 2019 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct BinaryCipher: CipherProtocol {
    func encrypt(plaintext: String, secret: String) -> String {
        //remove all whitespaces
        //let plaintext = String(plaintext.filter { !" \n\t\r".contains($0) })
        
        var encode = plaintext
        let binaryData = Data(encode.utf8) //convert String to Data
        
        //convert Data to binary(8 bits with leading 0) in String
        encode = (binaryData.reduce("") { (acc, byte) -> String in
            acc + String(byte, radix: 2).pad(with: "0", toLength: 8)
        })
        
        
        //insert whitespace for every 8 bits
        encode = String(encode.enumerated().map { $0 > 0 && $0 % 8 == 0 ? [" ", $1] : [$1]}.joined())
        
        //print(encode)

        return encode
    }
    
    func decrypt(plaintext: String, secret: String) -> String {
        
        //remove all whitespaces
        let plaintext = String(plaintext.filter { !" \n\t\r".contains($0) })
        
        var decode = plaintext
        
        //convert String to Data, and revert the result to String
        var index = decode.startIndex
        var result: String = ""
        for _ in 0..<decode.count/8 {
            let nextIndex = decode.index(index, offsetBy: 8)
            let charBits = decode[index..<nextIndex]
            result +=  String(UnicodeScalar(UInt8(charBits, radix: 2)!))
            index = nextIndex
        }
        decode = result
        //print(result)
        //print(plaintext)

        return decode
    }
}

//extension for padding binary value to 8 bits
extension String {
    public func pad(with padding: Character, toLength length: Int) -> String {
        let paddingWidth = length - self.count
        guard 0 < paddingWidth else { return self }
        
        return String(repeating: padding, count: paddingWidth) + self
    }
}
