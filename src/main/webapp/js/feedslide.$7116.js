KISSY.add("lib/feedslide",function(a,b,c,d,e,f){function v(){if(!!q||!!r)return;r=!0;var a=document.createElement("script");a.src="http://api.map.baidu.com/api?v=1.2&callback=ENV._BDMAPLOADED",document.body.appendChild(a)}function w(b){return m=ENV.feedImgInfos,a.mix(this,b),this._init(),this}function x(){return{height:b.viewportHeight(),width:b.viewportWidth()}}function y(a){var b=new Image;b.src=a}function z(a){var b=/http\:\/\/.+?_(\d+)_(\d+)\.+/,c=a.match(b);return{width:c[1],height:c[2]}}function A(a){var b=m[a],c=x(),d=z(b[800]),e=d.width/d.height,f,g,h,i="800";return c.width=c.width-230,c.height=c.height-80,f=c.width/c.height,f>e?(d.height<c.height&&(d=z(b[1280]),i="1280"),h=c.height>d.height?d.height:c.height,g=h*d.width/d.height):(d.width<c.width&&(d=z(b[1280]),i="1280"),g=c.width>d.width?d.width:c.width,h=g*d.height/d.width),{size:i,width:g,height:h}}function B(a){var b=a;return!a.make&&!a.model&&(b=undefined),b}function C(b){var c=[],d;return a.each(j,function(a){var d=a.name,e;(e=b[d])&&c.push({name:a.value,value:e})}),b.gpsAddress&&(c.gpsMapX=b.gpsMapX,c.gpsMapY=b.gpsMapY),c}var g="dd-feed-slide-",h='<div class="'+g+'wrap" style="z-index:10001;position:absolute;left:0;top:0;width:100%;display:none;overflow:hidden;">'+'<div class="'+g+'container" style="position:relative;width:100%;">'+'<div class="'+g+'close" style="position:absolute;width:20px;height:20px;background:url('+f.url.staticHost+'/img/element/x.$5594.png) no-repeat;top:10px;right:10px;cursor:pointer;"></div>'+'<div class="'+g+'keyboard-tip" style="position:absolute;width:80px;height:32px;background:url('+f.url.staticHost+'/img/element/feedslide-tip.$5597.png) no-repeat;bottom:10px;right:10px;cursor:pointer;"></div>'+'<div class="'+g+'next-img" style="position:absolute;width:100px;height:200px;right:0;top:50%;margin-top:-100px;background-repeat:no-repeat;background-position:center center;cursor:pointer;"></div>'+'<div class="'+g+'prev-img" style="position:absolute;width:100px;height:200px;left:0;top:50%;margin-top:-100px;background-repeat:no-repeat;background-position:center center;cursor:pointer;"></div>'+'<div class="'+g+'current-img-wrap" style="position:absolute;">'+'<div style="position:relative;width:100%;height:100%;">'+'<img class="'+g+'current-img" style="background:#fff url('+f.url.staticHost+'/img/element/loading-small.$6925.gif) no-repeat center center;position:absolute;left:0;top:0;">'+'<div class="img-exif-holder enable">'+'<div class="exif-mask"></div>'+'<div class="exif-info"></div>'+'<span style="left:10px;" class="exif-toggler" title="\u67e5\u770b\u7167\u7247Exif\u4fe1\u606f">\u67e5\u770b\u7167\u7247Exif\u4fe1\u606f</span>'+"</div>"+"</div>"+"</div>"+'<div class="'+g+'swap-img-wrap" style="position:absolute;left:-9999px">'+'<div style="position:relative;width:100%;height:100%;" class="img-wrap">'+'<img class="'+g+'swap-img" style="background:#fff url('+f.url.staticHost+'/img/element/loading-small.$6925.gif) no-repeat center center;position:absolute;left:0;top:0;">'+'<div class="img-exif-holder enable">'+'<div class="exif-mask"></div>'+'<div class="exif-info"></div>'+'<span style="left:10px;" class="exif-toggler" title="\u67e5\u770b\u7167\u7247Exif\u4fe1\u606f">\u67e5\u770b\u7167\u7247Exif\u4fe1\u606f</span>'+"</div>"+"</div>"+"</div>"+'<div class="'+g+'meta-wrap" style="position:absolute;color:#666;font-size:12px;">'+'<div class="'+g+'desc" style="padding-bottom:5px;color:#AAA;"></div>'+'<a target="_blank" class="'+g+'large-img-link" style="color:#666;display:block;"></a>'+"</div>"+"</div>"+"</div>",i='<table><tbody>{{#each exifs as exif}}<tr><th class="exif-hd">{{exif.name}}</th><td class="exif-bd">{{exif.value}}</td></tr>{{/each}}{{#if exifs.gpsMapX}}<tr><th class="exif-hd">&nbsp</th><td><div class="exif-map-holder" id="exif-map-holder" style="width:260px;height:170px;margin-top:5px;display:none;"></div></td></tr>{{/if}}</tbody></table>',j=[{name:"make",value:"\u54c1\u724c"},{name:"model",value:"\u578b\u53f7"},{name:"dateTime",value:"\u7167\u7247\u65f6\u95f4"},{name:"lens",value:"\u955c\u5934"},{name:"iSOSpeedRatings",value:"ISO"},{name:"exposureTime",value:"\u66dd\u5149\u65f6\u95f4"},{name:"fNumber",value:"\u5149\u5708"},{name:"whiteBalance",value:"\u767d\u5e73\u8861"},{name:"flash",value:"\u95ea\u5149\u706f"},{name:"focalLength",value:"\u7126\u8ddd"},{name:"focalLength35",value:"35mm\u7b49\u6548\u7126\u8ddd"},{name:"exposureBiasValue",value:"\u66dd\u5149\u8865\u507f"},{name:"exposureProgram",value:"\u66dd\u5149\u7a0b\u5e8f"},{name:"software",value:"\u8f6f\u4ef6"},{name:"gpsAddress",value:"\u5730\u7406\u4f4d\u7f6e"}],k="easeBoth",l=.3,m,n=50,o=.5,p=400,q,r,s=2,t=0,u=!1;return ENV._BDMAPLOADED=function(){q=!0,r=!1},f.Dispatcher.on("feedlist::exifLocationLoad",function(){v()}),a.augment(w,{_maskLevel:5,_init:function(){this._inited=!0,this.id="dd-feed-slide-"+a.guid(),this._render(),this._bindEvent()},_bindEvent:function(){var c=this,e=c.get("wrap"),f=c.get("large-img-link"),g=c.get("prev-img"),h=c.get("next-img"),i=c.get("current-img-wrap"),j=c.get("swap-img-wrap"),k=c.get("");a.each([h,g],function(a){d.on(a,"mouseenter",function(){b.css(a,{opacity:1})}),d.on(a,"mouseleave",function(){b.css(a,{opacity:o})})}),d.on(h,"click",function(a){c._hook_nextImg(a),a.halt()}),d.on(g,"click",function(a){c._hook_prevImg(a),a.halt()}),d.on(i,"click",function(a){var d=a.target;b.hasClass(d,"exif-toggler")?c.showExifInfo():c._hook_nextImg(a,!0),a.halt()}),d.on(j,"click",function(a){var d=a.target;b.hasClass(d,"exif-toggler")?c.showExifInfo():c._hook_nextImg(a,!0),a.halt()}),d.on(e,"click",function(a){var b=a.target;if(!!c._switching)return;c.hide()}),d.on(f,"click",function(a){a.stopPropagation()}),d.on(window,"resize",function(a){if(!c.isShow())return;c._updateLayout(),c.show(c._currentImgIndex)}),d.on(document,"keydown",function(a){if(!c.isShow())return;var b=a.keyCode;if(b==39||b==40)a.preventDefault(),c.nextImg();if(b==37||b==38)a.preventDefault(),c.prevImg();b==27&&(a.preventDefault(),c.hide())})},_hook_prevImg:function(a){a.preventDefault(),b.css(this.get("prev-img"),{opacity:1}),this.prevImg()},_hook_nextImg:function(a,c){a.preventDefault(),c||b.css(this.get("next-img"),{opacity:1}),this.nextImg()},_preloadImg:function(a){var b=m[this.data[a]],c=m[this.data[a-1]],d=m[this.data[a+1]],e;if(!b)return;e=A(this.data[a]),y(b[250]),y(b[e.size]),!c||y(c[250]),!d||y(d[250])},get:function(a){return a=="wrap"?this.wrap:b.get("."+g+a,this.wrap)},changeFullScreenHandler:function(a){var c=a.type,d;"fullscreenchange"===c?d=document.fullscreen:"mozfullscreenchange"===c?d=document.mozFullScreen:"webkitfullscreenchange"===c&&(d=document.webkitIsFullScreen),d?b.css(this.get("container"),"background","#000000"):this.hide()},show:function(f){var g=this;a.UA.gecko?b.css("body",{"overflow-x":"hidden"}):(b.css("html",{"overflow-x":"hidden"}),b.css("html",{"overflow-y":"hidden"})),this._inited||this._init(),f||(f=0),this._currentImgIndex=parseInt(f);var g=this,h,i,j=this.data,k=g.get("keyboard-tip");c.Mask.show(g._maskLevel,"slideshow"),mask=c.Mask.get(g._maskLevel),d.on(this.get("wrap"),"mousewheel",g._scrollHandler,this),this._updateLayout(),this._setNext(parseInt(f)+1),this._setPrev(parseInt(f)-1),this._setCurrent(parseInt(f));for(var l=1;l<=s;l++)g._preloadImg(parseInt(f)+l),g._preloadImg(parseInt(f)-l);b.show(this.get("wrap"));if(g.fullScreenSupport){var m=g.get("container");m.requestFullScreen?m.requestFullScreen():m.mozRequestFullScreen?m.mozRequestFullScreen():m.webkitRequestFullScreen&&m.webkitRequestFullScreen(),d.add(document,"fullscreenchange",g.changeFullScreenHandler,g),d.add(document,"mozfullscreenchange",g.changeFullScreenHandler,g),d.add(document,"webkitfullscreenchange",g.changeFullScreenHandler,g)}this._isShow=!0,this.data.length>1?setTimeout(function(){(new e(k,{opacity:0},.3,"easeBoth")).run()},3e3):b.hide(k),b.css(this.get("prev-img"),{opacity:o}),b.css(this.get("next-img"),{opacity:o})},_setNext:function(a,c){var d=m[this.data[a]],f=this.get("next-img");d?(f.style.backgroundImage='url("'+d[250]+'")',b.show(f),c=="next"?(b.css(f,{right:-100}),(new e(f,{right:0},.4,k)).run()):c=="prev"&&(b.css(f,{opacity:0}),(new e(f,{opacity:o},.8,k)).run())):b.hide(f)},_setPrev:function(a,c){var d=m[this.data[a]],f=this.get("prev-img");d?(f.style.backgroundImage='url("'+d[250]+'")',b.show(f),c=="prev"?(b.css(f,{left:-100}),(new e(f,{left:0},.4,k)).run()):c=="next"&&(b.css(f,{opacity:0}),(new e(f,{opacity:o},.8,k)).run())):b.hide(f)},_setCurrent:function(a){var c=m[this.data[a]],d=A(this.data[a]),e=this.get("current-img"),f=this.get("current-img-wrap"),g=this.get("large-img-link"),h=this.get("desc"),i,j,k=this.get("meta-wrap"),l=x(),o=(l.width-d.width)/2,q=z(c.large),r=(l.height-d.height-n)/2;e.src=c[d.size],e.width=d.width,e.height=d.height,b.css(f,{width:d.width,height:d.height,left:o,top:r}),b.css(e,{width:d.width,height:d.height}),g.href=c.large,g.innerHTML="\u67e5\u770b\u539f\u56fe("+q.width+"x"+q.height+")",i=parseInt(d.width/14)*2,j=decodeURIComponent(c.desc),j.length>i&&(j=j.substr(0,i)+"...",!this.postUrl||(j+='<a target="_blank" href="'+this.postUrl+'" style="color:#666;">\u7ee7\u7eed\u9605\u8bfb\u2192</a>')),h.innerHTML=j,j?b.show(h):b.hide(h),b.css(k,{left:o,top:r+parseInt(d.height)+10,width:d.width<p?p:d.width}),b.show(k),this._setExif(this.data[a])},_setExif:function(c){var e=m[c],f=this.get("current-img-wrap"),g=b.get(".img-exif-holder",f),h,j;if(!e||!e.exif||!(j=B(e.exif))){b.hide(g);return}var k=C(j),l=a.Template(i).render({exifs:k}),n=a.get(".exif-info",g);n.innerHTML=l,b.show(g),h=b.get(".exif-map-holder",g),this._mapHolder=null,k.gpsMapX&&!!q&&(this._mapHolder=h,this._mapCenterPt=new BMap.Point(k.gpsMapX,k.gpsMapY)),d.on(h,"click",function(a){a.stopPropagation()})},showExifInfo:function(){var a=this.get("current-img-wrap");b.toggleClass(b.get(".img-exif-holder",a),"open");if(!this._mapHolder)return;b.show(this._mapHolder),this._mapEl=new BMap.Map(this._mapHolder),this._mapEl.centerAndZoom(this._mapCenterPt,15),this._mapEl.addControl(new BMap.NavigationControl({type:BMAP_NAVIGATION_CONTROL_ZOOM}));var c=new BMap.Marker(this._mapCenterPt);this._mapEl.addOverlay(c)},_render:function(){var a=this.data,c=b.create(h);b.append(c,"body"),this.wrap=c},_updateLayout:function(){var a=x(),c=this.get("wrap"),d=this.get("container"),e=b.scrollTop();b.css(c,{width:a.width,height:a.height,top:e}),b.css(d,{width:a.width,height:a.height})},hide:function(){var e=this,f=c.Mask.get(e._maskLevel);d.remove(this.get("wrap"),"mousewheel",e._scrollHandler),c.Mask.hide(e._maskLevel),b.hide(this.get("wrap")),e.fullScreenSupport&&(document.cancelFullScreen?document.cancelFullScreen():document.mozCancelFullScreen?document.mozCancelFullScreen():document.webkitCancelFullScreen&&document.webkitCancelFullScreen(),document.removeEventListener&&(d.remove(document,"fullscreenchange",e.changeFullScreenHandler),d.remove(document,"mozfullscreenchange",e.changeFullScreenHandler),d.remove(document,"webkitfullscreenchange",e.changeFullScreenHandler))),this._isShow=!1,a.UA.gecko?b.css("body",{"overflow-x":"auto"}):(b.css("html",{"overflow-x":"auto"}),b.css("html",{"overflow-y":"auto"}))},isShow:function(){return this._isShow},destroy:function(){var a=this;this.hide(),d.remove(this.get("wrap"),"mousewheel",a._scrollHandler)},_scrollHandler:function(a){function f(){u=!0,setTimeout(function(){u=!1},e?700:0)}a.preventDefault();var b=this,c,d=.5,e=navigator.userAgent.indexOf("Macintosh")>-1;e?(c=a.deltaX,d=-0.5):c=a.deltaY;if(!e&&c>d&&!u||e&&c<d&&!u)b.prevImg(),f();if(!e&&c<-d&&!u||e&&c>-d&&!u)b.nextImg(),f()},_switchImg:function(a){if(!!this._switching)return;this._switching=!0;var c=this,d=c.data,f=c.get("wrap"),h=c.get("prev-img"),i=c.get("next-img"),j=c.get("current-img-wrap"),o=c.get("current-img"),q=c.get("swap-img-wrap"),r=c.get("swap-img"),t=c.get("large-img-link"),u=c.get("desc"),v,w,y=c.get("meta-wrap"),B=c._currentImgIndex,C,D,E,F=x(),G,H,I,J,K={},L,M,N=b.css(j,"left")||b.css(j,"right"),O=b.get(".img-exif-holder",j);C=a=="next"?B+1:B-1,D=d[C];if(!D){this._switching=!1,this.hide();return}b.hide(O),b.removeClass(O,"open"),newImg=m[D],E=A(D),c._currentImgIndex=parseInt(C),M=z(newImg.large),G=(F.width-E.width)/2,H=(F.height-E.height-n)/2,I={top:F.height/2,width:0,height:0,opacity:.5},J={top:H,width:E.width,height:E.height,opacity:1},L={top:F.height/2,width:0,height:0,opacity:0},a=="next"?(I.right=0,I.left="",J.right=G,K.left=N,K.right="",L.left=0):(I.left=0,I.right="",J.left=G,K.right=N,K.left="",L.right=0),r.src=newImg[250],r.src=newImg[E.size],r.width=E.width,r.height=E.height,b.css(q,I),b.css(r,{width:0,height:0}),b.css(j,K),b.removeClass(j,g+"current-img-wrap"),b.removeClass(o,g+"current-img"),b.removeClass(q,g+"swap-img-wrap"),b.removeClass(r,g+"swap-img"),b.addClass(j,g+"swap-img-wrap"),b.addClass(o,g+"swap-img"),b.addClass(q,g+"current-img-wrap"),b.addClass(r,g+"current-img"),b.hide(y),t.href=newImg.large,t.innerHTML="\u67e5\u770b\u539f\u56fe("+M.width+"x"+M.height+")",v=parseInt(E.width/14)*2,w=decodeURIComponent(newImg.desc),w.length>v&&(w=w.substr(0,v)+"...",w+='<a target="_blank" href="'+c.postUrl+'" style="color:#AAA;">\u7ee7\u7eed\u9605\u8bfb\u2192</a>'),u.innerHTML=w,b.css(y,{left:G,top:H+parseInt(E.height)+10,width:E.width<p?p:E.width}),w?b.show(u):b.hide(u),c._setNext(C+1,a),c._setPrev(C-1,a),(new e(q,J,l,k)).run(),(new e(r,{width:E.width,height:E.height},l,k)).run(),(new e(j,L,l,k,function(){b.css(j,{left:"",right:""})})).run(),(new e(o,{width:0,height:0},l,k,function(){c._switching=!1,b.show(y),c._setExif(D),o.src="http://s.srcdd.com/img/blank.png"})).run();for(var P=1;P<=s;P++)c._preloadImg(parseInt(C)+P),c._preloadImg(parseInt(C)-P)},nextImg:function(){this._switchImg("next")},prevImg:function(){this._switchImg("prev")}}),w},{requires:["dom","sky.$6939","event","anim","util.$7066"]});