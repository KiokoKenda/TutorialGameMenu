//
//  GameMenu.swift
//  TutorialGameMenu
//
//  Created by Gianluca on 17/03/15.
//  Copyright (c) 2015 KiokoKenda. All rights reserved.
//

import UIKit
import SpriteKit

class GameMenu: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        // DEBUG:
        println("GameScene didMoveToView method")
        
        // imposto il colore di sfondo
        self.backgroundColor = SKColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        
        // e creo il background
        var background = SKSpriteNode(imageNamed: "background.png")
        // lo posiziono al centro della scena
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        // qui invece creo i bottoni, prima peppe
        var peppe = SKSpriteNode(imageNamed: "peppeICO.png")
        peppe.position = CGPoint(x: 100, y: 300)
        peppe.name = "peppeButton"
        
        // il mio facciotto
        var alf = SKSpriteNode(imageNamed: "alfICO.png")
        alf.position = CGPoint(x: 200, y: 300)
        alf.name = "AlfButton"
        
        // mettiamo un utente generico
        var generalUser = SKSpriteNode(imageNamed: "utenteanonimoICO.png")
        generalUser.position = CGPoint(x: 300, y: 300)
        generalUser.name = "generalUser"
        
        // infine li visualizzo
        self.addChild(background)
        
        self.addChild(peppe)
        self.addChild(alf)
        self.addChild(generalUser)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // DEBUG:
        println("GameScene touchesBegan method")
        
        var touch: UITouch = touches.anyObject() as UITouch
        var location = touch.locationInNode(self)
        var node = self.nodeAtPoint(location)
        
        // If next button is touched, start transition to second scene
        if (node.name == "peppeButton") {
            // DEBUG:
            println("GameScene peppeButton pressed")
            
            var gameInProgressScene = GameInProgressScene(size: self.size)
            
            /* le varie transizioni fra le scene in SpriteKit sono queste:
            class func crossFadeWithDuration(sec: NSTimeInterval) -> SKTransition
            
            class func fadeWithDuration(sec: NSTimeInterval) -> SKTransition
            
            class func fadeWithColor(color: UIColor, duration sec: NSTimeInterval) -> SKTransition
            
            class func flipHorizontalWithDuration(sec: NSTimeInterval) -> SKTransition
            class func flipVerticalWithDuration(sec: NSTimeInterval) -> SKTransition
            
            class func revealWithDirection(direction: SKTransitionDirection, duration sec: NSTimeInterval) -> SKTransition
            class func moveInWithDirection(direction: SKTransitionDirection, duration sec: NSTimeInterval) -> SKTransition
            class func pushWithDirection(direction: SKTransitionDirection, duration sec: NSTimeInterval) -> SKTransition
            
            class func doorsOpenHorizontalWithDuration(sec: NSTimeInterval) -> SKTransition
            class func doorsOpenVerticalWithDuration(sec: NSTimeInterval) -> SKTransition
            class func doorsCloseHorizontalWithDuration(sec: NSTimeInterval) -> SKTransition
            class func doorsCloseVerticalWithDuration(sec: NSTimeInterval) -> SKTransition
            
            class func doorwayWithDuration(sec: NSTimeInterval) -> SKTransition
            */
            // proviamone qualcuna
            //var transition = SKTransition.flipVerticalWithDuration(1.0)
            //var transition = SKTransition.fadeWithDuration(1.0)
            var myColor = UIColor(red:0.0, green:0.0, blue:0.0, alpha:1.0)
            // fade off col nero
            //var transition = SKTransition.fadeWithColor(myColor, duration: 1.0)
            //var transition = SKTransition.flipHorizontalWithDuration(1.0)
            //var transition = SKTransition.revealWithDirection(SKTransitionDirection.Down, duration: 1.0)
            //var transition = SKTransition.moveInWithDirection(SKTransitionDirection.Up, duration: 1.0)
            //var transition = SKTransition.pushWithDirection(SKTransitionDirection.Right, duration: 1.0)
            var transition = SKTransition.doorwayWithDuration(1.0)
            
            gameInProgressScene.scaleMode = SKSceneScaleMode.AspectFill
            self.scene!.view?.presentScene(gameInProgressScene, transition: transition)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
