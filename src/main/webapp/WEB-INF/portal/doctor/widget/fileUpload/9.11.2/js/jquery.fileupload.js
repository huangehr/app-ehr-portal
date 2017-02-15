!function(a){"use strict";var b=function(a,c,d){var e,f,g=document.createElement("img");if(g.onerror=c,g.onload=function(){!f||d&&d.noRevoke||b.revokeObjectURL(f),c&&c(b.scale(g,d))},b.isInstanceOf("Blob",a)||b.isInstanceOf("File",a))e=f=b.createObjectURL(a),g._type=a.type;else{if("string"!=typeof a)return!1;e=a,d&&d.crossOrigin&&(g.crossOrigin=d.crossOrigin)}return e?(g.src=e,g):b.readFile(a,function(a){var b=a.target;b&&b.result?g.src=b.result:c&&c(a)})},c=window.createObjectURL&&window||window.URL&&URL.revokeObjectURL&&URL||window.webkitURL&&webkitURL;b.isInstanceOf=function(a,b){return Object.prototype.toString.call(b)==="[object "+a+"]"},b.transformCoordinates=function(){},b.getTransformedOptions=function(a,b){var c,d,e,f,g=b.aspectRatio;if(!g)return b;c={};for(d in b)b.hasOwnProperty(d)&&(c[d]=b[d]);return c.crop=!0,e=a.naturalWidth||a.width,f=a.naturalHeight||a.height,e/f>g?(c.maxWidth=f*g,c.maxHeight=f):(c.maxWidth=e,c.maxHeight=e/g),c},b.renderImageToCanvas=function(a,b,c,d,e,f,g,h,i,j){return a.getContext("2d").drawImage(b,c,d,e,f,g,h,i,j),a},b.hasCanvasOption=function(a){return a.canvas||a.crop||a.aspectRatio},b.scale=function(a,c){c=c||{};var d,e,f,g,h,i,j,k,l,m=document.createElement("canvas"),n=a.getContext||b.hasCanvasOption(c)&&m.getContext,o=a.naturalWidth||a.width,p=a.naturalHeight||a.height,q=o,r=p,s=function(){var a=Math.max((f||q)/q,(g||r)/r);a>1&&(q*=a,r*=a)},t=function(){var a=Math.min((d||q)/q,(e||r)/r);1>a&&(q*=a,r*=a)};return n&&(c=b.getTransformedOptions(a,c),j=c.left||0,k=c.top||0,c.sourceWidth?(h=c.sourceWidth,void 0!==c.right&&void 0===c.left&&(j=o-h-c.right)):h=o-j-(c.right||0),c.sourceHeight?(i=c.sourceHeight,void 0!==c.bottom&&void 0===c.top&&(k=p-i-c.bottom)):i=p-k-(c.bottom||0),q=h,r=i),d=c.maxWidth,e=c.maxHeight,f=c.minWidth,g=c.minHeight,n&&d&&e&&c.crop?(q=d,r=e,l=h/i-d/e,0>l?(i=e*h/d,void 0===c.top&&void 0===c.bottom&&(k=(p-i)/2)):l>0&&(h=d*i/e,void 0===c.left&&void 0===c.right&&(j=(o-h)/2))):((c.contain||c.cover)&&(f=d=d||f,g=e=e||g),c.cover?(t(),s()):(s(),t())),n?(m.width=q,m.height=r,b.transformCoordinates(m,c),b.renderImageToCanvas(m,a,j,k,h,i,0,0,q,r)):(a.width=q,a.height=r,a)},b.createObjectURL=function(a){return c?c.createObjectURL(a):!1},b.revokeObjectURL=function(a){return c?c.revokeObjectURL(a):!1},b.readFile=function(a,b,c){if(window.FileReader){var d=new FileReader;if(d.onload=d.onerror=b,c=c||"readAsDataURL",d[c])return d[c](a),d}return!1},"function"==typeof define&&define.amd?define(function(){return b}):a.loadImage=b}(window),function(a){"use strict";"function"==typeof define&&define.amd?define(["load-image"],a):a(window.loadImage)}(function(a){"use strict";if(window.navigator&&window.navigator.platform&&/iP(hone|od|ad)/.test(window.navigator.platform)){var b=a.renderImageToCanvas;a.detectSubsampling=function(a){var b,c;return a.width*a.height>1048576?(b=document.createElement("canvas"),b.width=b.height=1,c=b.getContext("2d"),c.drawImage(a,-a.width+1,0),0===c.getImageData(0,0,1,1).data[3]):!1},a.detectVerticalSquash=function(a,b){var c,d,e,f,g,h=a.naturalHeight||a.height,i=document.createElement("canvas"),j=i.getContext("2d");for(b&&(h/=2),i.width=1,i.height=h,j.drawImage(a,0,0),c=j.getImageData(0,0,1,h).data,d=0,e=h,f=h;f>d;)g=c[4*(f-1)+3],0===g?e=f:d=f,f=e+d>>1;return f/h||1},a.renderImageToCanvas=function(c,d,e,f,g,h,i,j,k,l){if("image/jpeg"===d._type){var m,n,o,p,q=c.getContext("2d"),r=document.createElement("canvas"),s=1024,t=r.getContext("2d");if(r.width=s,r.height=s,q.save(),m=a.detectSubsampling(d),m&&(e/=2,f/=2,g/=2,h/=2),n=a.detectVerticalSquash(d,m),m||1!==n){for(f*=n,k=Math.ceil(s*k/g),l=Math.ceil(s*l/h/n),j=0,p=0;h>p;){for(i=0,o=0;g>o;)t.clearRect(0,0,s,s),t.drawImage(d,e,f,g,h,-o,-p,g,h),q.drawImage(r,0,0,s,s,i,j,k,l),o+=s,i+=k;p+=s,j+=l}return q.restore(),c}}return b(c,d,e,f,g,h,i,j,k,l)}}}),function(a){"use strict";"function"==typeof define&&define.amd?define(["load-image"],a):a(window.loadImage)}(function(a){"use strict";var b=a.hasCanvasOption,c=a.transformCoordinates,d=a.getTransformedOptions;a.hasCanvasOption=function(c){return b.call(a,c)||c.orientation},a.transformCoordinates=function(b,d){c.call(a,b,d);var e=b.getContext("2d"),f=b.width,g=b.height,h=d.orientation;if(h&&!(h>8))switch(h>4&&(b.width=g,b.height=f),h){case 2:e.translate(f,0),e.scale(-1,1);break;case 3:e.translate(f,g),e.rotate(Math.PI);break;case 4:e.translate(0,g),e.scale(1,-1);break;case 5:e.rotate(.5*Math.PI),e.scale(1,-1);break;case 6:e.rotate(.5*Math.PI),e.translate(0,-g);break;case 7:e.rotate(.5*Math.PI),e.translate(f,-g),e.scale(-1,1);break;case 8:e.rotate(-.5*Math.PI),e.translate(-f,0)}},a.getTransformedOptions=function(b,c){var e,f,g=d.call(a,b,c),h=g.orientation;if(!h||h>8||1===h)return g;e={};for(f in g)g.hasOwnProperty(f)&&(e[f]=g[f]);switch(g.orientation){case 2:e.left=g.right,e.right=g.left;break;case 3:e.left=g.right,e.top=g.bottom,e.right=g.left,e.bottom=g.top;break;case 4:e.top=g.bottom,e.bottom=g.top;break;case 5:e.left=g.top,e.top=g.left,e.right=g.bottom,e.bottom=g.right;break;case 6:e.left=g.top,e.top=g.right,e.right=g.bottom,e.bottom=g.left;break;case 7:e.left=g.bottom,e.top=g.right,e.right=g.top,e.bottom=g.left;break;case 8:e.left=g.bottom,e.top=g.left,e.right=g.top,e.bottom=g.right}return g.orientation>4&&(e.maxWidth=g.maxHeight,e.maxHeight=g.maxWidth,e.minWidth=g.minHeight,e.minHeight=g.minWidth,e.sourceWidth=g.sourceHeight,e.sourceHeight=g.sourceWidth),e}}),function(a){"use strict";"function"==typeof define&&define.amd?define(["load-image"],a):a(window.loadImage)}(function(a){"use strict";var b=window.Blob&&(Blob.prototype.slice||Blob.prototype.webkitSlice||Blob.prototype.mozSlice);a.blobSlice=b&&function(){var a=this.slice||this.webkitSlice||this.mozSlice;return a.apply(this,arguments)},a.metaDataParsers={jpeg:{65505:[]}},a.parseMetaData=function(b,c,d){d=d||{};var e=this,f=d.maxMetaDataSize||262144,g={},h=!(window.DataView&&b&&b.size>=12&&"image/jpeg"===b.type&&a.blobSlice);(h||!a.readFile(a.blobSlice.call(b,0,f),function(b){if(b.target.error)return console.log(b.target.error),void c(g);var f,h,i,j,k=b.target.result,l=new DataView(k),m=2,n=l.byteLength-4,o=m;if(65496===l.getUint16(0)){for(;n>m&&(f=l.getUint16(m),f>=65504&&65519>=f||65534===f);){if(h=l.getUint16(m+2)+2,m+h>l.byteLength){console.log("Invalid meta data: Invalid segment size.");break}if(i=a.metaDataParsers.jpeg[f])for(j=0;j<i.length;j+=1)i[j].call(e,l,m,h,g,d);m+=h,o=m}!d.disableImageHead&&o>6&&(g.imageHead=k.slice?k.slice(0,o):new Uint8Array(k).subarray(0,o))}else console.log("Invalid JPEG file: Missing JPEG marker.");c(g)},"readAsArrayBuffer"))&&c(g)}}),function(a){"use strict";"function"==typeof define&&define.amd?define(["load-image","load-image-meta"],a):a(window.loadImage)}(function(a){"use strict";a.ExifMap=function(){return this},a.ExifMap.prototype.map={Orientation:274},a.ExifMap.prototype.get=function(a){return this[a]||this[this.map[a]]},a.getExifThumbnail=function(a,b,c){var d,e,f;if(!c||b+c>a.byteLength)return void console.log("Invalid Exif data: Invalid thumbnail data.");for(d=[],e=0;c>e;e+=1)f=a.getUint8(b+e),d.push((16>f?"0":"")+f.toString(16));return"data:image/jpeg,%"+d.join("%")},a.exifTagTypes={1:{getValue:function(a,b){return a.getUint8(b)},size:1},2:{getValue:function(a,b){return String.fromCharCode(a.getUint8(b))},size:1,ascii:!0},3:{getValue:function(a,b,c){return a.getUint16(b,c)},size:2},4:{getValue:function(a,b,c){return a.getUint32(b,c)},size:4},5:{getValue:function(a,b,c){return a.getUint32(b,c)/a.getUint32(b+4,c)},size:8},9:{getValue:function(a,b,c){return a.getInt32(b,c)},size:4},10:{getValue:function(a,b,c){return a.getInt32(b,c)/a.getInt32(b+4,c)},size:8}},a.exifTagTypes[7]=a.exifTagTypes[1],a.getExifValue=function(b,c,d,e,f,g){var h,i,j,k,l,m,n=a.exifTagTypes[e];if(!n)return void console.log("Invalid Exif data: Invalid tag type.");if(h=n.size*f,i=h>4?c+b.getUint32(d+8,g):d+8,i+h>b.byteLength)return void console.log("Invalid Exif data: Invalid data offset.");if(1===f)return n.getValue(b,i,g);for(j=[],k=0;f>k;k+=1)j[k]=n.getValue(b,i+k*n.size,g);if(n.ascii){for(l="",k=0;k<j.length&&(m=j[k],"\x00"!==m);k+=1)l+=m;return l}return j},a.parseExifTag=function(b,c,d,e,f){var g=b.getUint16(d,e);f.exif[g]=a.getExifValue(b,c,d,b.getUint16(d+2,e),b.getUint32(d+4,e),e)},a.parseExifTags=function(a,b,c,d,e){var f,g,h;if(c+6>a.byteLength)return void console.log("Invalid Exif data: Invalid directory offset.");if(f=a.getUint16(c,d),g=c+2+12*f,g+4>a.byteLength)return void console.log("Invalid Exif data: Invalid directory size.");for(h=0;f>h;h+=1)this.parseExifTag(a,b,c+2+12*h,d,e);return a.getUint32(g,d)},a.parseExifData=function(b,c,d,e,f){if(!f.disableExif){var g,h,i,j=c+10;if(1165519206===b.getUint32(c+4)){if(j+8>b.byteLength)return void console.log("Invalid Exif data: Invalid segment size.");if(0!==b.getUint16(c+8))return void console.log("Invalid Exif data: Missing byte alignment offset.");switch(b.getUint16(j)){case 18761:g=!0;break;case 19789:g=!1;break;default:return void console.log("Invalid Exif data: Invalid byte alignment marker.")}if(42!==b.getUint16(j+2,g))return void console.log("Invalid Exif data: Missing TIFF marker.");h=b.getUint32(j+4,g),e.exif=new a.ExifMap,h=a.parseExifTags(b,j,j+h,g,e),h&&!f.disableExifThumbnail&&(i={exif:{}},h=a.parseExifTags(b,j,j+h,g,i),i.exif[513]&&(e.exif.Thumbnail=a.getExifThumbnail(b,j+i.exif[513],i.exif[514]))),e.exif[34665]&&!f.disableExifSub&&a.parseExifTags(b,j,j+e.exif[34665],g,e),e.exif[34853]&&!f.disableExifGps&&a.parseExifTags(b,j,j+e.exif[34853],g,e)}}},a.metaDataParsers.jpeg[65505].push(a.parseExifData)}),function(a){"use strict";"function"==typeof define&&define.amd?define(["load-image","load-image-exif"],a):a(window.loadImage)}(function(a){"use strict";a.ExifMap.prototype.tags={256:"ImageWidth",257:"ImageHeight",34665:"ExifIFDPointer",34853:"GPSInfoIFDPointer",40965:"InteroperabilityIFDPointer",258:"BitsPerSample",259:"Compression",262:"PhotometricInterpretation",274:"Orientation",277:"SamplesPerPixel",284:"PlanarConfiguration",530:"YCbCrSubSampling",531:"YCbCrPositioning",282:"XResolution",283:"YResolution",296:"ResolutionUnit",273:"StripOffsets",278:"RowsPerStrip",279:"StripByteCounts",513:"JPEGInterchangeFormat",514:"JPEGInterchangeFormatLength",301:"TransferFunction",318:"WhitePoint",319:"PrimaryChromaticities",529:"YCbCrCoefficients",532:"ReferenceBlackWhite",306:"DateTime",270:"ImageDescription",271:"Make",272:"Model",305:"Software",315:"Artist",33432:"Copyright",36864:"ExifVersion",40960:"FlashpixVersion",40961:"ColorSpace",40962:"PixelXDimension",40963:"PixelYDimension",42240:"Gamma",37121:"ComponentsConfiguration",37122:"CompressedBitsPerPixel",37500:"MakerNote",37510:"UserComment",40964:"RelatedSoundFile",36867:"DateTimeOriginal",36868:"DateTimeDigitized",37520:"SubSecTime",37521:"SubSecTimeOriginal",37522:"SubSecTimeDigitized",33434:"ExposureTime",33437:"FNumber",34850:"ExposureProgram",34852:"SpectralSensitivity",34855:"PhotographicSensitivity",34856:"OECF",34864:"SensitivityType",34865:"StandardOutputSensitivity",34866:"RecommendedExposureIndex",34867:"ISOSpeed",34868:"ISOSpeedLatitudeyyy",34869:"ISOSpeedLatitudezzz",37377:"ShutterSpeedValue",37378:"ApertureValue",37379:"BrightnessValue",37380:"ExposureBias",37381:"MaxApertureValue",37382:"SubjectDistance",37383:"MeteringMode",37384:"LightSource",37385:"Flash",37396:"SubjectArea",37386:"FocalLength",41483:"FlashEnergy",41484:"SpatialFrequencyResponse",41486:"FocalPlaneXResolution",41487:"FocalPlaneYResolution",41488:"FocalPlaneResolutionUnit",41492:"SubjectLocation",41493:"ExposureIndex",41495:"SensingMethod",41728:"FileSource",41729:"SceneType",41730:"CFAPattern",41985:"CustomRendered",41986:"ExposureMode",41987:"WhiteBalance",41988:"DigitalZoomRatio",41989:"FocalLengthIn35mmFilm",41990:"SceneCaptureType",41991:"GainControl",41992:"Contrast",41993:"Saturation",41994:"Sharpness",41995:"DeviceSettingDescription",41996:"SubjectDistanceRange",42016:"ImageUniqueID",42032:"CameraOwnerName",42033:"BodySerialNumber",42034:"LensSpecification",42035:"LensMake",42036:"LensModel",42037:"LensSerialNumber",0:"GPSVersionID",1:"GPSLatitudeRef",2:"GPSLatitude",3:"GPSLongitudeRef",4:"GPSLongitude",5:"GPSAltitudeRef",6:"GPSAltitude",7:"GPSTimeStamp",8:"GPSSatellites",9:"GPSStatus",10:"GPSMeasureMode",11:"GPSDOP",12:"GPSSpeedRef",13:"GPSSpeed",14:"GPSTrackRef",15:"GPSTrack",16:"GPSImgDirectionRef",17:"GPSImgDirection",18:"GPSMapDatum",19:"GPSDestLatitudeRef",20:"GPSDestLatitude",21:"GPSDestLongitudeRef",22:"GPSDestLongitude",23:"GPSDestBearingRef",24:"GPSDestBearing",25:"GPSDestDistanceRef",26:"GPSDestDistance",27:"GPSProcessingMethod",28:"GPSAreaInformation",29:"GPSDateStamp",30:"GPSDifferential",31:"GPSHPositioningError"},a.ExifMap.prototype.stringValues={ExposureProgram:{0:"Undefined",1:"Manual",2:"Normal program",3:"Aperture priority",4:"Shutter priority",5:"Creative program",6:"Action program",7:"Portrait mode",8:"Landscape mode"},MeteringMode:{0:"Unknown",1:"Average",2:"CenterWeightedAverage",3:"Spot",4:"MultiSpot",5:"Pattern",6:"Partial",255:"Other"},LightSource:{0:"Unknown",1:"Daylight",2:"Fluorescent",3:"Tungsten (incandescent light)",4:"Flash",9:"Fine weather",10:"Cloudy weather",11:"Shade",12:"Daylight fluorescent (D 5700 - 7100K)",13:"Day white fluorescent (N 4600 - 5400K)",14:"Cool white fluorescent (W 3900 - 4500K)",15:"White fluorescent (WW 3200 - 3700K)",17:"Standard light A",18:"Standard light B",19:"Standard light C",20:"D55",21:"D65",22:"D75",23:"D50",24:"ISO studio tungsten",255:"Other"},Flash:{0:"Flash did not fire",1:"Flash fired",5:"Strobe return light not detected",7:"Strobe return light detected",9:"Flash fired, compulsory flash mode",13:"Flash fired, compulsory flash mode, return light not detected",15:"Flash fired, compulsory flash mode, return light detected",16:"Flash did not fire, compulsory flash mode",24:"Flash did not fire, auto mode",25:"Flash fired, auto mode",29:"Flash fired, auto mode, return light not detected",31:"Flash fired, auto mode, return light detected",32:"No flash function",65:"Flash fired, red-eye reduction mode",69:"Flash fired, red-eye reduction mode, return light not detected",71:"Flash fired, red-eye reduction mode, return light detected",73:"Flash fired, compulsory flash mode, red-eye reduction mode",77:"Flash fired, compulsory flash mode, red-eye reduction mode, return light not detected",79:"Flash fired, compulsory flash mode, red-eye reduction mode, return light detected",89:"Flash fired, auto mode, red-eye reduction mode",93:"Flash fired, auto mode, return light not detected, red-eye reduction mode",95:"Flash fired, auto mode, return light detected, red-eye reduction mode"},SensingMethod:{1:"Undefined",2:"One-chip color area sensor",3:"Two-chip color area sensor",4:"Three-chip color area sensor",5:"Color sequential area sensor",7:"Trilinear sensor",8:"Color sequential linear sensor"},SceneCaptureType:{0:"Standard",1:"Landscape",2:"Portrait",3:"Night scene"},SceneType:{1:"Directly photographed"},CustomRendered:{0:"Normal process",1:"Custom process"},WhiteBalance:{0:"Auto white balance",1:"Manual white balance"},GainControl:{0:"None",1:"Low gain up",2:"High gain up",3:"Low gain down",4:"High gain down"},Contrast:{0:"Normal",1:"Soft",2:"Hard"},Saturation:{0:"Normal",1:"Low saturation",2:"High saturation"},Sharpness:{0:"Normal",1:"Soft",2:"Hard"},SubjectDistanceRange:{0:"Unknown",1:"Macro",2:"Close view",3:"Distant view"},FileSource:{3:"DSC"},ComponentsConfiguration:{0:"",1:"Y",2:"Cb",3:"Cr",4:"R",5:"G",6:"B"},Orientation:{1:"top-left",2:"top-right",3:"bottom-right",4:"bottom-left",5:"left-top",6:"right-top",7:"right-bottom",8:"left-bottom"}},a.ExifMap.prototype.getText=function(a){var b=this.get(a);switch(a){case"LightSource":case"Flash":case"MeteringMode":case"ExposureProgram":case"SensingMethod":case"SceneCaptureType":case"SceneType":case"CustomRendered":case"WhiteBalance":case"GainControl":case"Contrast":case"Saturation":case"Sharpness":case"SubjectDistanceRange":case"FileSource":case"Orientation":return this.stringValues[a][b];case"ExifVersion":case"FlashpixVersion":return String.fromCharCode(b[0],b[1],b[2],b[3]);case"ComponentsConfiguration":return this.stringValues[a][b[0]]+this.stringValues[a][b[1]]+this.stringValues[a][b[2]]+this.stringValues[a][b[3]];case"GPSVersionID":return b[0]+"."+b[1]+"."+b[2]+"."+b[3]}return String(b)},function(a){var b,c=a.tags,d=a.map;for(b in c)c.hasOwnProperty(b)&&(d[c[b]]=b)}(a.ExifMap.prototype),a.ExifMap.prototype.getAll=function(){var a,b,c={};for(a in this)this.hasOwnProperty(a)&&(b=this.tags[a],b&&(c[b]=this.getText(b)));return c}});

/*
 * jquery.ui.widget
 */

;(function( factory ) {
	if ( typeof define === "function" && define.amd ) {

		define([ "jquery" ], factory );

	} else if ( typeof exports === "object" ) {

		factory( require( "jquery" ) );

	} else {
		factory( jQuery );
	}
}(function( $ ) {


	var widget_uuid = 0,
		widget_slice = Array.prototype.slice;

	$.cleanData = (function( orig ) {
		return function( elems ) {
			var events, elem, i;
			for ( i = 0; (elem = elems[i]) != null; i++ ) {
				try {
					events = $._data( elem, "events" );
					if ( events && events.remove ) {
						$( elem ).triggerHandler( "remove" );
					}

				} catch ( e ) {}
			}
			orig( elems );
		};
	})( $.cleanData );

	$.widget = function( name, base, prototype ) {
		var fullName, existingConstructor, constructor, basePrototype,
			proxiedPrototype = {},
			namespace = name.split( "." )[ 0 ];

		name = name.split( "." )[ 1 ];
		fullName = namespace + "-" + name;

		if ( !prototype ) {
			prototype = base;
			base = $.Widget;
		}

		$.expr[ ":" ][ fullName.toLowerCase() ] = function( elem ) {
			return !!$.data( elem, fullName );
		};

		$[ namespace ] = $[ namespace ] || {};
		existingConstructor = $[ namespace ][ name ];
		constructor = $[ namespace ][ name ] = function( options, element ) {
			if ( !this._createWidget ) {
				return new constructor( options, element );
			}

			if ( arguments.length ) {
				this._createWidget( options, element );
			}
		};
		$.extend( constructor, existingConstructor, {
			version: prototype.version,
			_proto: $.extend( {}, prototype ),
			_childConstructors: []
		});

		basePrototype = new base();
		basePrototype.options = $.widget.extend( {}, basePrototype.options );
		$.each( prototype, function( prop, value ) {
			if ( !$.isFunction( value ) ) {
				proxiedPrototype[ prop ] = value;
				return;
			}
			proxiedPrototype[ prop ] = (function() {
				var _super = function() {
						return base.prototype[ prop ].apply( this, arguments );
					},
					_superApply = function( args ) {
						return base.prototype[ prop ].apply( this, args );
					};
				return function() {
					var __super = this._super,
						__superApply = this._superApply,
						returnValue;

					this._super = _super;
					this._superApply = _superApply;

					returnValue = value.apply( this, arguments );

					this._super = __super;
					this._superApply = __superApply;

					return returnValue;
				};
			})();
		});
		constructor.prototype = $.widget.extend( basePrototype, {
			widgetEventPrefix: existingConstructor ? (basePrototype.widgetEventPrefix || name) : name
		}, proxiedPrototype, {
			constructor: constructor,
			namespace: namespace,
			widgetName: name,
			widgetFullName: fullName
		});

		if ( existingConstructor ) {
			$.each( existingConstructor._childConstructors, function( i, child ) {
				var childPrototype = child.prototype;
				$.widget( childPrototype.namespace + "." + childPrototype.widgetName, constructor, child._proto );
			});
			delete existingConstructor._childConstructors;
		} else {
			base._childConstructors.push( constructor );
		}

		$.widget.bridge( name, constructor );

		return constructor;
	};

	$.widget.extend = function( target ) {
		var input = widget_slice.call( arguments, 1 ),
			inputIndex = 0,
			inputLength = input.length,
			key,
			value;
		for ( ; inputIndex < inputLength; inputIndex++ ) {
			for ( key in input[ inputIndex ] ) {
				value = input[ inputIndex ][ key ];
				if ( input[ inputIndex ].hasOwnProperty( key ) && value !== undefined ) {
					if ( $.isPlainObject( value ) ) {
						target[ key ] = $.isPlainObject( target[ key ] ) ?
							$.widget.extend( {}, target[ key ], value ) :
							$.widget.extend( {}, value );
					} else {
						target[ key ] = value;
					}
				}
			}
		}
		return target;
	};

	$.widget.bridge = function( name, object ) {
		var fullName = object.prototype.widgetFullName || name;
		$.fn[ name ] = function( options ) {
			var isMethodCall = typeof options === "string",
				args = widget_slice.call( arguments, 1 ),
				returnValue = this;

			if ( isMethodCall ) {
				this.each(function() {
					var methodValue,
						instance = $.data( this, fullName );
					if ( options === "instance" ) {
						returnValue = instance;
						return false;
					}
					if ( !instance ) {
						return $.error( "cannot call methods on " + name + " prior to initialization; " +
							"attempted to call method '" + options + "'" );
					}
					if ( !$.isFunction( instance[options] ) || options.charAt( 0 ) === "_" ) {
						return $.error( "no such method '" + options + "' for " + name + " widget instance" );
					}
					methodValue = instance[ options ].apply( instance, args );
					if ( methodValue !== instance && methodValue !== undefined ) {
						returnValue = methodValue && methodValue.jquery ?
							returnValue.pushStack( methodValue.get() ) :
							methodValue;
						return false;
					}
				});
			} else {
				if ( args.length ) {
					options = $.widget.extend.apply( null, [ options ].concat(args) );
				}

				this.each(function() {
					var instance = $.data( this, fullName );
					if ( instance ) {
						instance.option( options || {} );
						if ( instance._init ) {
							instance._init();
						}
					} else {
						$.data( this, fullName, new object( options, this ) );
					}
				});
			}

			return returnValue;
		};
	};

	$.Widget = function( /* options, element */ ) {};
	$.Widget._childConstructors = [];

	$.Widget.prototype = {
		widgetName: "widget",
		widgetEventPrefix: "",
		defaultElement: "<div>",
		options: {
			disabled: false,
			create: null
		},
		_createWidget: function( options, element ) {
			element = $( element || this.defaultElement || this )[ 0 ];
			this.element = $( element );
			this.uuid = widget_uuid++;
			this.eventNamespace = "." + this.widgetName + this.uuid;

			this.bindings = $();
			this.hoverable = $();
			this.focusable = $();

			if ( element !== this ) {
				$.data( element, this.widgetFullName, this );
				this._on( true, this.element, {
					remove: function( event ) {
						if ( event.target === element ) {
							this.destroy();
						}
					}
				});
				this.document = $( element.style ?
					element.ownerDocument :
				element.document || element );
				this.window = $( this.document[0].defaultView || this.document[0].parentWindow );
			}

			this.options = $.widget.extend( {},
				this.options,
				this._getCreateOptions(),
				options );

			this._create();
			this._trigger( "create", null, this._getCreateEventData() );
			this._init();
		},
		_getCreateOptions: $.noop,
		_getCreateEventData: $.noop,
		_create: $.noop,
		_init: $.noop,

		destroy: function() {
			this._destroy();

			this.element
				.unbind( this.eventNamespace )
				.removeData( this.widgetFullName )
				.removeData( $.camelCase( this.widgetFullName ) );
			this.widget()
				.unbind( this.eventNamespace )
				.removeAttr( "aria-disabled" )
				.removeClass(
				this.widgetFullName + "-disabled " +
				"ui-state-disabled" );

			this.bindings.unbind( this.eventNamespace );
			this.hoverable.removeClass( "ui-state-hover" );
			this.focusable.removeClass( "ui-state-focus" );
		},
		_destroy: $.noop,

		widget: function() {
			return this.element;
		},

		option: function( key, value ) {
			var options = key,
				parts,
				curOption,
				i;

			if ( arguments.length === 0 ) {
				return $.widget.extend( {}, this.options );
			}

			if ( typeof key === "string" ) {

				options = {};
				parts = key.split( "." );
				key = parts.shift();
				if ( parts.length ) {
					curOption = options[ key ] = $.widget.extend( {}, this.options[ key ] );
					for ( i = 0; i < parts.length - 1; i++ ) {
						curOption[ parts[ i ] ] = curOption[ parts[ i ] ] || {};
						curOption = curOption[ parts[ i ] ];
					}
					key = parts.pop();
					if ( arguments.length === 1 ) {
						return curOption[ key ] === undefined ? null : curOption[ key ];
					}
					curOption[ key ] = value;
				} else {
					if ( arguments.length === 1 ) {
						return this.options[ key ] === undefined ? null : this.options[ key ];
					}
					options[ key ] = value;
				}
			}

			this._setOptions( options );

			return this;
		},
		_setOptions: function( options ) {
			var key;

			for ( key in options ) {
				this._setOption( key, options[ key ] );
			}

			return this;
		},
		_setOption: function( key, value ) {
			this.options[ key ] = value;

			if ( key === "disabled" ) {
				this.widget()
					.toggleClass( this.widgetFullName + "-disabled", !!value );

				if ( value ) {
					this.hoverable.removeClass( "ui-state-hover" );
					this.focusable.removeClass( "ui-state-focus" );
				}
			}

			return this;
		},

		enable: function() {
			return this._setOptions({ disabled: false });
		},
		disable: function() {
			return this._setOptions({ disabled: true });
		},

		_on: function( suppressDisabledCheck, element, handlers ) {
			var delegateElement,
				instance = this;


			if ( typeof suppressDisabledCheck !== "boolean" ) {
				handlers = element;
				element = suppressDisabledCheck;
				suppressDisabledCheck = false;
			}


			if ( !handlers ) {
				handlers = element;
				element = this.element;
				delegateElement = this.widget();
			} else {
				element = delegateElement = $( element );
				this.bindings = this.bindings.add( element );
			}

			$.each( handlers, function( event, handler ) {
				function handlerProxy() {

					if ( !suppressDisabledCheck &&
						( instance.options.disabled === true ||
						$( this ).hasClass( "ui-state-disabled" ) ) ) {
						return;
					}
					return ( typeof handler === "string" ? instance[ handler ] : handler )
						.apply( instance, arguments );
				}


				if ( typeof handler !== "string" ) {
					handlerProxy.guid = handler.guid =
						handler.guid || handlerProxy.guid || $.guid++;
				}

				var match = event.match( /^([\w:-]*)\s*(.*)$/ ),
					eventName = match[1] + instance.eventNamespace,
					selector = match[2];
				if ( selector ) {
					delegateElement.delegate( selector, eventName, handlerProxy );
				} else {
					element.bind( eventName, handlerProxy );
				}
			});
		},

		_off: function( element, eventName ) {
			eventName = (eventName || "").split( " " ).join( this.eventNamespace + " " ) +
				this.eventNamespace;
			element.unbind( eventName ).undelegate( eventName );


			this.bindings = $( this.bindings.not( element ).get() );
			this.focusable = $( this.focusable.not( element ).get() );
			this.hoverable = $( this.hoverable.not( element ).get() );
		},

		_delay: function( handler, delay ) {
			function handlerProxy() {
				return ( typeof handler === "string" ? instance[ handler ] : handler )
					.apply( instance, arguments );
			}
			var instance = this;
			return setTimeout( handlerProxy, delay || 0 );
		},

		_hoverable: function( element ) {
			this.hoverable = this.hoverable.add( element );
			this._on( element, {
				mouseenter: function( event ) {
					$( event.currentTarget ).addClass( "ui-state-hover" );
				},
				mouseleave: function( event ) {
					$( event.currentTarget ).removeClass( "ui-state-hover" );
				}
			});
		},

		_focusable: function( element ) {
			this.focusable = this.focusable.add( element );
			this._on( element, {
				focusin: function( event ) {
					$( event.currentTarget ).addClass( "ui-state-focus" );
				},
				focusout: function( event ) {
					$( event.currentTarget ).removeClass( "ui-state-focus" );
				}
			});
		},

		_trigger: function( type, event, data ) {
			var prop, orig,
				callback = this.options[ type ];

			data = data || {};
			event = $.Event( event );
			event.type = ( type === this.widgetEventPrefix ?
				type :
			this.widgetEventPrefix + type ).toLowerCase();

			event.target = this.element[ 0 ];


			orig = event.originalEvent;
			if ( orig ) {
				for ( prop in orig ) {
					if ( !( prop in event ) ) {
						event[ prop ] = orig[ prop ];
					}
				}
			}

			this.element.trigger( event, data );
			return !( $.isFunction( callback ) &&
			callback.apply( this.element[0], [ event ].concat( data ) ) === false ||
			event.isDefaultPrevented() );
		}
	};

	$.each( { show: "fadeIn", hide: "fadeOut" }, function( method, defaultEffect ) {
		$.Widget.prototype[ "_" + method ] = function( element, options, callback ) {
			if ( typeof options === "string" ) {
				options = { effect: options };
			}
			var hasOptions,
				effectName = !options ?
					method :
					options === true || typeof options === "number" ?
						defaultEffect :
					options.effect || defaultEffect;
			options = options || {};
			if ( typeof options === "number" ) {
				options = { duration: options };
			}
			hasOptions = !$.isEmptyObject( options );
			options.complete = callback;
			if ( options.delay ) {
				element.delay( options.delay );
			}
			if ( hasOptions && $.effects && $.effects.effect[ effectName ] ) {
				element[ method ]( options );
			} else if ( effectName !== method && element[ effectName ] ) {
				element[ effectName ]( options.duration, options.easing, callback );
			} else {
				element.queue(function( next ) {
					$( this )[ method ]();
					if ( callback ) {
						callback.call( element[ 0 ] );
					}
					next();
				});
			}
		};
	});

	var widget = $.widget;

}));

/*
 * jquery.fileupload.js
 */

(function (factory) {
	'use strict';
	if (typeof define === 'function' && define.amd) {
		define([
			'jquery',
			'jquery.ui.widget'
		], factory);
	} else if (typeof exports === 'object') {

		factory(
			require('jquery'),
			require('jquery.ui.widget')
		);
	} else {

		factory(window.jQuery);
	}
}(function ($) {
	'use strict';


	$.support.fileInput = !(new RegExp(

		'(Android (1\\.[0156]|2\\.[01]))' +
		'|(Windows Phone (OS 7|8\\.0))|(XBLWP)|(ZuneWP)|(WPDesktop)' +
		'|(w(eb)?OSBrowser)|(webOS)' +
		'|(Kindle/(1\\.0|2\\.[05]|3\\.0))'
	).test(window.navigator.userAgent) ||

	$('<input type="file">').prop('disabled'));


	$.support.xhrFileUpload = !!(window.ProgressEvent && window.FileReader);
	$.support.xhrFormDataFileUpload = !!window.FormData;


	$.support.blobSlice = window.Blob && (Blob.prototype.slice ||
		Blob.prototype.webkitSlice || Blob.prototype.mozSlice);

	function getDragHandler(type) {
		var isDragOver = type === 'dragover';
		return function (e) {
			e.dataTransfer = e.originalEvent && e.originalEvent.dataTransfer;
			var dataTransfer = e.dataTransfer;
			if (dataTransfer && $.inArray('Files', dataTransfer.types) !== -1 &&
				this._trigger(
					type,
					$.Event(type, {delegatedEvent: e})
				) !== false) {
				e.preventDefault();
				if (isDragOver) {
					dataTransfer.dropEffect = 'copy';
				}
			}
		};
	}


	$.widget('blueimp.fileupload', {

		options: {

			dropZone: $(document),

			pasteZone: undefined,

			fileInput: undefined,

			replaceFileInput: true,

			paramName: undefined,

			singleFileUploads: true,

			limitMultiFileUploads: undefined,

			limitMultiFileUploadSize: undefined,

			limitMultiFileUploadSizeOverhead: 512,

			sequentialUploads: false,

			limitConcurrentUploads: undefined,

			forceIframeTransport: false,

			redirect: undefined,

			redirectParamName: undefined,

			postMessage: undefined,

			multipart: true,

			maxChunkSize: undefined,

			uploadedBytes: undefined,

			recalculateProgress: true,

			progressInterval: 100,

			bitrateInterval: 500,

			autoUpload: true,

			messages: {
				uploadedBytes: 'Uploaded bytes exceed file size'
			},

			i18n: function (message, context) {
				message = this.messages[message] || message.toString();
				if (context) {
					$.each(context, function (key, value) {
						message = message.replace('{' + key + '}', value);
					});
				}
				return message;
			},

			formData: function (form) {
				return form.serializeArray();
			},

			add: function (e, data) {
				if (e.isDefaultPrevented()) {
					return false;
				}
				if (data.autoUpload || (data.autoUpload !== false &&
					$(this).fileupload('option', 'autoUpload'))) {
					data.process().done(function () {
						data.submit();
					});
				}
			},

			processData: false,
			contentType: false,
			cache: false,
			timeout: 0
		},

		_specialOptions: [
			'fileInput',
			'dropZone',
			'pasteZone',
			'multipart',
			'forceIframeTransport'
		],

		_blobSlice: $.support.blobSlice && function () {
			var slice = this.slice || this.webkitSlice || this.mozSlice;
			return slice.apply(this, arguments);
		},

		_BitrateTimer: function () {
			this.timestamp = ((Date.now) ? Date.now() : (new Date()).getTime());
			this.loaded = 0;
			this.bitrate = 0;
			this.getBitrate = function (now, loaded, interval) {
				var timeDiff = now - this.timestamp;
				if (!this.bitrate || !interval || timeDiff > interval) {
					this.bitrate = (loaded - this.loaded) * (1000 / timeDiff) * 8;
					this.loaded = loaded;
					this.timestamp = now;
				}
				return this.bitrate;
			};
		},

		_isXHRUpload: function (options) {
			return !options.forceIframeTransport &&
				((!options.multipart && $.support.xhrFileUpload) ||
				$.support.xhrFormDataFileUpload);
		},

		_getFormData: function (options) {
			var formData;
			if ($.type(options.formData) === 'function') {
				return options.formData(options.form);
			}
			if ($.isArray(options.formData)) {
				return options.formData;
			}
			if ($.type(options.formData) === 'object') {
				formData = [];
				$.each(options.formData, function (name, value) {
					formData.push({name: name, value: value});
				});
				return formData;
			}
			return [];
		},

		_getTotal: function (files) {
			var total = 0;
			$.each(files, function (index, file) {
				total += file.size || 1;
			});
			return total;
		},

		_initProgressObject: function (obj) {
			var progress = {
				loaded: 0,
				total: 0,
				bitrate: 0
			};
			if (obj._progress) {
				$.extend(obj._progress, progress);
			} else {
				obj._progress = progress;
			}
		},

		_initResponseObject: function (obj) {
			var prop;
			if (obj._response) {
				for (prop in obj._response) {
					if (obj._response.hasOwnProperty(prop)) {
						delete obj._response[prop];
					}
				}
			} else {
				obj._response = {};
			}
		},

		_onProgress: function (e, data) {
			if (e.lengthComputable) {
				var now = ((Date.now) ? Date.now() : (new Date()).getTime()),
					loaded;
				if (data._time && data.progressInterval &&
					(now - data._time < data.progressInterval) &&
					e.loaded !== e.total) {
					return;
				}
				data._time = now;
				loaded = Math.floor(
						e.loaded / e.total * (data.chunkSize || data._progress.total)
					) + (data.uploadedBytes || 0);
				this._progress.loaded += (loaded - data._progress.loaded);
				this._progress.bitrate = this._bitrateTimer.getBitrate(
					now,
					this._progress.loaded,
					data.bitrateInterval
				);
				data._progress.loaded = data.loaded = loaded;
				data._progress.bitrate = data.bitrate = data._bitrateTimer.getBitrate(
					now,
					loaded,
					data.bitrateInterval
				);
				this._trigger(
					'progress',
					$.Event('progress', {delegatedEvent: e}),
					data
				);
				this._trigger(
					'progressall',
					$.Event('progressall', {delegatedEvent: e}),
					this._progress
				);
			}
		},

		_initProgressListener: function (options) {
			var that = this,
				xhr = options.xhr ? options.xhr() : $.ajaxSettings.xhr();
			if (xhr.upload) {
				$(xhr.upload).bind('progress', function (e) {
					var oe = e.originalEvent;
					e.lengthComputable = oe.lengthComputable;
					e.loaded = oe.loaded;
					e.total = oe.total;
					that._onProgress(e, options);
				});
				options.xhr = function () {
					return xhr;
				};
			}
		},

		_isInstanceOf: function (type, obj) {
			return Object.prototype.toString.call(obj) === '[object ' + type + ']';
		},

		_initXHRData: function (options) {
			var that = this,
				formData,
				file = options.files[0],
				multipart = options.multipart || !$.support.xhrFileUpload,
				paramName = $.type(options.paramName) === 'array' ?
					options.paramName[0] : options.paramName;
			options.headers = $.extend({}, options.headers);
			if (options.contentRange) {
				options.headers['Content-Range'] = options.contentRange;
			}
			if (!multipart || options.blob || !this._isInstanceOf('File', file)) {
				options.headers['Content-Disposition'] = 'attachment; filename="' +
					encodeURI(file.name) + '"';
			}
			if (!multipart) {
				options.contentType = file.type || 'application/octet-stream';
				options.data = options.blob || file;
			} else if ($.support.xhrFormDataFileUpload) {
				if (options.postMessage) {
					formData = this._getFormData(options);
					if (options.blob) {
						formData.push({
							name: paramName,
							value: options.blob
						});
					} else {
						$.each(options.files, function (index, file) {
							formData.push({
								name: ($.type(options.paramName) === 'array' &&
								options.paramName[index]) || paramName,
								value: file
							});
						});
					}
				} else {
					if (that._isInstanceOf('FormData', options.formData)) {
						formData = options.formData;
					} else {
						formData = new FormData();
						$.each(this._getFormData(options), function (index, field) {
							formData.append(field.name, field.value);
						});
					}
					if (options.blob) {
						formData.append(paramName, options.blob, file.name);
					} else {
						$.each(options.files, function (index, file) {
							if (that._isInstanceOf('File', file) ||
								that._isInstanceOf('Blob', file)) {
								formData.append(
									($.type(options.paramName) === 'array' &&
									options.paramName[index]) || paramName,
									file,
									file.uploadName || file.name
								);
							}
						});
					}
				}
				options.data = formData;
			}
			options.blob = null;
		},

		_initIframeSettings: function (options) {
			var targetHost = $('<a></a>').prop('href', options.url).prop('host');
			options.dataType = 'iframe ' + (options.dataType || '');
			options.formData = this._getFormData(options);
			if (options.redirect && targetHost && targetHost !== location.host) {
				options.formData.push({
					name: options.redirectParamName || 'redirect',
					value: options.redirect
				});
			}
		},

		_initDataSettings: function (options) {
			if (this._isXHRUpload(options)) {
				if (!this._chunkedUpload(options, true)) {
					if (!options.data) {
						this._initXHRData(options);
					}
					this._initProgressListener(options);
				}
				if (options.postMessage) {
					options.dataType = 'postmessage ' + (options.dataType || '');
				}
			} else {
				this._initIframeSettings(options);
			}
		},

		_getParamName: function (options) {
			var fileInput = $(options.fileInput),
				paramName = options.paramName;
			if (!paramName) {
				paramName = [];
				fileInput.each(function () {
					var input = $(this),
						name = input.prop('name') || 'files[]',
						i = (input.prop('files') || [1]).length;
					while (i) {
						paramName.push(name);
						i -= 1;
					}
				});
				if (!paramName.length) {
					paramName = [fileInput.prop('name') || 'files[]'];
				}
			} else if (!$.isArray(paramName)) {
				paramName = [paramName];
			}
			return paramName;
		},

		_initFormSettings: function (options) {
			if (!options.form || !options.form.length) {
				options.form = $(options.fileInput.prop('form'));
				if (!options.form.length) {
					options.form = $(this.options.fileInput.prop('form'));
				}
			}
			options.paramName = this._getParamName(options);
			if (!options.url) {
				options.url = options.form.prop('action') || location.href;
			}
			options.type = (options.type ||
				($.type(options.form.prop('method')) === 'string' &&
				options.form.prop('method')) || ''
			).toUpperCase();
			if (options.type !== 'POST' && options.type !== 'PUT' &&
				options.type !== 'PATCH') {
				options.type = 'POST';
			}
			if (!options.formAcceptCharset) {
				options.formAcceptCharset = options.form.attr('accept-charset');
			}
		},

		_getAJAXSettings: function (data) {
			var options = $.extend({}, this.options, data);
			this._initFormSettings(options);
			this._initDataSettings(options);
			return options;
		},

		_getDeferredState: function (deferred) {
			if (deferred.state) {
				return deferred.state();
			}
			if (deferred.isResolved()) {
				return 'resolved';
			}
			if (deferred.isRejected()) {
				return 'rejected';
			}
			return 'pending';
		},

		_enhancePromise: function (promise) {
			promise.success = promise.done;
			promise.error = promise.fail;
			promise.complete = promise.always;
			return promise;
		},

		_getXHRPromise: function (resolveOrReject, context, args) {
			var dfd = $.Deferred(),
				promise = dfd.promise();
			context = context || this.options.context || promise;
			if (resolveOrReject === true) {
				dfd.resolveWith(context, args);
			} else if (resolveOrReject === false) {
				dfd.rejectWith(context, args);
			}
			promise.abort = dfd.promise;
			return this._enhancePromise(promise);
		},

		_addConvenienceMethods: function (e, data) {
			var that = this,
				getPromise = function (args) {
					return $.Deferred().resolveWith(that, args).promise();
				};
			data.process = function (resolveFunc, rejectFunc) {
				if (resolveFunc || rejectFunc) {
					data._processQueue = this._processQueue =
						(this._processQueue || getPromise([this])).pipe(
							function () {
								if (data.errorThrown) {
									return $.Deferred()
										.rejectWith(that, [data]).promise();
								}
								return getPromise(arguments);
							}
						).pipe(resolveFunc, rejectFunc);
				}
				return this._processQueue || getPromise([this]);
			};
			data.submit = function () {
				if (this.state() !== 'pending') {
					data.jqXHR = this.jqXHR =
						(that._trigger(
							'submit',
							$.Event('submit', {delegatedEvent: e}),
							this
						) !== false) && that._onSend(e, this);
				}
				return this.jqXHR || that._getXHRPromise();
			};
			data.abort = function () {
				if (this.jqXHR) {
					return this.jqXHR.abort();
				}
				this.errorThrown = 'abort';
				that._trigger('fail', null, this);
				return that._getXHRPromise(false);
			};
			data.state = function () {
				if (this.jqXHR) {
					return that._getDeferredState(this.jqXHR);
				}
				if (this._processQueue) {
					return that._getDeferredState(this._processQueue);
				}
			};
			data.processing = function () {
				return !this.jqXHR && this._processQueue && that
						._getDeferredState(this._processQueue) === 'pending';
			};
			data.progress = function () {
				return this._progress;
			};
			data.response = function () {
				return this._response;
			};
		},

		_getUploadedBytes: function (jqXHR) {
			var range = jqXHR.getResponseHeader('Range'),
				parts = range && range.split('-'),
				upperBytesPos = parts && parts.length > 1 &&
					parseInt(parts[1], 10);
			return upperBytesPos && upperBytesPos + 1;
		},

		_chunkedUpload: function (options, testOnly) {
			options.uploadedBytes = options.uploadedBytes || 0;
			var that = this,
				file = options.files[0],
				fs = file.size,
				ub = options.uploadedBytes,
				mcs = options.maxChunkSize || fs,
				slice = this._blobSlice,
				dfd = $.Deferred(),
				promise = dfd.promise(),
				jqXHR,
				upload;
			if (!(this._isXHRUpload(options) && slice && (ub || mcs < fs)) ||
				options.data) {
				return false;
			}
			if (testOnly) {
				return true;
			}
			if (ub >= fs) {
				file.error = options.i18n('uploadedBytes');
				return this._getXHRPromise(
					false,
					options.context,
					[null, 'error', file.error]
				);
			}

			upload = function () {
				var o = $.extend({}, options),
					currentLoaded = o._progress.loaded;
				o.blob = slice.call(
					file,
					ub,
					ub + mcs,
					file.type
				);
				o.chunkSize = o.blob.size;
				o.contentRange = 'bytes ' + ub + '-' +
					(ub + o.chunkSize - 1) + '/' + fs;
				that._initXHRData(o);
				that._initProgressListener(o);
				jqXHR = ((that._trigger('chunksend', null, o) !== false && $.ajax(o)) ||
				that._getXHRPromise(false, o.context))
					.done(function (result, textStatus, jqXHR) {
						ub = that._getUploadedBytes(jqXHR) ||
							(ub + o.chunkSize);
						if (currentLoaded + o.chunkSize - o._progress.loaded) {
							that._onProgress($.Event('progress', {
								lengthComputable: true,
								loaded: ub - o.uploadedBytes,
								total: ub - o.uploadedBytes
							}), o);
						}
						options.uploadedBytes = o.uploadedBytes = ub;
						o.result = result;
						o.textStatus = textStatus;
						o.jqXHR = jqXHR;
						that._trigger('chunkdone', null, o);
						that._trigger('chunkalways', null, o);
						if (ub < fs) {
							upload();
						} else {
							dfd.resolveWith(
								o.context,
								[result, textStatus, jqXHR]
							);
						}
					})
					.fail(function (jqXHR, textStatus, errorThrown) {
						o.jqXHR = jqXHR;
						o.textStatus = textStatus;
						o.errorThrown = errorThrown;
						that._trigger('chunkfail', null, o);
						that._trigger('chunkalways', null, o);
						dfd.rejectWith(
							o.context,
							[jqXHR, textStatus, errorThrown]
						);
					});
			};
			this._enhancePromise(promise);
			promise.abort = function () {
				return jqXHR.abort();
			};
			upload();
			return promise;
		},

		_beforeSend: function (e, data) {
			if (this._active === 0) {
				this._trigger('start');
				this._bitrateTimer = new this._BitrateTimer();
				this._progress.loaded = this._progress.total = 0;
				this._progress.bitrate = 0;
			}
			this._initResponseObject(data);
			this._initProgressObject(data);
			data._progress.loaded = data.loaded = data.uploadedBytes || 0;
			data._progress.total = data.total = this._getTotal(data.files) || 1;
			data._progress.bitrate = data.bitrate = 0;
			this._active += 1;
			this._progress.loaded += data.loaded;
			this._progress.total += data.total;
		},

		_onDone: function (result, textStatus, jqXHR, options) {
			var total = options._progress.total,
				response = options._response;
			if (options._progress.loaded < total) {
				this._onProgress($.Event('progress', {
					lengthComputable: true,
					loaded: total,
					total: total
				}), options);
			}
			response.result = options.result = result;
			response.textStatus = options.textStatus = textStatus;
			response.jqXHR = options.jqXHR = jqXHR;
			this._trigger('done', null, options);
		},

		_onFail: function (jqXHR, textStatus, errorThrown, options) {
			var response = options._response;
			if (options.recalculateProgress) {
				this._progress.loaded -= options._progress.loaded;
				this._progress.total -= options._progress.total;
			}
			response.jqXHR = options.jqXHR = jqXHR;
			response.textStatus = options.textStatus = textStatus;
			response.errorThrown = options.errorThrown = errorThrown;
			this._trigger('fail', null, options);
		},

		_onAlways: function (jqXHRorResult, textStatus, jqXHRorError, options) {
			this._trigger('always', null, options);
		},

		_onSend: function (e, data) {
			if (!data.submit) {
				this._addConvenienceMethods(e, data);
			}
			var that = this,
				jqXHR,
				aborted,
				slot,
				pipe,
				options = that._getAJAXSettings(data),
				send = function () {
					that._sending += 1;
					options._bitrateTimer = new that._BitrateTimer();
					jqXHR = jqXHR || (
							((aborted || that._trigger(
								'send',
								$.Event('send', {delegatedEvent: e}),
								options
							) === false) &&
							that._getXHRPromise(false, options.context, aborted)) ||
							that._chunkedUpload(options) || $.ajax(options)
						).done(function (result, textStatus, jqXHR) {
								that._onDone(result, textStatus, jqXHR, options);
							}).fail(function (jqXHR, textStatus, errorThrown) {
								that._onFail(jqXHR, textStatus, errorThrown, options);
							}).always(function (jqXHRorResult, textStatus, jqXHRorError) {
								that._onAlways(
									jqXHRorResult,
									textStatus,
									jqXHRorError,
									options
								);
								that._sending -= 1;
								that._active -= 1;
								if (options.limitConcurrentUploads &&
									options.limitConcurrentUploads > that._sending) {
									var nextSlot = that._slots.shift();
									while (nextSlot) {
										if (that._getDeferredState(nextSlot) === 'pending') {
											nextSlot.resolve();
											break;
										}
										nextSlot = that._slots.shift();
									}
								}
								if (that._active === 0) {
									that._trigger('stop');
								}
							});
					return jqXHR;
				};
			this._beforeSend(e, options);
			if (this.options.sequentialUploads ||
				(this.options.limitConcurrentUploads &&
				this.options.limitConcurrentUploads <= this._sending)) {
				if (this.options.limitConcurrentUploads > 1) {
					slot = $.Deferred();
					this._slots.push(slot);
					pipe = slot.pipe(send);
				} else {
					this._sequence = this._sequence.pipe(send, send);
					pipe = this._sequence;
				}

				pipe.abort = function () {
					aborted = [undefined, 'abort', 'abort'];
					if (!jqXHR) {
						if (slot) {
							slot.rejectWith(options.context, aborted);
						}
						return send();
					}
					return jqXHR.abort();
				};
				return this._enhancePromise(pipe);
			}
			return send();
		},

		_onAdd: function (e, data) {
			var that = this,
				result = true,
				options = $.extend({}, this.options, data),
				files = data.files,
				filesLength = files.length,
				limit = options.limitMultiFileUploads,
				limitSize = options.limitMultiFileUploadSize,
				overhead = options.limitMultiFileUploadSizeOverhead,
				batchSize = 0,
				paramName = this._getParamName(options),
				paramNameSet,
				paramNameSlice,
				fileSet,
				i,
				j = 0;
			if (!filesLength) {
				return false;
			}
			if (limitSize && files[0].size === undefined) {
				limitSize = undefined;
			}
			if (!(options.singleFileUploads || limit || limitSize) ||
				!this._isXHRUpload(options)) {
				fileSet = [files];
				paramNameSet = [paramName];
			} else if (!(options.singleFileUploads || limitSize) && limit) {
				fileSet = [];
				paramNameSet = [];
				for (i = 0; i < filesLength; i += limit) {
					fileSet.push(files.slice(i, i + limit));
					paramNameSlice = paramName.slice(i, i + limit);
					if (!paramNameSlice.length) {
						paramNameSlice = paramName;
					}
					paramNameSet.push(paramNameSlice);
				}
			} else if (!options.singleFileUploads && limitSize) {
				fileSet = [];
				paramNameSet = [];
				for (i = 0; i < filesLength; i = i + 1) {
					batchSize += files[i].size + overhead;
					if (i + 1 === filesLength ||
						((batchSize + files[i + 1].size + overhead) > limitSize) ||
						(limit && i + 1 - j >= limit)) {
						fileSet.push(files.slice(j, i + 1));
						paramNameSlice = paramName.slice(j, i + 1);
						if (!paramNameSlice.length) {
							paramNameSlice = paramName;
						}
						paramNameSet.push(paramNameSlice);
						j = i + 1;
						batchSize = 0;
					}
				}
			} else {
				paramNameSet = paramName;
			}
			data.originalFiles = files;
			$.each(fileSet || files, function (index, element) {
				var newData = $.extend({}, data);
				newData.files = fileSet ? element : [element];
				newData.paramName = paramNameSet[index];
				that._initResponseObject(newData);
				that._initProgressObject(newData);
				that._addConvenienceMethods(e, newData);
				result = that._trigger(
					'add',
					$.Event('add', {delegatedEvent: e}),
					newData
				);
				return result;
			});
			return result;
		},

		_replaceFileInput: function (data) {
			var input = data.fileInput,
				inputClone = input.clone(true),
				restoreFocus = input.is(document.activeElement);

			data.fileInputClone = inputClone;
			$('<form></form>').append(inputClone)[0].reset();

			input.after(inputClone).detach();

			if (restoreFocus) {
				inputClone.focus();
			}

			$.cleanData(input.unbind('remove'));

			this.options.fileInput = this.options.fileInput.map(function (i, el) {
				if (el === input[0]) {
					return inputClone[0];
				}
				return el;
			});

			if (input[0] === this.element[0]) {
				this.element = inputClone;
			}
		},

		_handleFileTreeEntry: function (entry, path) {
			var that = this,
				dfd = $.Deferred(),
				errorHandler = function (e) {
					if (e && !e.entry) {
						e.entry = entry;
					}

					dfd.resolve([e]);
				},
				successHandler = function (entries) {
					that._handleFileTreeEntries(
						entries,
						path + entry.name + '/'
					).done(function (files) {
							dfd.resolve(files);
						}).fail(errorHandler);
				},
				readEntries = function () {
					dirReader.readEntries(function (results) {
						if (!results.length) {
							successHandler(entries);
						} else {
							entries = entries.concat(results);
							readEntries();
						}
					}, errorHandler);
				},
				dirReader, entries = [];
			path = path || '';
			if (entry.isFile) {
				if (entry._file) {

					entry._file.relativePath = path;
					dfd.resolve(entry._file);
				} else {
					entry.file(function (file) {
						file.relativePath = path;
						dfd.resolve(file);
					}, errorHandler);
				}
			} else if (entry.isDirectory) {
				dirReader = entry.createReader();
				readEntries();
			} else {
				dfd.resolve([]);
			}
			return dfd.promise();
		},

		_handleFileTreeEntries: function (entries, path) {
			var that = this;
			return $.when.apply(
				$,
				$.map(entries, function (entry) {
					return that._handleFileTreeEntry(entry, path);
				})
			).pipe(function () {
					return Array.prototype.concat.apply(
						[],
						arguments
					);
				});
		},

		_getDroppedFiles: function (dataTransfer) {
			dataTransfer = dataTransfer || {};
			var items = dataTransfer.items;
			if (items && items.length && (items[0].webkitGetAsEntry ||
				items[0].getAsEntry)) {
				return this._handleFileTreeEntries(
					$.map(items, function (item) {
						var entry;
						if (item.webkitGetAsEntry) {
							entry = item.webkitGetAsEntry();
							if (entry) {
								entry._file = item.getAsFile();
							}
							return entry;
						}
						return item.getAsEntry();
					})
				);
			}
			return $.Deferred().resolve(
				$.makeArray(dataTransfer.files)
			).promise();
		},

		_getSingleFileInputFiles: function (fileInput) {
			fileInput = $(fileInput);
			var entries = fileInput.prop('webkitEntries') ||
					fileInput.prop('entries'),
				files,
				value;
			if (entries && entries.length) {
				return this._handleFileTreeEntries(entries);
			}
			files = $.makeArray(fileInput.prop('files'));
			if (!files.length) {
				value = fileInput.prop('value');
				if (!value) {
					return $.Deferred().resolve([]).promise();
				}
				files = [{name: value.replace(/^.*\\/, '')}];
			} else if (files[0].name === undefined && files[0].fileName) {
				$.each(files, function (index, file) {
					file.name = file.fileName;
					file.size = file.fileSize;
				});
			}
			return $.Deferred().resolve(files).promise();
		},

		_getFileInputFiles: function (fileInput) {
			if (!(fileInput instanceof $) || fileInput.length === 1) {
				return this._getSingleFileInputFiles(fileInput);
			}
			return $.when.apply(
				$,
				$.map(fileInput, this._getSingleFileInputFiles)
			).pipe(function () {
					return Array.prototype.concat.apply(
						[],
						arguments
					);
				});
		},

		_onChange: function (e) {
			var that = this,
				data = {
					fileInput: $(e.target),
					form: $(e.target.form)
				};
			this._getFileInputFiles(data.fileInput).always(function (files) {
				data.files = files;
				if (that.options.replaceFileInput) {
					that._replaceFileInput(data);
				}
				if (that._trigger(
						'change',
						$.Event('change', {delegatedEvent: e}),
						data
					) !== false) {
					that._onAdd(e, data);
				}
			});
		},

		_onPaste: function (e) {
			var items = e.originalEvent && e.originalEvent.clipboardData &&
					e.originalEvent.clipboardData.items,
				data = {files: []};
			if (items && items.length) {
				$.each(items, function (index, item) {
					var file = item.getAsFile && item.getAsFile();
					if (file) {
						data.files.push(file);
					}
				});
				if (this._trigger(
						'paste',
						$.Event('paste', {delegatedEvent: e}),
						data
					) !== false) {
					this._onAdd(e, data);
				}
			}
		},

		_onDrop: function (e) {
			e.dataTransfer = e.originalEvent && e.originalEvent.dataTransfer;
			var that = this,
				dataTransfer = e.dataTransfer,
				data = {};
			if (dataTransfer && dataTransfer.files && dataTransfer.files.length) {
				e.preventDefault();
				this._getDroppedFiles(dataTransfer).always(function (files) {
					data.files = files;
					if (that._trigger(
							'drop',
							$.Event('drop', {delegatedEvent: e}),
							data
						) !== false) {
						that._onAdd(e, data);
					}
				});
			}
		},

		_onDragOver: getDragHandler('dragover'),

		_onDragEnter: getDragHandler('dragenter'),

		_onDragLeave: getDragHandler('dragleave'),

		_initEventHandlers: function () {
			if (this._isXHRUpload(this.options)) {
				this._on(this.options.dropZone, {
					dragover: this._onDragOver,
					drop: this._onDrop,
					dragenter: this._onDragEnter,
					dragleave: this._onDragLeave
				});
				this._on(this.options.pasteZone, {
					paste: this._onPaste
				});
			}
			if ($.support.fileInput) {
				this._on(this.options.fileInput, {
					change: this._onChange
				});
			}
		},

		_destroyEventHandlers: function () {
			this._off(this.options.dropZone, 'dragenter dragleave dragover drop');
			this._off(this.options.pasteZone, 'paste');
			this._off(this.options.fileInput, 'change');
		},

		_setOption: function (key, value) {
			var reinit = $.inArray(key, this._specialOptions) !== -1;
			if (reinit) {
				this._destroyEventHandlers();
			}
			this._super(key, value);
			if (reinit) {
				this._initSpecialOptions();
				this._initEventHandlers();
			}
		},

		_initSpecialOptions: function () {
			var options = this.options;
			if (options.fileInput === undefined) {
				options.fileInput = this.element.is('input[type="file"]') ?
					this.element : this.element.find('input[type="file"]');
			} else if (!(options.fileInput instanceof $)) {
				options.fileInput = $(options.fileInput);
			}
			if (!(options.dropZone instanceof $)) {
				options.dropZone = $(options.dropZone);
			}
			if (!(options.pasteZone instanceof $)) {
				options.pasteZone = $(options.pasteZone);
			}
		},

		_getRegExp: function (str) {
			var parts = str.split('/'),
				modifiers = parts.pop();
			parts.shift();
			return new RegExp(parts.join('/'), modifiers);
		},

		_isRegExpOption: function (key, value) {
			return key !== 'url' && $.type(value) === 'string' &&
				/^\/.*\/[igm]{0,3}$/.test(value);
		},

		_initDataAttributes: function () {
			var that = this,
				options = this.options,
				data = this.element.data();
			$.each(
				this.element[0].attributes,
				function (index, attr) {
					var key = attr.name.toLowerCase(),
						value;
					if (/^data-/.test(key)) {
						key = key.slice(5).replace(/-[a-z]/g, function (str) {
							return str.charAt(1).toUpperCase();
						});
						value = data[key];
						if (that._isRegExpOption(key, value)) {
							value = that._getRegExp(value);
						}
						options[key] = value;
					}
				}
			);
		},

		_create: function () {
			this._initDataAttributes();
			this._initSpecialOptions();
			this._slots = [];
			this._sequence = this._getXHRPromise(true);
			this._sending = this._active = 0;
			this._initProgressObject(this);
			this._initEventHandlers();
		},
		active: function () {
			return this._active;
		},
		progress: function () {
			return this._progress;
		},
		add: function (data) {
			var that = this;
			if (!data || this.options.disabled) {
				return;
			}
			if (data.fileInput && !data.files) {
				this._getFileInputFiles(data.fileInput).always(function (files) {
					data.files = files;
					that._onAdd(null, data);
				});
			} else {
				data.files = $.makeArray(data.files);
				this._onAdd(null, data);
			}
		},
		send: function (data) {
			if (data && !this.options.disabled) {
				if (data.fileInput && !data.files) {
					var that = this,
						dfd = $.Deferred(),
						promise = dfd.promise(),
						jqXHR,
						aborted;
					promise.abort = function () {
						aborted = true;
						if (jqXHR) {
							return jqXHR.abort();
						}
						dfd.reject(null, 'abort', 'abort');
						return promise;
					};
					this._getFileInputFiles(data.fileInput).always(
						function (files) {
							if (aborted) {
								return;
							}
							if (!files.length) {
								dfd.reject();
								return;
							}
							data.files = files;
							jqXHR = that._onSend(null, data);
							jqXHR.then(
								function (result, textStatus, jqXHR) {
									dfd.resolve(result, textStatus, jqXHR);
								},
								function (jqXHR, textStatus, errorThrown) {
									dfd.reject(jqXHR, textStatus, errorThrown);
								}
							);
						}
					);
					return this._enhancePromise(promise);
				}
				data.files = $.makeArray(data.files);
				if (data.files.length) {
					return this._onSend(null, data);
				}
			}
			return this._getXHRPromise(false, data && data.context);
		}

	});

}));



/*
 * jquery.iframe-transport.js
 */

(function (factory) {
	'use strict';
	if (typeof define === 'function' && define.amd) {
		define(['jquery'], factory);
	} else if (typeof exports === 'object') {
		factory(require('jquery'));
	} else {
		factory(window.jQuery);
	}
}(function ($) {
	'use strict';

	var counter = 0;

	$.ajaxTransport('iframe', function (options) {
		if (options.async) {
			var initialIframeSrc = options.initialIframeSrc || 'javascript:false;',
				form,
				iframe,
				addParamChar;
			return {
				send: function (_, completeCallback) {
					form = $('<form style="display:none;"></form>');
					form.attr('accept-charset', options.formAcceptCharset);
					addParamChar = /\?/.test(options.url) ? '&' : '?';
					if (options.type === 'DELETE') {
						options.url = options.url + addParamChar + '_method=DELETE';
						options.type = 'POST';
					} else if (options.type === 'PUT') {
						options.url = options.url + addParamChar + '_method=PUT';
						options.type = 'POST';
					} else if (options.type === 'PATCH') {
						options.url = options.url + addParamChar + '_method=PATCH';
						options.type = 'POST';
					}
					counter += 1;
					iframe = $(
						'<iframe src="' + initialIframeSrc +
						'" name="iframe-transport-' + counter + '"></iframe>'
					).bind('load', function () {
							var fileInputClones,
								paramNames = $.isArray(options.paramName) ?
									options.paramName : [options.paramName];
							iframe
								.unbind('load')
								.bind('load', function () {
									var response;
									try {
										response = iframe.contents();
										if (!response.length || !response[0].firstChild) {
											throw new Error();
										}
									} catch (e) {
										response = undefined;
									}
									completeCallback(
										200,
										'success',
										{'iframe': response}
									);
									$('<iframe src="' + initialIframeSrc + '"></iframe>')
										.appendTo(form);
									window.setTimeout(function () {
										form.remove();
									}, 0);
								});
							form
								.prop('target', iframe.prop('name'))
								.prop('action', options.url)
								.prop('method', options.type);
							if (options.formData) {
								$.each(options.formData, function (index, field) {
									$('<input type="hidden"/>')
										.prop('name', field.name)
										.val(field.value)
										.appendTo(form);
								});
							}
							if (options.fileInput && options.fileInput.length &&
								options.type === 'POST') {
								fileInputClones = options.fileInput.clone();
								options.fileInput.after(function (index) {
									return fileInputClones[index];
								});
								if (options.paramName) {
									options.fileInput.each(function (index) {
										$(this).prop(
											'name',
											paramNames[index] || options.paramName
										);
									});
								}
								form
									.append(options.fileInput)
									.prop('enctype', 'multipart/form-data')
									.prop('encoding', 'multipart/form-data');
								options.fileInput.removeAttr('form');
							}
							form.submit();
							if (fileInputClones && fileInputClones.length) {
								options.fileInput.each(function (index, input) {
									var clone = $(fileInputClones[index]);
									$(input)
										.prop('name', clone.prop('name'))
										.attr('form', clone.attr('form'));
									clone.replaceWith(input);
								});
							}
						});
					form.append(iframe).appendTo(document.body);
				},
				abort: function () {
					if (iframe) {
						iframe
							.unbind('load')
							.prop('src', initialIframeSrc);
					}
					if (form) {
						form.remove();
					}
				}
			};
		}
	});

	$.ajaxSetup({
		converters: {
			'iframe text': function (iframe) {
				return iframe && $(iframe[0].body).text();
			},
			'iframe json': function (iframe) {
				return iframe && $.parseJSON($(iframe[0].body).text());
			},
			'iframe html': function (iframe) {
				return iframe && $(iframe[0].body).html();
			},
			'iframe xml': function (iframe) {
				var xmlDoc = iframe && iframe[0];
				return xmlDoc && $.isXMLDoc(xmlDoc) ? xmlDoc :
					$.parseXML((xmlDoc.XMLDocument && xmlDoc.XMLDocument.xml) ||
						$(xmlDoc.body).html());
			},
			'iframe script': function (iframe) {
				return iframe && $.globalEval($(iframe[0].body).text());
			}
		}
	});

}));


/*
 * jquery.fileupload-process.js
 */


(function (factory) {
	'use strict';
	if (typeof define === 'function' && define.amd) {
		// Register as an anonymous AMD module:
		define([
			'jquery',
			'./jquery.fileupload'
		], factory);
	} else if (typeof exports === 'object') {
		// Node/CommonJS:
		factory(require('jquery'));
	} else {
		// Browser globals:
		factory(
			window.jQuery
		);
	}
}(function ($) {
	'use strict';

	var originalAdd = $.blueimp.fileupload.prototype.options.add;

	// The File Upload Processing plugin extends the fileupload widget
	// with file processing functionality:
	$.widget('blueimp.fileupload', $.blueimp.fileupload, {

		options: {
			// The list of processing actions:
			processQueue: [
				/*
				 {
				 action: 'log',
				 type: 'debug'
				 }
				 */
			],
			add: function (e, data) {
				var $this = $(this);
				data.process(function () {
					return $this.fileupload('process', data);
				});
				originalAdd.call(this, e, data);
			}
		},

		processActions: {
			/*
			 log: function (data, options) {
			 console[options.type](
			 'Processing "' + data.files[data.index].name + '"'
			 );
			 }
			 */
		},

		_processFile: function (data, originalData) {
			var that = this,
				dfd = $.Deferred().resolveWith(that, [data]),
				chain = dfd.promise();
			this._trigger('process', null, data);
			$.each(data.processQueue, function (i, settings) {
				var func = function (data) {
					if (originalData.errorThrown) {
						return $.Deferred()
							.rejectWith(that, [originalData]).promise();
					}
					return that.processActions[settings.action].call(
						that,
						data,
						settings
					);
				};
				chain = chain.pipe(func, settings.always && func);
			});
			chain
				.done(function () {
					that._trigger('processdone', null, data);
					that._trigger('processalways', null, data);
				})
				.fail(function () {
					that._trigger('processfail', null, data);
					that._trigger('processalways', null, data);
				});
			return chain;
		},

		// Replaces the settings of each processQueue item that
		// are strings starting with an "@", using the remaining
		// substring as key for the option map,
		// e.g. "@autoUpload" is replaced with options.autoUpload:
		_transformProcessQueue: function (options) {
			var processQueue = [];
			$.each(options.processQueue, function () {
				var settings = {},
					action = this.action,
					prefix = this.prefix === true ? action : this.prefix;
				$.each(this, function (key, value) {
					if ($.type(value) === 'string' &&
						value.charAt(0) === '@') {
						settings[key] = options[
						value.slice(1) || (prefix ? prefix +
						key.charAt(0).toUpperCase() + key.slice(1) : key)
							];
					} else {
						settings[key] = value;
					}

				});
				processQueue.push(settings);
			});
			options.processQueue = processQueue;
		},

		// Returns the number of files currently in the processsing queue:
		processing: function () {
			return this._processing;
		},

		// Processes the files given as files property of the data parameter,
		// returns a Promise object that allows to bind callbacks:
		process: function (data) {
			var that = this,
				options = $.extend({}, this.options, data);
			if (options.processQueue && options.processQueue.length) {
				this._transformProcessQueue(options);
				if (this._processing === 0) {
					this._trigger('processstart');
				}
				$.each(data.files, function (index) {
					var opts = index ? $.extend({}, options) : options,
						func = function () {
							if (data.errorThrown) {
								return $.Deferred()
									.rejectWith(that, [data]).promise();
							}
							return that._processFile(opts, data);
						};
					opts.index = index;
					that._processing += 1;
					that._processingQueue = that._processingQueue.pipe(func, func)
						.always(function () {
							that._processing -= 1;
							if (that._processing === 0) {
								that._trigger('processstop');
							}
						});
				});
			}
			return this._processingQueue;
		},

		_create: function () {
			this._super();
			this._processing = 0;
			this._processingQueue = $.Deferred().resolveWith(this)
				.promise();
		}

	});

}));

/*
 * jquery.fileupload-image.js
 */

(function (factory) {
	'use strict';
	if (typeof define === 'function' && define.amd) {
		// Register as an anonymous AMD module:
		define([
			'jquery',
			'load-image',
			'load-image-meta',
			'load-image-exif',
			'load-image-ios',
			'canvas-to-blob',
			'./jquery.fileupload-process'
		], factory);
	} else if (typeof exports === 'object') {
		// Node/CommonJS:
		factory(
			require('jquery'),
			require('load-image')
		);
	} else {
		// Browser globals:
		factory(
			window.jQuery,
			window.loadImage
		);
	}
}(function ($, loadImage) {
	'use strict';

	// Prepend to the default processQueue:
	$.blueimp.fileupload.prototype.options.processQueue.unshift(
		{
			action: 'loadImageMetaData',
			disableImageHead: '@',
			disableExif: '@',
			disableExifThumbnail: '@',
			disableExifSub: '@',
			disableExifGps: '@',
			disabled: '@disableImageMetaDataLoad'
		},
		{
			action: 'loadImage',
			// Use the action as prefix for the "@" options:
			prefix: true,
			fileTypes: '@',
			maxFileSize: '@',
			noRevoke: '@',
			disabled: '@disableImageLoad'
		},
		{
			action: 'resizeImage',
			// Use "image" as prefix for the "@" options:
			prefix: 'image',
			maxWidth: '@',
			maxHeight: '@',
			minWidth: '@',
			minHeight: '@',
			crop: '@',
			orientation: '@',
			forceResize: '@',
			disabled: '@disableImageResize'
		},
		{
			action: 'saveImage',
			quality: '@imageQuality',
			type: '@imageType',
			disabled: '@disableImageResize'
		},
		{
			action: 'saveImageMetaData',
			disabled: '@disableImageMetaDataSave'
		},
		{
			action: 'resizeImage',
			// Use "preview" as prefix for the "@" options:
			prefix: 'preview',
			maxWidth: '@',
			maxHeight: '@',
			minWidth: '@',
			minHeight: '@',
			crop: '@',
			orientation: '@',
			thumbnail: '@',
			canvas: '@',
			disabled: '@disableImagePreview'
		},
		{
			action: 'setImage',
			name: '@imagePreviewName',
			disabled: '@disableImagePreview'
		},
		{
			action: 'deleteImageReferences',
			disabled: '@disableImageReferencesDeletion'
		}
	);

	$.widget('blueimp.fileupload', $.blueimp.fileupload, {

		options: {
			loadImageFileTypes: /^image\/(gif|jpeg|png|svg\+xml)$/,
			loadImageMaxFileSize: 10000000,
			imageMaxWidth: 1920,
			imageMaxHeight: 1080,
			imageOrientation: false,
			imageCrop: false,
			disableImageResize: true,
			previewMaxWidth: 80,
			previewMaxHeight: 80,
			previewOrientation: true,
			previewThumbnail: true,
			previewCrop: false,
			previewCanvas: true
		},

		processActions: {

			loadImage: function (data, options) {
				if (options.disabled) {
					return data;
				}
				var that = this,
					file = data.files[data.index],
					dfd = $.Deferred();
				if (($.type(options.maxFileSize) === 'number' &&
					file.size > options.maxFileSize) ||
					(options.fileTypes &&
					!options.fileTypes.test(file.type)) ||
					!loadImage(
						file,
						function (img) {
							if (img.src) {
								data.img = img;
							}
							dfd.resolveWith(that, [data]);
						},
						options
					)) {
					return data;
				}
				return dfd.promise();
			},

			resizeImage: function (data, options) {
				if (options.disabled || !(data.canvas || data.img)) {
					return data;
				}
				options = $.extend({canvas: true}, options);
				var that = this,
					dfd = $.Deferred(),
					img = (options.canvas && data.canvas) || data.img,
					resolve = function (newImg) {
						if (newImg && (newImg.width !== img.width ||
							newImg.height !== img.height ||
							options.forceResize)) {
							data[newImg.getContext ? 'canvas' : 'img'] = newImg;
						}
						data.preview = newImg;
						dfd.resolveWith(that, [data]);
					},
					thumbnail;
				if (data.exif) {
					if (options.orientation === true) {
						options.orientation = data.exif.get('Orientation');
					}
					if (options.thumbnail) {
						thumbnail = data.exif.get('Thumbnail');
						if (thumbnail) {
							loadImage(thumbnail, resolve, options);
							return dfd.promise();
						}
					}
					if (data.orientation) {
						delete options.orientation;
					} else {
						data.orientation = options.orientation;
					}
				}
				if (img) {
					resolve(loadImage.scale(img, options));
					return dfd.promise();
				}
				return data;
			},

			saveImage: function (data, options) {
				if (!data.canvas || options.disabled) {
					return data;
				}
				var that = this,
					file = data.files[data.index],
					dfd = $.Deferred();
				if (data.canvas.toBlob) {
					data.canvas.toBlob(
						function (blob) {
							if (!blob.name) {
								if (file.type === blob.type) {
									blob.name = file.name;
								} else if (file.name) {
									blob.name = file.name.replace(
										/\.\w+$/,
										'.' + blob.type.substr(6)
									);
								}
							}
							if (file.type !== blob.type) {
								delete data.imageHead;
							}
							data.files[data.index] = blob;
							dfd.resolveWith(that, [data]);
						},
						options.type || file.type,
						options.quality
					);
				} else {
					return data;
				}
				return dfd.promise();
			},

			loadImageMetaData: function (data, options) {
				if (options.disabled) {
					return data;
				}
				var that = this,
					dfd = $.Deferred();
				loadImage.parseMetaData(data.files[data.index], function (result) {
					$.extend(data, result);
					dfd.resolveWith(that, [data]);
				}, options);
				return dfd.promise();
			},

			saveImageMetaData: function (data, options) {
				if (!(data.imageHead && data.canvas &&
					data.canvas.toBlob && !options.disabled)) {
					return data;
				}
				var file = data.files[data.index],
					blob = new Blob([
						data.imageHead,
						this._blobSlice.call(file, 20)
					], {type: file.type});
				blob.name = file.name;
				data.files[data.index] = blob;
				return data;
			},

			setImage: function (data, options) {
				if (data.preview && !options.disabled) {
					data.files[data.index][options.name || 'preview'] = data.preview;
				}
				return data;
			},

			deleteImageReferences: function (data, options) {
				if (!options.disabled) {
					delete data.img;
					delete data.canvas;
					delete data.preview;
					delete data.imageHead;
				}
				return data;
			}

		}

	});

}));


/*
 * jquery.fileupload-validate.js
 */

(function (factory) {
	'use strict';
	if (typeof define === 'function' && define.amd) {
		define([
			'jquery',
			'./jquery.fileupload-process'
		], factory);
	} else if (typeof exports === 'object') {
		factory(require('jquery'));
	} else {
		factory(
			window.jQuery
		);
	}
}(function ($) {
	'use strict';

	$.blueimp.fileupload.prototype.options.processQueue.push(
		{
			action: 'validate',
			always: true,
			acceptFileTypes: '@',
			maxFileSize: '@',
			minFileSize: '@',
			maxNumberOfFiles: '@',
			disabled: '@disableValidation'
		}
	);

	$.widget('blueimp.fileupload', $.blueimp.fileupload, {

		options: {
			getNumberOfFiles: $.noop,
			messages: {
				maxNumberOfFiles: 'Maximum number of files exceeded',
				acceptFileTypes: 'File type not allowed',
				maxFileSize: 'File is too large',
				minFileSize: 'File is too small'
			}
		},

		processActions: {

			validate: function (data, options) {
				if (options.disabled) {
					return data;
				}
				var dfd = $.Deferred(),
					settings = this.options,
					file = data.files[data.index],
					fileSize;
				if (options.minFileSize || options.maxFileSize) {
					fileSize = file.size;
				}
				if ($.type(options.maxNumberOfFiles) === 'number' &&
					(settings.getNumberOfFiles() || 0) + data.files.length >
					options.maxNumberOfFiles) {
					file.error = settings.i18n('maxNumberOfFiles');
				} else if (options.acceptFileTypes &&
					!(options.acceptFileTypes.test(file.type) ||
					options.acceptFileTypes.test(file.name))) {
					file.error = settings.i18n('acceptFileTypes');
				} else if (fileSize > options.maxFileSize) {
					file.error = settings.i18n('maxFileSize');
				} else if ($.type(fileSize) === 'number' &&
					fileSize < options.minFileSize) {
					file.error = settings.i18n('minFileSize');
				} else {
					delete file.error;
				}
				if (file.error || data.files.error) {
					data.files.error = true;
					dfd.rejectWith(this, [data]);
				} else {
					dfd.resolveWith(this, [data]);
				}
				return dfd.promise();
			}

		}

	});

}));