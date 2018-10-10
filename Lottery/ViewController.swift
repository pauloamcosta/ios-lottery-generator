//
//  ViewController.swift
//  Lottery
//
//  Created by Paulo Costa on 09/10/2018.
//  Copyright © 2018 Paulo Costa. All rights reserved.
//

import UIKit

//Creating enum for each type of game
enum gameType: String{
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

//creating personalized operator for study purposes
infix operator >-<
func >-< (total: Int, universe: Int) -> [Int]{
    var result: [Int] = []
    while result.count < total {
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber){
            result.append(randomNumber)
        }
    }
    return result.sorted()
}

class ViewController: UIViewController {
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var ball: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .megasena)
        // Do any additional setup after loading the view, typically from a nib.
    }
    //function that will display the numbers on screen
    func showNumbers(for type: gameType){
        lbGameType.text = type.rawValue
        //Array containig the numbers to fill the balls
        var game: [Int] = []
        //switch to generate numbers according to game type
        switch type {
        case .megasena:
            game = 6>-<60
            ball.last!.isHidden = false //showing the last ball for a 6 balls game
        case .quina:
            game = 5>-<80
            ball.last!.isHidden = true //hiding the last ball for a 5 balls game
        }
        //game.enumerated gives back one tuple with key and value (index and game).
        for(index, game) in game.enumerated(){
            ball[index].setTitle("\(game)", for: .normal)
        }
    }
    
    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
        
        //megasena - six numbers game
        case 0:
            showNumbers(for: .megasena)
        //quina - five numbers game
        default:
            showNumbers(for: .quina)
            
        }
    }
}

