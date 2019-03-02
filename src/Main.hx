import hxd.Res;

typedef TiledMap = { layers:Array<{ data:Array<Int>}>, tilewidth:Int, tileheight:Int, width:Int, height:Int };

class Main extends hxd.App {
    override function init() {
        super.init();
        var mapData:TiledMap = haxe.Json.parse(hxd.Res.test_json.entry.getText());

        var tileImage  = hxd.Res.test_png.toTile();
        
        var groundLayer = new h2d.TileGroup(tileImage, s2d);
        
        var tw = mapData.tilewidth;
        var th = mapData.tileheight;
        var mw = mapData.width;
        var mh = mapData.height;
        
        for(layer in mapData.layers) {
            for(y in 0 ... mh) for (x in 0 ... mw) {
                var tid = layer.data[x + y * mw];
                if (tid != 0) {
                    groundLayer.add(x * tw, y * mapData.tilewidth, tileImage.sub(x * tw, y * th, tw, th));
                }
            }
        }
    }

    static function main() {
        Res.initEmbed();
        new Main();
    }
}