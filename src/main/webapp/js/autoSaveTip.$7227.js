KISSY.add("lib/autoSaveTip",function(a,b,c,d,e,f){var g={init:function(){c.on("#J_AutoSaveTipClose","click",function(){confirm("\u786e\u5b9a\u8981\u5220\u9664\u6240\u6709\u81ea\u52a8\u4fdd\u5b58\u7684\u6587\u7ae0\u5417\uff1f")&&d.post(f.url.host+"/autosave/delete",{action:"all"},function(a){0==a.errCode?(b.hide("#J_PublisherTipWrap"),b.attr("#publisher","style",""),e.updateFeedOffsetInfo()):f.alert(a.result)})})}};return g},{requires:["dom","event","ajax","lib/feed.$7227","util.$7202"]});