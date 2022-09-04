//
//  RegisterViewController.swift
//  LoginFirebaseStoryboard
//
//  Created by Vinicius on 03/09/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailCadastroTextfield: UITextField!
    @IBOutlet weak var senhaCadastroTextfield: UITextField!
    var auth: Auth?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        navigationController?.isNavigationBarHidden = true
        emailCadastroTextfield.delegate = self
        senhaCadastroTextfield.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func fazerCadastro(_ sender: Any) {
        let email = emailCadastroTextfield.text ?? ""
        let password = senhaCadastroTextfield.text ?? ""
        
        auth?.createUser(withEmail: email, password: password, completion: { result, error in
            if error != nil {
                self.alert(title: "Erro", message: "Erro no cadastro")
                //print("Erro no cadastro")
            }else {
                self.alert(title: "Cadastro", message: "Cadastro com sucesso")
                self.senhaCadastroTextfield.text = " "
                self.emailCadastroTextfield.text = " "
            }
        })
    }
    
    @IBAction func voltarBotao(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
}

extension RegisterViewController: UITextFieldDelegate {

    
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
