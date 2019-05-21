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
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseExp: String!
    private var _nextEvolutionTxt: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var description: String {
        
        if _description == nil {
            
            _description = ""
        }
        
        return _description
    }
    
    var type: String {
        
        if _type == nil {
            
            _type = ""
        }
        
        return _type
    }
    
    var defense: String {
        
        if _defense == nil {
            
            _defense = ""
        }
        
        return _defense
    }
    
    var height: String {
        
        if _height == nil {
            
            _height = ""
        }
        
        return _height
    }
    
    var weight: String {
        
        if _weight == nil {
            
            _weight = ""
        }
        
        return _weight
    }
    
    var baseExp: String {
        
        if _baseExp == nil {
            
            _baseExp = ""
        }
        
        return _baseExp
    }
    
    var nextEvolutionTxt: String {
        
        if _nextEvolutionTxt == nil {
            
            _nextEvolutionTxt = ""
        }
        
        return _nextEvolutionTxt
    }
    
    
    
    init(name: String, pokedexId: Int){
        
        self._name = name
        self._pokedexId = pokedexId
        let pokeStringId = String(pokedexId)
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokeStringId)"
        
    }
    
    
    func downloadPokemonDetail (completed: @escaping DownloadComplete) {
        
        Alamofire.request(_pokemonURL).validate().responseJSON { response in
            
            
            if let dictionary = response.result.value as? Dictionary<String, AnyObject> {
                
                if let weight = dictionary["weight"] as? Int {
                    
                    self._weight = "\(weight)"
                }
                if let height = dictionary["height"] as? Int {
                    
                    self._height = "\(height)"
                }
                if let baseExp = dictionary["base_experience"] as? Int {
                    
                    self._baseExp = "\(baseExp)"
                }
                if let stats = dictionary["stats"] as? [Dictionary<String, Any?>]{
                    
                    if let defense = stats[3]["base_stat"] as? Int {
                       
                        self._defense = "\(defense)"
                    }
                }
                if let types = dictionary["types"] as? [Dictionary<String, Any?>]{
                    
                    if let type = types[0]["type"] as? Dictionary<String, String> {
                        
                        
                        self._type = type["name"]?.capitalized
                    }
                    
                    if types.count > 1 {
                        
                        for x in 1..<types.count {
                            
                            if let type = types[x]["type"] as? Dictionary<String,String> {
                                
                                if let name = type["name"]{
                                
                                    self._type! += "/\(name.capitalized)"
                                }
                            }
                        }
                    }
                }
            }
            completed()
        }
            //completed()
    }
    
    
    
}
