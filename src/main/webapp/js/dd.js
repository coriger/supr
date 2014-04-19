KISSY.add("dd/ddm",function(a,b,c,d,e,f){function o(){var a=this;o.superclass.constructor.apply(a,arguments)}function p(a){var b=this,c=b.__activeToDrag,d=b.get("activeDrag");(d||c)&&a.preventDefault(),d?(d._move(a),q(b,a)):c&&c._move(a)}function q(b,c){var d=b.get("activeDrag"),e=d.get("mode"),f=b.get("drops"),g,h=0,i=0,j=w(d.get("node")),k=y(j);a.each(f,function(a){var b,f=a.getNodeFromTarget(c,d.get("dragNode")[0],d.get("node")[0]);if(!f)return;if(e=="point")A(f,d.mousePos)&&(b=y(w(f)),g?b<i&&(g=a,i=b):(g=a,i=b));else if(e=="intersect")b=y(z(j,w(f))),b>i&&(i=b,g=a);else if(e=="strict"){b=y(z(j,w(f)));if(b==k)return g=a,!1}}),h=b.get("activeDrop"),h&&h!=g&&(h._handleOut(c),d._handleOut(c)),b.set("activeDrop",g),g&&(h!=g?g._handleEnter(c):g._handleOver(c))}function r(a){var b=document;a._shim=(new e("<div style='background-color:red;position:"+(i?"absolute":"fixed")+";"+"left:0;"+"width:100%;"+"height:100%;"+"top:0;"+"cursor:"+B.get("dragCursor")+";"+"z-index:"+n+";"+"'><"+"/div>")).prependTo(b.body||b.documentElement).css("opacity",0),r=t,i&&d.on(h,"resize scroll",s,a),t(a)}function t(a){var b=a.get("activeDrag").get("activeHandler"),c="auto";b&&(c=b.css("cursor")),c=="auto"&&(c=a.get("dragCursor")),a._shim.css({cursor:c,display:"block"}),i&&s.call(a)}function u(a){d.on(g,"mouseup",a._end,a),d.on(g,"mousemove",m,a)}function v(a){d.remove(g,"mousemove",m,a),d.remove(g,"mouseup",a._end,a)}function w(a){var b=a.offset();return{left:b.left,right:b.left+a.outerWidth(),top:b.top,bottom:b.top+a.outerHeight()}}function x(a,b){return a.left<=b.left&&a.right>=b.left&&a.top<=b.top&&a.bottom>=b.top}function y(a){return a.top>=a.bottom||a.left>=a.right?0:(a.right-a.left)*(a.bottom-a.top)}function z(a,b){var c=Math.max(a.top,b.top),d=Math.min(a.right,b.right),e=Math.min(a.bottom,b.bottom),f=Math.max(a.left,b.left);return{left:f,right:d,top:c,bottom:e}}function A(a,b){return x(w(a),b)}var g=document,h=window,i=b.ie===6,j=3,k=1e3,l=30,m=a.throttle(p,l),n=999999;o.ATTRS={prefixCls:{value:"ks-dd-"},dragCursor:{value:"move"},clickPixelThresh:{value:j},bufferTime:{value:k},activeDrag:{},activeDrop:{},drops:{value:[]}};var s=a.throttle(function(){var a=this,b;(b=a.get("activeDrag"))&&b.get("shim")&&a._shim.css({width:c.docWidth(),height:c.docHeight()})},l);a.extend(o,f,{__activeToDrag:0,_regDrop:function(a){this.get("drops").push(a)},_unregDrop:function(b){var c=this,d=a.indexOf(b,c.get("drops"));d!=-1&&c.get("drops").splice(d,1)},_regToDrag:function(a){var b=this;u(b),b.__activeToDrag=a},_start:function(){var a=this,b=a.__activeToDrag;a.set("activeDrag",b),a.__activeToDrag=0,b.get("shim")&&r(a),a.fire("dragstart",{drag:b})},_end:function(){var a=this,b=a.get("activeDrag"),c=a.get("activeDrop"),d={drag:b,drop:c};v(a),a.__activeToDrag&&(a.__activeToDrag._end(),a.__activeToDrag=0),a._shim&&a._shim.hide();if(!b)return;b._end(),c?(c._end(),a.fire("drophit",d),a.fire("dragdrophit",d)):a.fire("dragdropmiss",{drag:b}),a.fire("dragend",{drag:b}),a.set("activeDrag",null),a.set("activeDrop",null)}});var B=new o;return B.inRegion=x,B.region=w,B.area=y,B},{requires:["ua","dom","event","node","base"]}),KISSY.add("dd/draggable",function(a,b,c,d,e){function j(){var a=this;j.superclass.constructor.apply(a,arguments),a._init()}function l(){i.body.onselectstart=k}function m(){k=i.body.onselectstart,i.body.onselectstart=o}function n(a){a.preventDefault()}function o(){return!1}function p(a){var b=this,c=a.target;if(b._checkMouseDown(a)){if(!b._check(c))return;b._prepare(a)}}var f=a.each,g=b.ie,h=null,i=document;j.POINT="point",j.INTERSECT="intersect",j.STRICT="strict",j.ATTRS={node:{setter:function(a){return c.one(a)}},clickPixelThresh:{valueFn:function(){return e.get("clickPixelThresh")}},bufferTime:{valueFn:function(){return e.get("bufferTime")}},dragNode:{},shim:{value:!0},handlers:{value:[],getter:function(b){var d=this;return b.length||(b[0]=d.get("node")),f(b,function(e,f){a.isFunction(e)&&(e=e.call(d));if(a.isString(e)||e.nodeType)e=c.one(e);b[f]=e}),d.__set("handlers",b),b}},activeHandler:{},dragging:{value:!1,setter:function(a){var b=this;b.get("dragNode")[a?"addClass":"removeClass"](e.get("prefixCls")+"dragging")}},mode:{value:"point"},disabled:{value:!1,setter:function(a){return this.get("dragNode")[a?"addClass":"removeClass"](e.get("prefixCls")+"-disabled"),a}},move:{value:!1},primaryButtonOnly:{value:!0},halt:{value:!0}};var k;return a.extend(j,d,{startMousePos:h,startNodePos:h,_diff:h,_bufferTimer:h,_init:function(){var a=this,b=a.get("node");a.set("dragNode",b),b.on("mousedown",p,a).on("dragstart",a._fixDragStart)},_fixDragStart:n,destroy:function(){var a=this,b=a.get("dragNode");b.detach("mousedown",p,a).detach("dragstart",a._fixDragStart),a.detach()},_check:function(a){var b=this,c=b.get("handlers"),d=0;return f(c,function(c){if(c.contains(a)||c[0]==a)return d=1,b.set("activeHandler",c),!1}),d},_checkMouseDown:function(a){return this.get("primaryButtonOnly")&&a.button>1||this.get("disabled")?0:1},_prepare:function(a){var b=this;g&&m(),b.get("halt")?a.halt():a.preventDefault();var c=b.get("node"),d=a.pageX,f=a.pageY,h=c.offset();b.startMousePos=b.mousePos={left:d,top:f},b.startNodePos=h,b._diff={left:d-h.left,top:f-h.top},e._regToDrag(b);var i=b.get("bufferTime");i&&(b._bufferTimer=setTimeout(function(){b._start()},i))},_clearBufferTimer:function(){var a=this;a._bufferTimer&&(clearTimeout(a._bufferTimer),a._bufferTimer=0)},_move:function(a){var b=this,c,d=b._diff,f=b.startMousePos,g=a.pageX,h=a.pageY,i=g-d.left,j=h-d.top;if(!b.get("dragging")){var k=b.get("clickPixelThresh"),l,m;((l=Math.abs(g-f.left))>=k||(m=Math.abs(h-f.top))>=k)&&b._start();return}b.mousePos={left:g,top:h},c={left:i,top:j,pageX:g,pageY:h,drag:b};var n=1;b.fire("drag",c)===!1&&(n=0),e.fire("drag",c)===!1&&(n=0),n&&b.get("move")&&b.get("node").offset(c)},_end:function(){var a=this,b;a._clearBufferTimer(),g&&l(),a.get("dragging")&&(a.get("node").removeClass(e.get("prefixCls")+"drag-over"),(b=e.get("activeDrop"))?a.fire("dragdrophit",{drag:a,drop:b}):a.fire("dragdropmiss",{drag:a}),a.set("dragging",0),a.fire("dragend",{drag:a}))},_handleOut:function(){var a=this;a.get("node").removeClass(e.get("prefixCls")+"drag-over"),a.fire("dragexit",{drag:a,drop:e.get("activeDrop")})},_handleEnter:function(a){var b=this;b.get("node").addClass(e.get("prefixCls")+"drag-over"),b.fire("dragenter",a)},_handleOver:function(a){this.fire("dragover",a)},_start:function(){var a=this;a._clearBufferTimer(),a.set("dragging",1),e._start(),a.fire("dragstart",{drag:a})}}),j},{requires:["ua","node","base","./ddm"]}),KISSY.add("dd/droppable",function(a,b,c,d){function e(){var a=this;e.superclass.constructor.apply(a,arguments),a._init()}return e.ATTRS={node:{setter:function(a){if(a)return b.one(a)}}},a.extend(e,c,{getNodeFromTarget:function(a,b,c){var d=this.get("node"),e=d[0];return e==b||e==c?null:d},_init:function(){d._regDrop(this)},__getCustomEvt:function(b){return a.mix({drag:d.get("activeDrag"),drop:this},b)},_handleOut:function(){var a=this,b=a.__getCustomEvt();a.get("node").removeClass(d.get("prefixCls")+"drop-over"),a.fire("dropexit",b),d.fire("dropexit",b),d.fire("dragexit",b)},_handleEnter:function(a){var b=this,c=b.__getCustomEvt(a);c.drag._handleEnter(c),b.get("node").addClass(d.get("prefixCls")+"drop-over"),this.fire("dropenter",c),d.fire("dragenter",c),d.fire("dropenter",c)},_handleOver:function(a){var b=this,c=b.__getCustomEvt(a);c.drag._handleOver(c),b.fire("dropover",c),d.fire("dragover",c),d.fire("dropover",c)},_end:function(){var a=this,b=a.__getCustomEvt();a.get("node").removeClass(d.get("prefixCls")+"drop-over"),a.fire("drophit",b)},destroy:function(){d._unregDrop(this)}}),e},{requires:["node","base","./ddm"]}),KISSY.add("dd/proxy",function(a,b){function g(){var a=this;g.superclass.constructor.apply(a,arguments),a[c]={}}var c="__proxy_destructors",d=a.stamp,e=a.guid("__dd_proxy"),f="__proxy";return g.ATTRS={node:{value:function(a){return new b(a.get("node").clone(!0))}},destroyOnEnd:{value:!1}},a.extend(g,a.Base,{attach:function(b){function i(){var c=g.get("node"),d=b.get("node");g[f]?c=g[f]:a.isFunction(c)&&(c=c(b),c.addClass("ks-dd-proxy"),c.css("position","absolute"),g[f]=c),d.parent().append(c),c.show(),c.offset(d.offset()),b.set("dragNode",d),b.set("node",c)}function j(){var a=g[f];b.get("dragNode").offset(a.offset()),a.hide(),g.get("destroyOnEnd")&&(a.remove(),g[f]=0),b.set("node",b.get("dragNode"))}var g=this,h;if(h=d(b,1,e)&&g[c][h])return;b.on("dragstart",i),b.on("dragend",j),h=d(b,0,e),g[c][h]={drag:b,fn:function(){b.detach("dragstart",i),b.detach("dragend",j)}}},unAttach:function(a){var b=this,f=d(a,1,e),g=b[c];f&&g[f]&&(g[f].fn(),delete g[f])},destroy:function(){var b=this,d=b.get("node"),e=b[c];d&&!a.isFunction(d)&&d.remove();for(var f in e)this.unAttach(e[f].drag)}}),g},{requires:["node"]}),KISSY.add("dd/draggable-delegate",function(a,b,c,d,e){function f(){f.superclass.constructor.apply(this,arguments)}function g(a){var b=this,c,d;if(!b._checkMouseDown(a))return;var f=b.get("handlers"),g=new e(a.target);f.length?c=b._getHandler(g):c=g;if(!c)return;b.set("activeHandler",c),d=b._getNode(c),b.set("node",d),b.set("dragNode",d),b._prepare(a)}return a.extend(f,c,{_init:function(){var a=this,b=a.get("container");b.on("mousedown",g,a).on("dragstart",a._fixDragStart)},_getHandler:function(b){var c=this,e,f=c.get("container"),g=c.get("handlers");while(b&&b[0]!==f[0]){a.each(g,function(a){if(d.test(b[0],a))return e=b,!1});if(e)break;b=b.parent()}return e},_getNode:function(a){return a.closest(this.get("selector"),this.get("container"))},destroy:function(){var a=this;a.get("container").detach("mousedown",g,a).detach("dragstart",a._fixDragStart),a.detach()}},{ATTRS:{container:{setter:function(a){return e.one(a)}},selector:{},handlers:{value:[],getter:0}}}),f},{requires:["./ddm","./draggable","dom","node"]}),KISSY.add("dd/droppable-delegate",function(a,b,c,d,e){function f(){var a=this,b=a.get("container"),c=a.get("selector");a.__allNodes=b.all(c)}function g(){var a=this;g.superclass.constructor.apply(a,arguments),b.on("dragstart",f,a)}return a.extend(g,c,{getNodeFromTarget:function(a,c,d){var e={left:a.pageX,top:a.pageY},f=this,g=f.__allNodes,h=0,i=Number.MAX_VALUE;return g&&g.each(function(a){var f=a[0];if(f===d||f===c)return;if(b.inRegion(b.region(a),e)){var g=b.area(b.region(a));g<i&&(i=g,h=a)}}),h&&(f.set("lastNode",f.get("node")),f.set("node",h)),h},_handleOut:function(){var a=this;g.superclass._handleOut.apply(a,arguments),a.set("node",0),a.set("lastNode",0)},_handleOver:function(a){var b=this,c=b.get("node"),d=g.superclass._handleOut,e=g.superclass._handleOver,f=g.superclass._handleEnter,h=b.get("lastNode");h[0]!==c[0]?(b.set("node",h),d.apply(b,arguments),b.set("node",c),f.call(b,a)):e.call(b,a)}},{ATTRS:{lastNode:{},selector:{},container:{setter:function(a){return e.one(a)}}}}),g},{requires:["./ddm","./droppable","dom","node"]}),KISSY.add("dd/scroll",function(a,b,c,d){function k(){var a=this;k.superclass.constructor.apply(a,arguments),a[j]={}}var e="__dd-scroll-id-",f=a.stamp,g=[10,10],h=100,i=[20,20],j="__dd_scrolls";k.ATTRS={node:{valueFn:function(){return c.one(window)},setter:function(a){return c.one(a)}},rate:{value:g},diff:{value:i}};var l=a.isWindow;return a.extend(k,b,{getRegion:function(a){return l(a[0])?{width:d.viewportWidth(),height:d.viewportHeight()}:{width:a.outerWidth(),height:a.outerHeight()}},getOffset:function(a){return l(a[0])?{left:d.scrollLeft(),top:d.scrollTop()}:a.offset()},getScroll:function(a){return{left:a.scrollLeft(),top:a.scrollTop()}},setScroll:function(a,b){a.scrollLeft(b.left),a.scrollTop(b.top)},unAttach:function(a){var b,c=this[j];if(!(b=f(a,1,e))||!c[b])return;c[b].fn(),delete c[b]},destroy:function(){var a=this,b=a[j];for(var c in b)a.unAttach(b[c].drag)},attach:function(b){function p(d){if(d.fake)return;var e=c.get("node");m=d,n=a.clone(b.mousePos);var f=c.getOffset(e);n.left-=f.left,n.top-=f.top,o||r()}function q(){clearTimeout(o),o=null}function r(){var d=c.get("node"),e=c.getRegion(d),f=e.width,g=e.height,j=c.getScroll(d),p=a.clone(j),q=n.top-g,s=!1;q>=-k[1]&&(j.top+=i[1],s=!0);var t=n.top;t<=k[1]&&(j.top-=i[1],s=!0);var u=n.left-f;u>=-k[0]&&(j.left+=i[0],s=!0);var v=n.left;v<=k[0]&&(j.left-=i[0],s=!0),s?(c.setScroll(d,j),o=setTimeout(r,h),m.fake=!0,l(d[0])&&(j=c.getScroll(d),m.left+=j.left-p.left,m.top+=j.top-p.top),b.fire("drag",m)):o=null}var c=this,d=f(b,0,e),g=c[j];if(g[d])return;var i=c.get("rate"),k=c.get("diff"),m,n,o=null;b.on("drag",p),b.on("dragend",q),g[d]={drag:b,fn:function(){b.detach("drag",p),b.detach("dragend",q)}}}}),k},{requires:["base","node","dom"]}),KISSY.add("dd",function(a,b,c,d,e,f,g,h){var i={Draggable:c,Droppable:d,DDM:b,Proxy:e,DraggableDelegate:f,DroppableDelegate:g,Scroll:h};return a.mix(a,i),i},{requires:["dd/ddm","dd/draggable","dd/droppable","dd/proxy","dd/draggable-delegate","dd/droppable-delegate","dd/scroll"]});