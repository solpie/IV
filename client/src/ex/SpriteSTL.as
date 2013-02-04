package ex
{
import starling.display.DisplayObjectContainer;
import starling.display.Sprite;

public class SpriteSTL extends Sprite
	{
		public function SpriteSTL(parent:DisplayObjectContainer=null)
		{
			super();
			if(parent)parent.addChild(this);

		}
	}
}