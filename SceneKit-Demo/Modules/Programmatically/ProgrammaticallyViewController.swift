//
//  ProgrammaticallyViewController.swift
//  SceneKit-Demo
//
//  Created by Aitor Zubizarreta on 2023-04-30.
//

import UIKit
import SceneKit

class ProgrammaticallyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        createScene()
    }
    
    private func createScene() {
        let sceneView = SCNView(frame: view.frame)
        sceneView.allowsCameraControl = true // Allows user to manipulate camera.
        view.addSubview(sceneView)
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        // Camera.
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: -3.0, y: 3.0, z: 3.0)
        
        // Light.
        let light = SCNLight()
        light.type = .omni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 1.5, y: 1.5, z: 1.5)
        
        // Cube.
        let cubeGeometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        let cubeNode = SCNNode(geometry: cubeGeometry)
        
        let constraint = SCNLookAtConstraint(target: cubeNode)
        constraint.isGimbalLockEnabled = true
        cameraNode.constraints = [constraint]
        
        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cubeNode)
    }
    
}
