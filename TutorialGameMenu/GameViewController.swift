//
//  GameViewController.swift
//  TutorialGameMenu
//
//  Created by Gianluca on 16/03/15.
//  Copyright (c) 2015 KiokoKenda. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///////////////////////////////////////////////////
        // DEBUG:
        println("GameViewController didMoveToView method")
        
        let scene = GameMenu(size: view.bounds.size)
        // scene contiene la scena da usare
        let skView = view as! SKView
        // dall'apple developer reference:
        // An SKView object is a view that displays Sprite Kit content. 
        // This content is provided by an SKScene object.
        skView.showsFPS = true
        // mostra fps
        skView.showsNodeCount = true
        // mostra il numero di sprites sulla scena
        skView.ignoresSiblingOrder = false
        /* dall'apple developer reference:
        The default value is NO, which means that when multiple nodes share the same z position, those nodes are sorted and rendered in a deterministic order. Parents are rendered before their children, and siblings are rendered from eldest to youngest. When this property is set to YES, the position of the nodes in the tree is ignored when determining the rendering order. The rendering order of nodes at the same z position is arbitrary and may change every time a new frame is rendered. When sibling and parent order is ignored, Sprite Kit applies additional optimizations to improve rendering performance. If you need nodes to be rendered in a specific and deterministic order, you must set the z position of those nodes.
        */
        scene.scaleMode = .ResizeFill
        /*  dalla definizione in SKScene.h:
            case Fill /* Scale the SKScene to fill the entire SKView. */
            case AspectFill /* Scale the SKScene to fill the SKView while preserving the scene's aspect ratio. Some cropping may occur if the view has a different aspect ratio. */
            case AspectFit /* Scale the SKScene to fit within the SKView while preserving the scene's aspect ratio. Some letterboxing may occur if the view has a different aspect ratio. */
            case ResizeFill /* Modify the SKScene's actual size to exactly match the SKView. */
        */
        skView.presentScene(scene)  // passa alla scena
        //////////////////////////////////////////////////
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
