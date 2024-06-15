//
//  ViewController.swift
//  iQuiz
//
//  Created by Aluno.Lab3 on 11/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botaoIniciarQuiz: UIButton!
    @IBAction func botaoPressionado(_ sender: Any) {
        print("O botao foi pressionado!")
    }
    
    @IBOutlet weak var botaoCriarQuiz: UIButton!
    @IBAction func botaoCriarQuiz(_ sender: Any) {
        print("O botão foi pressionado!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
        // Do any additional setup after loading the view.
    }
    
    func configuraLayout(){
        botaoIniciarQuiz.layer.cornerRadius = 12.0
        botaoCriarQuiz.layer.cornerRadius = 12.0
    }

}

