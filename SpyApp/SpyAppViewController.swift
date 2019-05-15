import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var secretField: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var selectCipher: UILabel!
    
    var cipher: CipherProtocol?
    var cipherSelect = CipherFactory()

    @IBAction func encryptButtonPressed(_ sender: Any) {
        guard
            let plaintext = inputField.text,
            let secretString = secretField.text
        else {
            output.text = "No values provided"
            return
        }
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }

        output.text = cipher.encrypt(plaintext: plaintext, secret: secretString)
    }

    @IBAction func decryptButtonPressed(_ sender: Any) {
        guard
            let plaintext = inputField.text,
            let secretString = secretField.text
            else {
                output.text = "No values provided"
                return
        }
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        
        output.text = cipher.decrypt(plaintext: plaintext, secret: secretString)
    }
    
    @IBAction func selectedCipher(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {
            return
        }
        selectCipher.text = buttonTitle + " is selected"
        
        cipher = cipherSelect.cipher(for: buttonTitle)
    }
    @IBAction func copyButton(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        guard self.cipher != nil else {
            output.text = "No cipher selected"
            return
        }
        
        pasteboard.string = output.text

    }
    @IBAction func clearButton(_ sender: Any) {
        if inputField.text != nil{
            inputField.text = ""
        }
    }
}
