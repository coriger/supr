KISSY.add("app/publisher/plugins/postCc",function(a,b,c){var d={by_nc_nd:"123",by_nc_sa:"124",by_nc:"12",by_nd:"13",by_sa:"14",by:"1"},e="#post-cc-holder",f="#post-cc",g="#post-cc-sub",h="#post-cc-sub-modify-btn",i="#postCcPanel",j="#postCcModify",k,l=!0,m={init:function(a){if(!b.get(e))return;var d=this;k=a,d.addEvent(),d._checkPostCc(),c.fire(k,"fix:refresh"),c.on(k,"postCc:setValue",function(a){d.setValue(a.enable,a.value)})},addEvent:function(){var d=this;c.on(f,"click",function(a){d._checkPostCc(),c.fire(k,"fix:refresh")}),c.on(h,"click",function(e){var f=d.getValue();a.each(b.query("input",j),function(a,b){a.value==f&&(a.checked=!0)}),b.show(j),b.hide(i),e.halt(),c.fire(k,"fix:refresh")}),c.on(j,"click",function(a){var e=a.target;e.tagName.toLowerCase()=="input"&&(b.attr(i,"value",e.value),d.render(),c.fire(k,"fix:refresh"))})},setValue:function(a,c){if(l){l=!1;return}b.get(f).checked=a,b.attr(i,"value",c),a?b.show(e):b.hide(e),this._checkPostCc()},getValue:function(){return b.attr(i,"value")},getData:function(){return k?{creativeCommonsEnable:b.get(f).checked,creativeCommonsType:this.getValue()}:{}},_checkPostCc:function(){b.get(f).checked?this.render():b.hide(g)},render:function(){var c=this.getValue();c=d[c]||"123",c=c.split(""),a.each(b.query("span",i),function(d,e){var f=d.className.match(/cc-(\d)/)[1];a.inArray(f,c)?b.show(d):b.hide(d)}),c=c.join(""),b.attr(i,"title",b.get(".post-cc-text-"+c).innerHTML),b.show(i),b.show(g),b.hide(j)}};return m},{requires:["dom","event"]});