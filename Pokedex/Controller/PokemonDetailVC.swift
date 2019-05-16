//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Luis Santos on 5/15/19.
//  Copyright © 2019 Luis Santos. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    
    var pokemon: Pokemon!

    @IBOutlet weak var DetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailLabel.text = pokemon.name

    }

    

}
