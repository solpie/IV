package ex {
import flash.events.Event;

public class EventFLA extends Event {
    public var payload:Object;

    public function EventFLA(type:String, data:Object = null) {
        super(type, false, cancelable);
        if (data)payload = data;
    }

    public function get hasPayload():Boolean {
        if (payload)return true;
        return false;
    }
}
}