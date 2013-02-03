package ex
{
import feathers.controls.Button;

import starling.display.DisplayObjectContainer;

public class ButtonFEA extends Button
	{
		public function ButtonFEA(parent:DisplayObjectContainer=null)
		{
			super();
			if(parent)parent.addChild(this);
		}
	}
}