package mainGame
{
    import flash.utils.getQualifiedClassName;
    
    import starling.core.Starling;
    import starling.display.Button;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;
    import starling.text.TextField;
    import starling.textures.Texture;
    import starling.utils.VAlign;

    public class MainMenu extends Sprite
    {
        public function MainMenu()
        {
            init();
        }
        
        private function init():void
        {
            var logo:Image = new Image(Game.assets.getTexture("logo"));
            addChild(logo);
            

            
            var buttonTexture:Texture = Game.assets.getTexture("button_big");
            var count:int = 0;
            
            
            // show information about rendering method (hardware/software)
            
            var driverInfo:String = Starling.context.driverInfo;
            var infoText:TextField = new TextField(310, 64, driverInfo, "Verdana", 10);
            infoText.x = 5;
            infoText.y = 475 - infoText.height;
            infoText.vAlign = VAlign.BOTTOM;
            infoText.addEventListener(TouchEvent.TOUCH, onInfoTextTouched);
            addChildAt(infoText, 0);
        }
        
        private function onInfoTextTouched(event:TouchEvent):void
        {
            if (event.getTouch(this, TouchPhase.ENDED))
                Starling.current.showStats = !Starling.current.showStats;
        }
    }
}