//
//  GameInProgress.swift
//  TutorialGameMenu
//
//  Created by Gianluca on 17/03/15.
//  Copyright (c) 2015 KiokoKenda. All rights reserved.
//

import UIKit
import SpriteKit

class GameInProgressScene: SKScene {
    var myLabel:SKLabelNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        // DEBUG:
        println("GameInProgress didMoveToView method")
        
        // impostiamo il colore di sfondo
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)

        // ora creiamo i bottoni
        var playButton = SKSpriteNode(imageNamed: "playBTN.png")
        playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        playButton.name = "playButton"
        // la zPosition determina il layer su cui disegnare la sprite
        playButton.zPosition = 0
        // + e' bassa, + e' sullo sfondo, + alta e', + e' in primo piano
        // virtualmente possiamo avere infinite zPosition, ma meglio nn eccedere
        // 2-3 vanno bene, 5 per i virtuosi, 10 se proprio vogliamo fare gli splendidi
        // esempio:
        // 0: background (montagne); 1: background dinamico (nuvole); 2: personaggio, nemici, oggetti;
        // 3: foreground (primo piano: piattaforme, alberi); 4: UI (score, vite, tasto pausa)
        
        var pauseButton = SKSpriteNode(imageNamed: "pauseBTN.png")
        pauseButton.position = CGPoint(x: self.frame.width - 50, y: self.frame.height - 50)
        pauseButton.name = "pauseButton"
        ///////////////////////////////////////////////////////////////////////////////////
        
        // Scaling: ridimensioniamo il bottone di pausa
        let aspectRatio = pauseButton.size.width/pauseButton.size.height
        var randWidth: CGFloat = pauseButton.size.width * 0.5
        pauseButton.size = CGSize(width: randWidth, height: randWidth/aspectRatio)
        //////////////////////////////////////////////////////////////////////////
        
        // ora mettiamo un testo sulla scena
        myLabel = SKLabelNode(fontNamed: "Arial")
        myLabel.text = "Premi per tornare al menu"
        // mettiamo la label in primo piano
        myLabel.zPosition = 2
        myLabel.fontSize = 20
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame) + 150, CGRectGetMidY(self.frame))
        //////////////////////////////////////////////////////////////////////////////////////////
        
        // ora mettiamo anche qualcosa che si muova sulla scena
        var sprite = SKSpriteNode(imageNamed: "utenteanonimoICO.png")
        // posizione sullo schermo Y
        let posY = Int(myLabel.position.y)
        // posiziono la sprite
        sprite.position = CGPoint(x: Int(self.frame.width), y: posY)
        // impostiamo una zPosition tale da passare sotto la label, ma sopra al bottone play
        sprite.zPosition = 1
        // rendiamo semitrasparente la nostra sprite
        sprite.alpha = 0.5
        // e diamo un ritardo tale che impieghi 10 secondi a compiere il tragitto
        let actualDuration = 10
        // creaimo le azioni di spostamento
        let actionMove = SKAction.moveTo(CGPoint(x: Int(-sprite.size.width/2), y: posY) , duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        sprite.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        /////////////////////////////////////////////////////////////////
        
        // inseriamo i bottoni nella scena
        self.addChild(playButton)
        self.addChild(pauseButton)
        self.addChild(myLabel)
        self.addChild(sprite)
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        // gamePause e' definita nell'AppDelegate
        // update viene chiamato in automatico prima del rendering della scena
        // quindi verifichiamo la pausa
        if gamePause { self.paused = true }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // DEBUG:
        println("GameInProgress touchesBegan method")
        
        // rileviamo il tocco
        var touch: UITouch = touches.anyObject() as UITouch
        // la posizione del tocco
        var location = touch.locationInNode(self)
        // e l'eventuale bottone alla posizione del tocco
        var node = self.nodeAtPoint(location)
        
        // se e' stato premuto il bottone pausa
        if (node.name == "pauseButton") {
            // DEBUG:
            println("pause button pressed")
            
            if !gamePause {
                // metto in pausa se nn sono in pausa
                gamePause = true
                // qui nn metto self.paused = true perche' ci pensera' update()
            }
            else {
                // senno' tolgo la pausa
                gamePause = false
                self.paused = false
            }
        }
        // se nn siamo in pausa
        if !gamePause {
            // se il bottone toccato e' il tasto play torniamo alla scena GameMenu
            if (node.name == "playButton") {
                // DEBUG:
                println("GameInProgress playButton pressed")
                
                var gameScene = GameMenu(size: self.size)
                var transition = SKTransition.doorsCloseHorizontalWithDuration(0.5)
                gameScene.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(gameScene, transition: transition)
            }
        }
    }
}
