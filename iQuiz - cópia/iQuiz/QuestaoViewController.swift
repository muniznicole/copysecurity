//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Aluno.Lab3 on 11/06/24.
//

import UIKit

class QuestaoViewController: UIViewController {
    
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    
    @IBOutlet var botoesRespostas: [UIButton]!
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertouResposta =
            questoes[numeroQuestao].respostaCorreta == sender.tag
        
        if usuarioAcertouResposta {
            pontuacao += 1
            sender.backgroundColor =
                UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
        } else {
            sender.backgroundColor =
                UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
        }
        
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            Timer.scheduledTimer(
                timeInterval: 2,
                target: self,
                selector: #selector(configurarQuestao),
                userInfo: nil,
                repeats: false)
            configurarQuestao()
        } else {
            navegaParaTelaDesempenho()
        }
        
    }
    
    func navegaParaTelaDesempenho() {
        performSegue(
            withIdentifier: "irParaTelaDesempenho",
            sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurarLayout()
        configurarQuestao()
        
    }
    
    func configurarLayout(){
        tituloQuestaoLabel.numberOfLines = 0
        tituloQuestaoLabel.textAlignment = .center
        navigationItem.hidesBackButton = true
        for botao in botoesRespostas{
            botao.layer.cornerRadius = 12.0
        }
    }
    
    @objc func configurarQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        for botao in botoesRespostas {
            let tituloBotao = questoes [numeroQuestao].respostas[botao.tag]
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor =
                UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1.0)

        }
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC =
            segue.destination as?
            DesempenhoViewController else {return}
            desempenhoVC.pontuacao = pontuacao
        
    }
    

}
