# SpyApp

SpyApp is an IOS App contains with 4 differents encode and decode functions.

Extend the Cipher protocol to include a decrypt method.
 - The decrypt method should take in an encrypted string and a secret and should return a plaintext string.
 - Once you update the Cipher protocol you will have to update the CesarCipher with a decrypt method.
Create a new cipher named AlphanumericCesarCipher that implements the Cipher protocol. Add the cipher to the CipherFactory. Your cipher should:
 - Only take alphanumeric input. (characters A-Z, a-z and numbers 0-9)
 - The output should only include characters A-Z or 0-9. Lower-case characters should be converted to upper-case before they are encrypted.
 - The mapping should be cyclical in either direction.
   
   Example: Shifting by 1: Z maps to 0, 9 maps to A 
            Shifting by -1: A maps to 9, 0 maps to Z

Create at least two more cyphers for the spy app. Add all Ciphers you create to the CipherFactory and add buttons that allow the user to switch to all implemented ciphers.
 Comment your cipher. What characters are valid input, what is the output of your cipher.
 The decrypt method should reverse what the encrypt method does.
I Create two Cipher: R


Create layout constraints for all new buttons.
 Make sure your app looks good on devices with different resolutions and in both horizontal and vertical orientation.
 Play around a little with interface builder and improve the look of the app.
No input should crash the app. Unwrap all optionals the way we discussed in class (we will discuss optionals in week 2) and display an appropriate error method.
