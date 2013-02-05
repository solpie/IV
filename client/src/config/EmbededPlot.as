/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-5
 * Time: 下午4:05
 * To change this template use File | Settings | File Templates.
 */
package config {
import org.robotlegs.mvcs.Actor;

public class EmbededPlot extends Actor {
    [Embed(source="/config/plot.xml", mimeType="application/octet-stream")]
    public static const plot_xml:Class;

    [Embed(source="/config/event.xml", mimeType="application/octet-stream")]
    public static const event_xml:Class;

    private var p:Object;
    private var e:Object;

    public function EmbededPlot() {
        p = new plot_xml();
        e = new event_xml();
    }

    public function get plotXML():XML {
        return p as XML;
    }

    public function get eventXML():XML {
        return e as XML;
    }
}
}
