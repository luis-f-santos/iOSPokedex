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
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var DescriptionLbl: UILabel!
    
    
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseExpLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evolutionLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailLabel.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")

        MainImage.image = img
        currentEvoImg.image = img
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        
        
        pokemon.downloadPokemonDetail {
            //Called after network call is complete
            
            self.updateUI()
        }
    }

    func updateUI() {
        
        typeLbl.text = pokemon.type
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        defenseLbl.text = pokemon.defense
        baseExpLbl.text = pokemon.baseExp
        
        
    }
    
    
    
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil )
        
    }
    

}
