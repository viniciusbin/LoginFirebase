//
//  LoginViewController.swift
//  LoginFirebaseStoryboard
//
//  Created by Vinicius on 03/09/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var LoginEmailTextfield: UITextField!
    @IBOutlet weak var LoginSenhaTextfield: UITextField!
    var auth: Auth?
    
    @IBOutlet weak var googleButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        LoginSenhaTextfield.delegate = self
        LoginEmailTextfield.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func doLoginButton(_ sender: Any) {
        let email = LoginEmailTextfield.text ?? ""
        let password = LoginSenhaTextfield.text ?? ""
        
        auth?.signIn(withEmail: email, password: password, completion: { user, error in
            if error != nil {
                self.LoginEmailTextfield.text = ""
                self.LoginSenhaTextfield.text = ""
                self.alert(title: "Oooopa", message: "Por favor, verifique seus dados")
                
            }else{
               if user == nil {
                   self.alert(title: "Opa!", message: "Erro inesperado")
                   
               }else{
                   self.alert(title: "Vamos lá", message: "Login realizado com sucesso")
                   self.LoginEmailTextfield.text = " "
                   self.LoginSenhaTextfield.text = " "
                   
               }
            }
        })
    }
    
  
}

extension LoginViewController: UITextFieldDelegate {

    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            textField.layer.borderWidth = 2.0
            textField.layer.borderColor = UIColor.red.cgColor
            
        }
    }
}
