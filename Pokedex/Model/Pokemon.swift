//
//  Pokemon.swift
//  Pokedex
//
//  Created by Luis Santos on 12/17/18.
//  Copyright © 2018 Luis Santos. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    
    private var _description: String!
    private var _type: String!
    private var defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        
        self._name = name
        self._pokedexId = pokedexId
        let pokeStringId = String(pokedexId)
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokeStringId)"
        
    }
    
    
    func downloadPokemonDetail (completed: DownloadComplete) {
        
        Alamofire.request(_pokemonURL).validate().responseJSON { response in
            
            
            print(response.result.value)
            
        }
        
    }
    
    
    
}
