//
//  Model.swift
//  ModelPickerApp
//
//  Created by Hasan Khan on 2022-07-26.
//

import UIKit
import RealityKit
import Combine

class Model{
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String){
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename).sink(receiveCompletion: {
            loadCompletion in
            // error handling
            print("DEBUG: Unable to load modelEntity for modelName: \(self.modelName)")
        }, receiveValue: { modelEntity in
            // get model entity
            self.modelEntity = modelEntity
            print("DEBUG: Successfully loaded modelEntity for modelName: \(self.modelName)")
        })
        
    }
    
}
