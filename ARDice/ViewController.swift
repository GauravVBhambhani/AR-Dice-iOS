//
//  ViewController.swift
//  ARDice
//
//  Created by Gaurav Bhambhani on 6/7/23.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self

        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true){
           
            diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
            
            sceneView.scene.rootNode.addChildNode(diceNode)
        }
        
        
        
        // Set the scene to the view
//        sceneView.scene = scene
        
        
        
        // created a cube using SCNBox from SceneKit Framework
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01);
        
//        let sphere = SCNSphere(radius: 0.2)
        
//        Created material, just blue color for now
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "art.scnassets/jupiter.jpeg")
//        // only one material for now
//        sphere.materials = [material]
//
//        // created a point in 3d space (node)
//        let node = SCNNode()
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
//
//        node.geometry = sphere
//
//        // adding childnode to our rootnode
//        sceneView.scene.rootNode.addChildNode(node)
//
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
       
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
            
        // Run the view's session
        sceneView.session.run(configuration)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }


}
