package flash.display {
    import flash.display.LoaderInfo;
    import flash.display.DisplayObject;
    import flash.errors.IllegalOperationError;
    import flash.system.LoaderContext;
    import flash.utils.ByteArray;
    import flash.net.URLRequest;
    import flash.events.UncaughtErrorEvents;
    import __ruffle__.stub_method;

    [Ruffle(InstanceAllocator)]
    public class Loader extends DisplayObjectContainer {

        [Ruffle(NativeAccessible)]
        private var _contentLoaderInfo: LoaderInfo;

        public function get contentLoaderInfo():LoaderInfo {
            return this._contentLoaderInfo;
        }

        public function get content():DisplayObject {
            var absolutePath:Array = this._contentLoaderInfo.url.split("/");
            var file:String = absolutePath[absolutePath.length - 1];

            var whitelist:Array = ["Tapet_garden_winter23.png","Tapet_garden_winter24.png","Tapet_garden_winter25.png","Tapet_garden_winter27.png","Tapet_garden_winter26.png","Tapet_garden_winter33.png","Tapet_garden_winter29.png","Tapet_garden_winter28.png","Tapet_garden_winter34.png","Tapet_garden_winter32.png","Tapet_garden_winter30.png","Tapet_garden_winter35.png","Tapet_garden_winter31.png","Tapet_garden_winter21.png","Tapet_garden_winter20.png","Tapet_garden_winter22.png","Tapet_garden_winter19.png","Tapet_garden_winter11.png","Tapet_garden_winter12.png","Tapet_garden_winter10.png","Tapet_garden_winter1.png","Tapet_garden_winter8.png","Tapet_garden_winter5.png","Tapet_garden_winter9.png","Tapet_garden_winter3.png","Tapet_garden_winter4.png","Tapet_garden_winter7.png","Tapet_garden_winter2.png","Tapet_garden_winter6.png","Tapet_garden_winter18.png","Tapet_garden_winter15.png","Tapet_garden_winter17.png","Tapet_garden_winter14.png","Tapet_garden_winter16.png","Tapet_garden_winter13.png","garden_wall00.jpg","garden_wall01.jpg","garden_wall02.jpg","garden_wall03.jpg","garden_wall04.jpg","garden_wall05.jpg","garden_wall06.jpg","garden_wall07.jpg","garden_wall08.jpg","garden_wall09.jpg","garden_wall10.jpg","garden_wall11.jpg","Floor_garden_winter0016.png","Floor_garden_winter0006.png","Floor_garden_winter0011.png","Floor_garden_winter0001.png","Floor_garden_winter0009.png","Floor_garden_winter0005.png","Floor_garden_winter0008.png","Floor_garden_winter0002.png","Floor_garden_winter0014.png","Floor_garden_winter0004.png","Floor_garden_winter0012.png","Floor_garden_winter0010.png","garden_carpet00.jpg","garden_carpet01.jpg","garden_carpet02.jpg","garden_carpet03.jpg","garden_carpet04.jpg","garden_carpet05.jpg","garden_carpet06.jpg","garden_carpet07.jpg","garden_carpet08.jpg","wallpaper_christmas0034.png","wallpaper_christmas0037.png","wallpaper_christmas0036.png","wallpaper_christmas0035.png","wallpaper_christmas0040.png","wallpaper_christmas0039.png","wallpaper_christmas0038.png","wallpaper_christmas0018.png","wallpaper_christmas0019.png","wallpaper_christmas0016.png","wallpaper_christmas0015.png","wallpaper_christmas0017.png","wallpaper_christmas0013.png","wallpaper_christmas0014.png","wallpaper_christmas0011.png","wallpaper_christmas0012.png","wallpaper_christmas0033.png","Wallpaper_christmas_gingerbread.png","Wallpaper_christmas_gingerbread_green.png","Wallpaper_christmas_gingerbread_rosa.png","wallpaper_christmas0031.png","wallpaper_christmas0032.png","Wallpaper_christmas_gift_rosa.png","Wallpaper_christmas_gift_light_green.png","Wallpaper_christmas_gift_green.png","Wallpaper_christmas_gift_red_green.png","wallpaper_christmas0029.png","wallpaper_christmas0028.png","wallpaper_christmas0030.png","wallpaper_christmas0027.png","wallpaper_christmas0010.png","wallpaper_christmas0008.png","wallpaper_christmas0009.png","wallpaper_christmas0023.png","wallpaper_christmas0021.png","wallpaper_christmas0020.png","wallpaper_christmas0022.png","wallpaper_christmas0025.png","wallpaper_christmas0026.png","wallpaper_christmas0024.png","Bat Wall Dark Violet.png","Bat Wall Orange.png","Bat Wall Violet.png","Big Flower Wall Light Blue.png","Big Flower Wall Rose.png","Big Flower Wall.png","Flower Wall Green.png","Flower Wall Pink.png","Flower Wall Rose.png","Goldfish Wall Blue.png","Goldfish Wall Light Green.png","Goldfish Wall Orange.png","Halloween Pumpkin Wall Dark Blue.png","Halloween Pumpkin Wall Dark Maganta.png","Halloween Pumpkin Wall Orange.png","Halloween Pumpkin Wall PinkOrange.png","Halloween Punpkin Wall Blue.png","Octopus Wall Brown.png","Traffic Wall Blue.png","Traffic Wall Brown.png","Traffic Wall Green.png","Traffic Wall Lemon.png","Witches Rose.png","Witches Violet.png","babydots.jpg","p01-3.jpg","j02-1.jpg","Black Wood.jpg","wall0277.gif","thumb_wall23.gif","thumb_wall0189.gif","j10-2.jpg","thumb_wall04.gif","thumb_wall17.gif","txxs11.gif","p01-1.jpg","wall0342.jpg","c17-2.jpg","wall0228.jpg","wall0366.jpg","thumb_wall0126.gif","wall0289.gif","n02-5.jpg","p15-1.jpg","p10-1.jpg","wall0314.jpg","wall0324.jpg","wall0323.jpg","thumb_wall0204.jpg","wall0396.jpg","wall0355.jpg","thumb_wall15.gif","wall0376.jpg","Candy Stripes.jpg","wall0263.jpg","wall0312.jpg","thumb_wall32.jpg","Contrastz.jpg","thumb_wall0184.gif","wall0364.jpg","wall0259.gif","thumb_wall05.gif","thumb_wall0187.jpg","wall0274.jpg","thumb_wall0194.jpg","p26-1.jpg","wall0222.gif","txxs9.gif","txxs10.gif","n08-1.jpg","p27-1.jpg","thumb_wall43.jpg","n02-4.jpg","p11-1.jpg","wall0218.jpg","wall0211.jpg","thumb_wall28.gif","thumb_wall0167.jpg","thumb_wall39.gif","n02-1.jpg","Grey Wood.jpg","thumb_wall0203.gif","thumb_wall0148.jpg","wall0362.jpg","Mini Blue Pattern.jpg","Mini Green Pattern.jpg","Mini Lilac Pattern.jpg","Mini Purple Pattern.jpg","Mini Red Pattern.jpg","thumb_wall0112.gif","p28-1.jpg","txxs7.gif","p27-2.jpg","p10-3.jpg","p18-1.jpg","p01-2.jpg","Pink N Black.jpg","Pink Wood.jpg","thumb_wall14.jpg","txxs6.gif","wall0227.jpg","n02-2.jpg","thumb_wall0181.gif","Rainbow Stripez.jpg","j10-1.jpg","thumb_wall0164.gif","Red Ice.jpg","thumb_wall0220.gif","thumb_wall43.gif","thumb_wall0100.gif","thumb_wall10.jpg","wall0278.gif","wall0326.jpg","Soft Blue Pattern.jpg","Soft Brown Pattern.jpg","Soft Green Pattern.jpg","Soft Lilac Pattern.jpg","Soft Purple Pattern.jpg","thumb_wall0207.jpg","starblu_td.jpg","Stribeez.jpg","thumb_wall0119.jpg","wall0383.jpg","True White.jpg","thumb_wall0201.jpg","thumb_wall0185.gif","wall0213.gif","White Wood.jpg","tanne_white_color.jpg","dec_furniture_4.jpg","sykamor_color.jpg","thumb_wall0166.gif","dec_furniture_7.jpg","wall0215.jpg","c17-1.jpg","thumb_wall39.jpg","Baby Blues.jpg","wall0236.jpg","wall0256.jpg","Black.jpg","wall0231.jpg","Blue Sky.jpg","Boiling Blood.jpg","thumb_wall0179.jpg","Bright Neon.jpg","Bright Rainbow.jpg","Cazed.jpg","Classic Valentine.jpg","Crystal Lake.jpg","Dark Forrest.jpg","Dark Purple.jpg","Dark Sea.jpg","Dark Woods.jpg","wall0229.jpg","wall0304.jpg","Girly Pink.jpg","Grassy Green.jpg","dec_furniture_6.jpg","wall0250.jpg","wall0251.gif","thumb_wall0210.jpg","Hot Heartz.jpg","Hot Pink.jpg","wall0322.jpg","wall0249.jpg","Light Rainbow.jpg","Light Yellow.jpg","Linear Light.jpg","wall0295.jpg","Mili Green.jpg","Navy Blue.jpg","Neon Warrior.jpg","Noble Brown.jpg","Ocean.jpg","dec_furniture_5.jpg","Pastel.jpg","Peach.jpg","Perfect Day.jpg","Pinkyblue.jpg","Playboy.jpg","Playful.jpg","Punked.jpg","wall0273.jpg","Purple Dawn.jpg","Purple Heart.jpg","Ray of Light.jpg","Red Door.jpg","tapet_1.jpg","Rose.jpg","wall0302.jpg","Soft Pink.jpg","wall0333.jpg","thumb_wall0175.jpg","Summer Yellow.jpg","Sunset Orange.jpg","Swamp .jpg","wall0346.jpg","wall0309.jpg","Transition.jpg","True Blue.jpg","Twilight Purple.jpg","Wizard Grey.jpg","wall0247.jpg","dec_furniture_3.jpg","xmas_brickfloor00.png","xmas_brickfloor02.png","xmas_brickfloor01.png","xmas_brickfloor03.png","xmas_brickfloor04.png","xmas_floor01.png","xmas_floor03.png","xmas_floor02.png","xmas_floor00.png","Classic Carpet Blue.png","Classic Carpet Dark Green.png","Classic Carpet Green.png","Flower Carpet Black.png","Flower Carpet Lemon Violet.png","Flower Carpet Violet.png","Pattern Carpet Red Green.png","Pattern Carpet Red Lemon.png","Pattern Carpet Red Violet.png","Pattern Carpet Yellow Lemon.png","Stribed Floor Orange.png","Striped floor Violet.png","Wood Floor.png","babydots.jpg","p01-3.jpg","j02-1.jpg","Black Wood.jpg","wall0277.gif","thumb_wall23.gif","thumb_wall0189.gif","j10-2.jpg","thumb_wall04.gif","thumb_wall17.gif","txxs11.gif","p01-1.jpg","wall0342.jpg","c17-2.jpg","wall0228.jpg","wall0366.jpg","thumb_wall0126.gif","wall0289.gif","n02-5.jpg","p15-1.jpg","p10-1.jpg","wall0314.jpg","wall0324.jpg","wall0323.jpg","thumb_wall0204.jpg","wall0396.jpg","wall0355.jpg","thumb_wall15.gif","wall0376.jpg","Candy Stripes.jpg","wall0263.jpg","wall0312.jpg","thumb_wall32.jpg","Contrastz.jpg","thumb_wall0184.gif","wall0364.jpg","wall0259.gif","thumb_wall05.gif","thumb_wall0187.jpg","wall0274.jpg","thumb_wall0194.jpg","p26-1.jpg","wall0222.gif","txxs9.gif","txxs10.gif","n08-1.jpg","p27-1.jpg","thumb_wall43.jpg","n02-4.jpg","p11-1.jpg","wall0218.jpg","wall0211.jpg","thumb_wall28.gif","thumb_wall0167.jpg","thumb_wall39.gif","n02-1.jpg","Grey Wood.jpg","thumb_wall0203.gif","thumb_wall0148.jpg","wall0362.jpg","Mini Blue Pattern.jpg","Mini Green Pattern.jpg","Mini Lilac Pattern.jpg","Mini Purple Pattern.jpg","Mini Red Pattern.jpg","thumb_wall0112.gif","p28-1.jpg","txxs7.gif","p27-2.jpg","p10-3.jpg","p18-1.jpg","p01-2.jpg","Pink N Black.jpg","Pink Wood.jpg","thumb_wall14.jpg","txxs6.gif","wall0227.jpg","n02-2.jpg","thumb_wall0181.gif","Rainbow Stripez.jpg","j10-1.jpg","thumb_wall0164.gif","Red Ice.jpg","thumb_wall0220.gif","thumb_wall43.gif","thumb_wall0100.gif","thumb_wall10.jpg","wall0278.gif","wall0326.jpg","Soft Blue Pattern.jpg","Soft Brown Pattern.jpg","Soft Green Pattern.jpg","Soft Lilac Pattern.jpg","Soft Purple Pattern.jpg","thumb_wall0207.jpg","starblu_td.jpg","Stribeez.jpg","thumb_wall0119.jpg","wall0383.jpg","True White.jpg","thumb_wall0201.jpg","thumb_wall0185.gif","wall0213.gif","White Wood.jpg","tanne_white_color.jpg","dec_furniture_4.jpg","sykamor_color.jpg","thumb_wall0166.gif","dec_furniture_7.jpg","wall0215.jpg","c17-1.jpg","thumb_wall39.jpg","gulv_1.jpg"];

            if (this._contentLoaderInfo.contentType == "application/x-shockwave-flash" || whitelist.indexOf(file) != -1) {
                return this._contentLoaderInfo.content;
            } else {
                throw new Error("Error #2148: Only local-with-filesystem and trusted local SWF files may access local resources.", 2148);
            }
        }

        public native function load(request: URLRequest, context: LoaderContext = null):void;

        public native function loadBytes(data: ByteArray, context: LoaderContext = null):void;

        public native function unload():void;

        public function unloadAndStop(gc:Boolean = true):void {
            stub_method("flash.display.Loader", "unloadAndStop");
            this.unload();
        }

        public function close():void {
            stub_method("flash.display.Loader", "close");
        }

        override public function addChild(child:DisplayObject):DisplayObject {
            throw new IllegalOperationError("Error #2069: The Loader class does not implement this method.", 2069);
        }

        override public function addChildAt(child:DisplayObject, index:int):DisplayObject {
            throw new IllegalOperationError("Error #2069: The Loader class does not implement this method.", 2069);
        }

        override public function removeChild(child:DisplayObject):DisplayObject {
            throw new IllegalOperationError("Error #2069: The Loader class does not implement this method.", 2069);
        }

        override public function removeChildAt(index:int):DisplayObject {
            throw new IllegalOperationError("Error #2069: The Loader class does not implement this method.", 2069);
        }

        override public function setChildIndex(child:DisplayObject, index:int):void {
            throw new IllegalOperationError("Error #2069: The Loader class does not implement this method.", 2069);
        }

        public function get uncaughtErrorEvents():UncaughtErrorEvents {
            return this.contentLoaderInfo.uncaughtErrorEvents;
        }
    }
}
