KISSY.add("app/publisher/text", function(a, b, c, d) {
	var e = d.TEXT,
		f, g = b.get,
		h = "#pb-text-pic-uploading",
		i = "#pb-text-textarea",
		j = "#pb-text-title";
	return f = {
		el: {},
		editorTarget: i,
		type: e,
		init: function() {
			f.initEditor(), f.getEl(), f.el[j].value = ""
		},
		initUeditor: function(c) {
			var d = new c({
				target: i,
				autoFocus: !0,
				enableInsertCode: !0,
				toolbars: ["FullScreen", "Bold", "Underline", "StrikeThrough", "|", "JustifyLeft", "JustifyCenter", "JustifyRight", "|", "InsertOrderedList", "InsertUnorderedList", "BlockQuote", "|", "image", "Link", "Unlink", "|", "PageBreak", "|", "Source", "Code", "|", "Intro"]
			});
			try {
				d.editor.addListener("fullscreenchanged", function(c, d) {
					if (!d) try {
						b.css("#pb-sync-holder", {
							position: "relative"
						});
						var f = "sy_" + ENV.userId;
						a.Cookie.get(f) || b.show("#sync-tmp-notice")
					} catch (e) {} else try {
						b.css("#pb-sync-holder", {
							position: "static"
						}), b.hide("#sync-tmp-notice")
					} catch (e) {}
				})
			} catch (e) {}
			f.editor = d.editor
		},
		getEl: function() {
			f.el[j] = g(j), f.el[i] = g(i)
		},
		clearValue: function() {
			f.el[j].value = "";
			try {
				f.editor.setData("")
			} catch (a) {}
		},
		reloadCheck: function() {
			return !f.el[j].value && (!f.editor || !f.editor.hasContents()) ? !0 : !1
		},
		doSubmit: function(b) {
			var d = f.editor,
				e, g = f.el[j].value;
			return e = f.getEditorData(b, !0), !g && !e ? (!0 !== b && c.alert("\u6807\u9898 \u6216 \u5185\u5bb9 \u81f3\u5c11\u8981\u586b\u5199\u4e00\u9879"), !1) : a.mix({
				title: g
			}, e)
		},
		initEdit: function() {
			var a = f.editPostData,
				b = a.postType,
				c, e;
			b == "text" ? (c = d.unEscapeHTML(a.contents[0].title), e = f.getEditPostData()) : (c = a.contents[0].microtext, e = "");
			try {
				f.editor.setData(e)
			} catch (g) {}
			f.el[j].value = c
		},
		initReblog: function() {
			var a = f.reblogData,
				b = a.postType,
				c, e;
			b == "text" ? (c = d.unEscapeHTML(a.contents[0].title), e = a.contents[0].text) : (c = a.contents[0].microtext, e = "");
			try {
				var g = f.editor;
				g.setData(d.REBLOG_PREFIX + e + d.REBLOG_POSTFIX)
			} catch (h) {}
			f.el[j].value = c
		}
	}, d.markdown.__init(f), d[e] = f, d.currentType = e, d
}, {
	requires: ["dom", "util.$7202", "./common.$7252"]
});