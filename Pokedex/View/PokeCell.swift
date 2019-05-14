//
//  PokeCell.swift
//  Pokedex
//
//  Created by Luis Santos on 12/23/18.
//  Copyright © 2018 Luis Santos. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbbImg: UIImageView!
    @IBOutlet weak var nameLbbl: UILabel!
    
    var pokemon:  Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell (pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLbbl.text = self.pokemon.name.capitalized
        thumbbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
    }
    
}
