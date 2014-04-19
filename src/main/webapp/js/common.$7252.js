KISSY.add("lib/editor", function(a) {
	function b(a, b) {
		a == "markdown" ? KISSY.use("lib/markdown/editor.$7202,app/publisher/plugins/markdown.$7202", function(c, d, e) {
			b(d, a, e)
		}) : KISSY.use("lib/ueditor.$7202", function(c, d) {
			b(d, a)
		})
	}
	return b
}), KISSY.add("app/publisher/plugins/markdown", function(a, b, c, d) {
	var e = {
		text: ["text", "content"],
		photo: ["desc", "desc"],
		audio: ["comment", "comment"],
		useraudio: ["comment", "comment"],
		video: ["content", "content"],
		uservideo: ["content", "content"],
		link: ["desc", "desc"]
	},
		f = function(a) {
			return h.usingMarkdown() ? a.replace(/./, function(a) {
				return "markdown" + a.toUpperCase()
			}) : a
		},
		g = function(a) {
			var b = this;
			c.on(this, "editorInitOk", function() {
				a.call(b)
			})
		},
		h = {
			__init: function(a) {
				var b = this;
				for (var c in b) this.hasOwnProperty(c) && (c.match(/^_/) || (a[c] ? a[c] = function() {
					var d = a[c],
						e = b[c];
					return function() {
						e.call(a, d)
					}
				}() : a[c] = b[c]))
			},
			initEdit: g,
			initReblog: g,
			initBookmarkLet: g,
			initEditor: function(b, e) {
				var f = this,
					b = b || {};
				f.usingMarkdown() ? d("markdown", function(d) {
					d.init(a.mix({
						target: f.editorTarget
					}, b)), f.editor = d, e && e.call(f), setTimeout(function() {
						c.fire(f, "editorInitOk", {
							context: f.editor
						})
					}, 0)
				}) : d("ueditor", function(a) {
					f.initUeditor(a), e && e.call(f), setTimeout(function() {
						c.fire(f, "editorInitOk", {
							context: f.editor
						})
					}, 0)
				})
			},
			usingMarkdown: function() {
				var a = this;
				return typeof a.markdown != "undefined" ? a.markdown : (a.markdown = ENV.usingMarkdown, a.markdown)
			},
			getEditPostData: function() {
				var a = this,
					b;
				switch (a.type) {
				case "photo":
					b = a.editPostData;
					break;
				default:
					b = a.editPostData.contents[0]
				}
				return b[f(e[a.type][0])]
			},
			getEditorData: function(a, c) {
				var d, g = this,
					h = {};
				try {
					g.usingMarkdown() ? d = g.editor.getData() : (g.editor.queryCommandState("source") == 1 && !a && g.editor.execCommand("Source"), d = g.parent.processRichData(g.editor.getData()))
				} catch (i) {
					d = b.val(g.editorTarget)
				}
				return c && !d ? !1 : (h[f(e[g.type][1])] = d || "", h)
			}
		};
	return h
}, {
	requires: ["dom", "event", "lib/editor.$7202"]
}), KISSY.add("app/publisher/common", function(a, b, c, d, e, f, g, h, i, j) {
	var k = "text",
		l = "photo",
		m = "audio",
		n = "video",
		o = "link",
		p = "useraudio",
		q = "uservideo",
		r = b.get,
		s = c.on,
		t, u = ",",
		v = "\uff0c",
		w = "\u6dfb\u52a0\u6807\u7b7e\uff0c\u7528\u9017\u53f7\u6216\u56de\u8f66\u5206\u9694",
		x = "\u8fd8\u6709\u4e00\u4e9b\u5185\u5bb9\u5c1a\u672a\u53d1\u5e03\uff0c\u786e\u5b9a\u53d6\u6d88\u5417\uff1f\u672a\u4fdd\u5b58\u7684\u6570\u636e\u4f1a\u4e22\u5931\uff01",
		y = "#post-tag-list",
		z = "#post-tag",
		A = "#post-tag-input",
		B = "#top-post-holder",
		C = "#post-to-select-aside",
		D = "#post-privacy-select",
		E = "pb-submit",
		F = "pb-preview",
		G = "pb-cancel",
		H = "pb-draft",
		I = "#pb-submiting-tip",
		J = "#pb-top-post",
		K = "#sync-to-weibo-holder",
		L = "#pb-sync-to-weibo",
		M = "#sync-to-qqweibo-holder",
		N = "#pb-sync-to-qqweibo",
		O = "#sync-to-douban-holder",
		P = "#pb-sync-to-douban",
		Q = "#sync-to-qzone-holder",
		R = "#pb-sync-to-qzone",
		S = "#sync-to-renren-holder",
		T = "#pb-sync-to-renren",
		U = "#sync-to-facebook-holder",
		V = "#pb-sync-to-facebook",
		W = "#sync-to-twitter-holder",
		X = "#pb-sync-to-twitter",
		Y = "#sync-to-flickr-holder",
		Z = "#pb-sync-to-flickr",
		$ = "#pb-set-private-holder",
		_ = "#pb-set-private",
		ab = "#post-by-timer-holder",
		bb = "#post-timer-date",
		cb = "#post-timer-hour",
		db = "#post-timer-minutes",
		eb = "#permallink",
		fb = "permallink",
		gb = "#pb-no-sync-holder",
		hb = "#pb-no-sync",
		ib = "#pb-sync-reject",
		jb = "#pb-share-tip-close",
		kb = !1,
		lb = !1,
		mb = [],
		nb = !1,
		ob, pb, qb = ENV.blogUrl,
		rb = function(a) {
			return a > 9 ? a : "0" + a
		},
		sb = function(b, c) {
			return b.getFullYear() ? (c = c || "{y}/{m}/{d}", a.substitute(c, {
				y: b.getFullYear(),
				m: rb(b.getMonth() + 1),
				d: rb(b.getDate())
			})) : ""
		},
		tb = 0,
		ub = 0,
		t = {
			TEXT: k,
			PHOTO: l,
			AUDIO: m,
			VIDEO: n,
			LINK: o,
			USERAUDIO: p,
			USERVIDEO: q,
			REBLOG_PREFIX: "<p><br/></p>",
			REBLOG_POSTFIX: "<p><br/></p>",
			el: {},
			init: function(a, c, d) {
				a && (t.dataSource = a, b[t.dataSource.length == 1 ? "hide" : "show"]("#post-to-aside-holder")), c && (t.privacySource = c), d && (t.isBookmarklet = d), f.init("#pb-action-holder"), f.init("#permalink-holder"), t.topPostBlog = b.attr(B, "default"), t.getEl(), t.initPermalink(), t.initPublisherSelect(), t.initPrivacySelect(), t.initTag(), t.bindEvent(), t.isSync(), t.renderNoSync(), t.initPrivacyBlog(), t.initAdvTip(), i.init(t)
			},
			initAdvTip: function() {
				if (!t.el[jb]) return;
				var a = (h.get("sharetipclose") || "000").split(""),
					d = -1;
				a[1] = a[1] || "0", a[2] = a[2] || "0";
				for (var e = 0, f = a.length; e < f; e++) if (a[e] === "0") {
					b.show("#pb-share-tip-" + e), d = e;
					break
				}
				d != -1 && (d != 2 && b.show(t.el[jb].parentNode), c.on(t.el[jb], "click", function(c) {
					a[d] = 1, h.set("sharetipclose", a.join(""), new Date(2999, 1, 1), "", "/"), b.hide(this.parentNode), c.halt()
				})), c.on(t, "ShowPhotoTip", function() {
					if (a[2] == 1) return;
					b.hide("#pb-share-tip-" + d), b.show("#pb-share-tip-2"), b.show(t.el[jb].parentNode)
				})
			},
			initPermalink: function() {
				if (!t.el[fb]) return;
				var a = t.currentType,
					b = t[a].editPostData,
					c = "",
					d = "post/" + sb(new Date, "{y}-{m}-{d}") + "/abcdefg";
				b && b.uri && (c = b.uri), t.el[fb].setValue(c || d), t.el[fb]._default_value = d
			},
			getEl: function() {
				t.el[y] = r(y), t.el[z] = r(z), t.el[A] = r(A), t.el[C] = r(C), t.el[D] = r(D), t.el[E] = f.get(E).main, t.el[F] = f.get(F).main, t.el[H] = f.get(H), t.el[I] = r(I), t.el[J] = r(J), t.el[K] = r(K), t.el[L] = r(L), t.el[M] = r(M), t.el[N] = r(N), t.el[O] = r(O), t.el[P] = r(P), t.el[Q] = r(Q), t.el[R] = r(R), t.el[T] = r(T), t.el[S] = r(S), t.el[V] = r(V), t.el[U] = r(U), t.el[X] = r(X), t.el[W] = r(W), t.el[Z] = r(Z), t.el[Y] = r(Y), t.el[B] = r(B), t.el[_] = r(_), t.el[$] = r($), t.el[ab] = r(ab), t.el[bb] = r(bb), t.el[cb] = r(cb), t.el[db] = r(db), t.el[fb] = f.get(fb), t.el[eb] = r(eb), t.el[hb] = r(hb), t.el[gb] = r(gb), t.el[ib] = r(ib), t.el[jb] = r(jb)
			},
			bindEvent: function() {
				var a = r(C),
					d = r(D);
				s(t.el[E], "click", function() {
					t.submit()
				}), s(t.el[_], "click", function() {
					t._changeDraftStatus()
				}), s(b.query("a", "#pb-sync-holder"), "click", function(a) {
					b.toggleClass(this, "on"), a.halt()
				}), s(ENV, "weibo2long::submit", function(a) {
					t.submit("weibo2long", a.extraData)
				});
				if (t.el[fb]) {
					function g() {
						function a(a, b, c) {
							if (typeof a.selectionStart != "undefined") a.selectionStart = b, a.selectionEnd = c;
							else if (document.selection && document.selection.createRange) {
								a.focus(), a.select();
								var d = document.selection.createRange();
								d.collapse(!0), d.moveEnd("character", c), d.moveStart("character", b), d.select()
							}
						}
						if (this.value == t.el[fb]._default_value) {
							var b = this.value.length;
							a(this, b - 7, b), c.remove(t.el[fb].main, "click", g)
						}
					}
					s(t.el[fb].main, "click", g), s(t.el[fb].main, "focus", function() {
						b.addClass(t.el[eb], "permallink-hover")
					}), s(t.el[fb].main, "blur", function() {
						s(t.el[fb].main, "click", g), b.removeClass(t.el[eb], "permallink-hover")
					})
				}
				t.el[H] && t.el[H].on("click", function() {
					t.submit("draft")
				}), s(document, "keyup", function(a) {
					a.ctrlKey && a.keyCode == "13" && t.submit()
				}), s("#pb-sync-holder", "mouseover mouseleave", function(a) {
					b.css("#pb-sync-tip", {
						visibility: a.type == "mouseover" ? "visible" : "hidden"
					})
				});
				if ("submit" === ENV.contribute) {
					window.onbeforeunload = function() {
						var a = t.currentType;
						if (!a) return;
						if (t[a].reloadCheck()) return;
						return "\u8fd8\u6709\u4e00\u4e9b\u5185\u5bb9\u5c1a\u672a\u53d1\u5e03\uff0c\u786e\u5b9a\u53d6\u6d88\u5417\uff1f\u672a\u4fdd\u5b58\u7684\u6570\u636e\u4f1a\u4e22\u5931\uff01"
					}, s("#J_SubmitType, #J-SubTab a", "click", function(a) {
						var c = a.target,
							d;
						"A" === c.nodeName && (value = b.attr(c, "data-value"), location.href = e.url.host + "/submit/iframe/" + ENV.blogUrl + "/" + value)
					});
					return
				}
				f.get(F).on("click", function() {
					t.preview()
				}), f.get(G).on("click", function() {
					t.cancel()
				}), a && c.add(t.postToSelect, "change", function() {
					var a = t.postToSelect.getValue();
					ENV.blogUrl != a && (ENV.blogUrl = a, t.initBlogMoreInfo()), t.renderPrivacySelectByPostTo(), t.isSync(), t.renderNoSync(), e.Dispatcher.fire("navActiveChange", {
						activeItem: "blogUrl:" + a
					})
				}), d && c.on(t.privacySelect, "change", function() {
					t.renderPrivacySelect()
				}), t.el[gb] && (c.on(t.el[ib], "click", function(a) {
					window.confirm("\u786e\u8ba4\u4e0d\u60f3\u7ed1\u5b9a\uff1f\u4f60\u4ee5\u540e\u53ef\u4ee5\u5728\u535a\u5ba2\u8bbe\u7f6e\u5185\u627e\u5230\u7ed1\u5b9a\u5165\u53e3") && (h.set(t.postToSelect.getValue() + "_sync_reject", "1", new Date(2999, 1, 1), "", "/"), b.hide(t.el[gb])), a.halt()
				}), c.on(b.get(".pb-mod", t.el[gb]), "mouseenter mouseleave", function(a) {
					b[a.type == "mouseenter" ? "show" : "hide"](t.el[ib])
				}))
			},
			renderSubmitButtonText: function(a) {
				function d(a) {
					var d = b[a];
					d || (d = b["default"]), d = d.split("|"), c.setContent(d[0]), c.setWidth(d[1])
				}
				a = a || t.privacySelect.getValue();
				var b = {
					draft: "\u4fdd\u5b58\u8349\u7a3f|96",
					queue: "\u52a0\u5165\u81ea\u52a8\u53d1\u5e03\u5217\u8868|140",
					timer: "\u5b9a\u65f6\u53d1\u5e03|96",
					"default": "\u53d1\u5e03|70"
				},
					c = f.get(E);
				d(a)
			},
			_renderSelect: function(d) {
				function i() {
					return b.query(".blog-name", h)
				}
				function j() {
					var c = d.width;
					a.each(i(), function(a) {
						b.css(a, {
							width: c - 70
						})
					}), b.css(e, {
						width: c
					}), b.css(b.get(".blog-name", e), {
						width: c - 70
					}), b.css(h, {
						width: c - 22
					})
				}
				var e = b.get(d.container),
					g = f.create("ComboBox", {
						id: d.id,
						datasource: d.dataSource,
						height: d.height,
						skin: d.skin,
						enableScroll: d.scroll,
						value: KISSY.DOM.attr(e, "default") || "0"
					});
				g.appendTo(e);
				var h = g.getLayer().main;
				return j(), c.add(g, "changeafter", j), c.add(g, "renderafter", j), g
			},
			renderNoSync: function() {
				if (!t.el[gb] || !t.postToSelect) return;
				var a = "1" === t.dataSource[t.postToSelect.selectedIndex].isPrivace,
					c = b.get("#pb-sync-holder").style.display != "none";
				if (a || c) b.hide(t.el[gb]);
				else {
					var d = t.postToSelect.getValue();
					h.get(d + "_sync_reject") ? b.hide(t.el[gb]) : (t.el[hb].href = "/dianlog/" + d + "/settings/#sync", b.show(t.el[gb]))
				}
			},
			initPublisherSelect: function() {
				!t.el[C] || (t.postToSelect = t._renderSelect({
					id: "publisher-menu",
					container: t.el[C],
					dataSource: t.dataSource,
					width: 200,
					height: 450,
					skin: "publisher",
					scroll: !0
				}), e.Dispatcher.fire("navActiveChange", {
					activeItem: "blogUrl:" + t.postToSelect.getValue()
				}))
			},
			initPrivacySelect: function() {
				!t.el[D] || (t.privacySelect = t._renderSelect({
					id: "privacy-menu",
					container: t.el[D],
					dataSource: t.privacySource,
					width: 200,
					skin: "privacy"
				}), t.privacySource.length < 2 && b.hide(t.el[D]))
			},
			initTag: function() {
				function e() {
					var b = new RegExp("[" + u + "|" + v + "]", "g"),
						c = t.el[A].value.replace(b, "");
					t.addTag(c), setTimeout(function() {
						a.value = ""
					}, 1)
				}
				function f(a) {
					var c = t.el[A].value;
					if ( !! c) return;
					var d = b.children(t.el[y], "li"),
						e = d.length,
						f = d[e - 1];
					b.remove(f)
				}
				var a = t.el[A],
					c = t.el[y],
					d = location.search;
				if (!a) return;
				s(t.el[z], "click", function() {
					a.focus()
				}), s(a, "keyup", function(b) {
					var c = b.keyCode,
						d = a.value,
						f = new RegExp("[" + u + v + "]$");
					if (c == "13" && !b.ctrlKey || c == "188" && !b.shiftKey || f.test(d)) b.halt(), e()
				}), s(a, "paste", function(b) {
					setTimeout(function() {
						var b = a.value,
							c = new RegExp(v, "g"),
							d = b.replace(c, u).split(u);
						d.length > 1 && (t.addTags(d), a.value = "")
					}, 1)
				}), s(a, "keydown", function(b) {
					var c = b.keyCode,
						d = a.value;
					c == "8" && (d || f())
				}), s(c, "click", function(a) {
					var c = a.target;
					if (b.hasClass(c, "delete-tag-btn")) {
						var d = b.parent(c, "li");
						b.remove(d), a.halt()
					}
				}), s(a, "keyup", function(b) {
					!a.timer || clearTimeout(a.timer);
					if (!a.value) return;
					a.timer = setTimeout(function() {
						e()
					}, 4e3)
				}), s(a, "blur", function(a) {
					e()
				}), !a.value && t.getTags().length == 0 && (a.value = w, b.addClass(a, "pb-tag-tip")), s(a, "focus", function() {
					a.value == w && (a.value = "", b.removeClass(a, "pb-tag-tip"))
				});
				if ( !! d) {
					d = KISSY.unparam(d.replace(/^\?/, ""));
					if (d.initTags) {
						var g = decodeURIComponent(d.initTags).split("|");
						t.addTags(g)
					}
				}
				t.initBlogMoreInfo()
			},
			initPrivacyBlog: function() {
				if (!t.el[C] || kb) return;
				a.each(t.privacySelect.getOptions(), function(a) {
					mb.push(a)
				}), kb = !0, t.renderPrivacySelectByPostTo()
			},
			renderPrivacySelectByPostTo: function() {
				if (!t.postToSelect) return;
				var a = t.currentType,
					b = t[a].editPostData,
					c;
				b && (c = b.privacy == "2"), t.el[_].checked = c
			},
			renderPrivacySelect: function() {
				var a = t.privacySelect.getValue();
				a == "timer" ? t.initPostByTimer() : b.hide(ab), t._changeDraftStatus(), t.renderSubmitButtonText()
			},
			initPostByTimer: function(a) {
				var d = t.el[ab],
					e = t.el[bb],
					f = t.el[cb],
					g = t.el[db],
					a = parseInt(a, 10),
					h = b.get(".arrow", d),
					i = new Date(a || (new Date).getTime() + 72e5);
				nb || (c.on(e.parentNode, "click", function(a) {
					KISSY.use("calendar", function(a, f) {
						c.remove(e.parentNode, "click");
						var g = (new f(d, {
							popup: !0,
							closable: !0,
							navigator: !1,
							date: i,
							minDate: new Date
						})).on("select", function(a) {
							var b = sb(a.date);
							b && (e.value = b)
						}).on("show", function(a) {
							b.addClass(h, "on")
						}).on("hide", function(a) {
							b.removeClass(h, "on")
						});
						c.on(h, "click", function(a) {
							g.toggle(), a.halt()
						}), c.on(e, "click focus", function(a) {
							g.show(), a.halt()
						}), g.show()
					}), a.halt()
				}), c.on([f, g], "click", function(a) {
					this.focus(), this.select()
				}), nb = !0), e.value || (e.value = sb(i));
				if (!f.value || !g.value) f.value = rb(i.getHours()), g.value = rb(i.getMinutes());
				b.show(d)
			},
			initBlogMoreInfo: function() {
				var b = {
					tagFreqs: t.initRecommandTag,
					postCount: t.initTagGuide,
					hasTop: t.initTop
				};
				d.get(e.url.host + "/dianlog/" + ENV.blogUrl + "/blogMoreInfos", function(d) {
					a.each(b, function(b, c) {
						c in d && a.isFunction(b) && b(d[c])
					}), c.fire(t, "postCc:setValue", {
						enable: !! d.ccEnable,
						value: d.ccType
					}), c.fire(t, "fix:refresh")
				})
			},
			initTop: function(a) {
				function c(a) {
					b[a](B), t.el[$] || b[a]("#top-queue-holder")
				}
				function d() {
					c(a ? "hide" : "show"), t.el[J].checked = !1
				}
				if (t.topPostBlog && t.postToSelect) {
					var e = t.postToSelect.getValue();
					e == t.topPostBlog ? (c("show"), t.el[J].checked = !0) : d()
				} else d()
			},
			initTagGuide: function(c) {
				var d, f, g, h, i, j, k;
				c > 1 && c < 4 && (t._tagTips || (b.addStyleSheet(".pb-tag-tips-wrapper { position: absolute;margin-left:5px; width: 195px;background:url(" + e.url.staticHost + "/img/icon/pub-guide-tip.$6272.png) no-repeat; }" + ".pb-tag-tips { padding:5px 12px 10px; color: #beb56c;}" + ".pb-tag-tips .tips-action { text-align: right;margin:0 10px; }" + ".tips-content {line-height:23px;}" + ".pb-tag-tips .tips-action span{color:#69664d;}" + ".pb-tag-tips .tips-action .action-content { border-bottom: 1px solid #69664d; cursor: pointer;}" + ""), d = b.create('<div class="pb-tag-tips-wrapper"><div class="pb-tag-tips"><p id="J_TagTipsContent" class="tips-content">\u7528\u9017\u53f7\u6216\u56de\u8f66\u5206\u9694\u6807\u7b7e</p><p class="tips-action"><span id="J_TagTipsActionContent" class="action-content">\u6682\u65f6\u4e0d\u52a0\uff0c\u76f4\u63a5\u53d1\u5e03&gt;</span></p></div><s class="pb-tag-tips-triangle-outer"></s><s class="pb-tag-tips-triangle-inner"></s></div>'), b.hide(d), b.insertAfter(d, "#post-tag-holder"), f = a.get("#J_TagTipsContent"), g = a.get("#J_TagTipsActionContent"), g.onclick = function() {
					this.innerHTML = "\u6b63\u5728\u4fdd\u5b58...", b.css(this, {
						cursor: "default",
						borderBottom: "none"
					}), t.submit()
				}, i = a.get(A), j = a.get(y), k = j.getElementsByTagName("li"), s(i, "focus", function() {
					h.setContent("\u7528\u9017\u53f7\u6216\u56de\u8f66\u5206\u9694\u6807\u7b7e"), h.setToDefaultAction()
				}), s(i, "keyup", function() {
					setTimeout(function() {
						k.length > 0 ? h.setAction("\u53d1\u5e03") : h.setToDefaultAction()
					}, 0)
				}), h = t._tagTips = {
					_isShown: !1,
					toggle: function(a) {
						undefined === a ? (b.toggle(d), t._tagTips._isShown = !t._tagTips._isShown) : (a ? b.show(d) : b.hide(d), t._tagTips._isShown = !! a)
					},
					setZIndex: function(a) {
						b.css(d, "zIndex", a)
					},
					setContent: function(a) {
						f.innerHTML = a
					},
					setAction: function(a) {
						g.innerHTML = a
					},
					setToDefaultAction: function() {
						var a = g.innerHTML;
						return function() {
							g.innerHTML = a
						}
					}()
				}))
			},
			initRecommandTag: function(c) {
				alert("init");
				function j(a) {
					var c = a.target,
						d;
					c.tagName.toLowerCase() != "li" && (c = b.parent(c, "li"));
					if (!c) return;
					d = decodeURIComponent(b.attr(c, "tag")), t.addTag(d)
				}
				var d = r("#recommand-tag-holder"),
					e = r("#recommand-tag-list"),
					f, g = 0,
					h = [];
				if (!e || !c) return;
				if (0 === (f = c.length)) {
					b.hide(d);
					return
				}
				for (; g < f; g++) g < 5 && h.push('<li tag="' + encodeURIComponent(c[g].tagContent) + '"><span>' + a.escapeHTML(c[g].tagContent) + "</span></li>");
				e.innerHTML = h.join("");
				if (f > 5) {
					if (!r("#tags-more")) {
						var i = b.create('<span class="tags-more" id="tags-more">\u66f4\u591a..</span>');
						b.append(i, d)
					}
					s("#tags-more", "click", function() {
						for (g = 5; g < f; g++) h.push('<li tag="' + encodeURIComponent(c[g].tagContent) + '"><span>' + a.escapeHTML(c[g].tagContent) + "</span></li>");
						e.innerHTML = h.join(""), b.remove("#tags-more")
					})
				}
				b.show(d), t._recommandTagsInited || (s(e, "click", j), t._recommandTagsInited = !0)
			},
			isSync: function() {
				if (ENV.isContribute) return;
				var a, c = !1;
				t.el[C] ? (a = t.postToSelect.getValue(), c = "1" === t.dataSource[t.postToSelect.selectedIndex].isPrivace) : a = ENV.blogUrl;
				if (a == ob && t.el[_].checked == pb) return;
				if (t.el[_].checked || c) b.hide(t.el[K]), b.hide(t.el[M]), b.hide(t.el[O]), b.hide(t.el[Q]), b.hide(t.el[S]), b.hide(t.el[U]), b.hide(t.el[W]), b.hide(t.el[Y]), b.hide("#pb-sync-holder");
				else {
					var d = a == ob;
					t.isDoubanSync(d), t.isQqSync(d), t.isSinaSync(d), t.isQzoneSync(d), t.isRenrenSync(d), t.isFacebookSync(d), t.isTwitterSync(d), t.isFlickrSync(d), !t._syncSina && !t._syncQq && !t._syncDouban && !t._syncQzone && !t._syncRenren && !t._syncFacebook && !t._syncTwitter && !t._syncFlickr ? b.hide("#pb-sync-holder") : b.show("#pb-sync-holder")
				}
				ob = a, pb = t.el[_].checked
			},
			isSinaSync: function(a) {
				if (!ENV.weibo) return;
				if (!ENV.weibo[ENV.blogUrl]) b.hide(t.el[K]), t._syncSina = !1;
				else {
					b.show(t.el[K]), t._syncSina = !0;
					if (!a) {
						var c = !0,
							d = t.postToSelect,
							e = d ? d.getValue() : qb;
						e == qb && ENV.syncStatus && (c = ENV.syncStatus.weibo), b[c ? "addClass" : "removeClass"](t.el[L], "on")
					}
				}
				return t._syncSina
			},
			isQqSync: function(a) {
				if (!ENV.qqWeibo) return;
				if (!ENV.qqWeibo[ENV.blogUrl]) b.hide(t.el[M]), t._syncQq = !1;
				else {
					b.show(t.el[M]), t._syncQq = !0;
					if (!a) {
						var c = !0,
							d = t.postToSelect,
							e = d ? d.getValue() : qb;
						e == qb && ENV.syncStatus && (c = ENV.syncStatus.qqweibo), b[c ? "addClass" : "removeClass"](t.el[N], "on")
					}
				}
				return t._syncQq
			},
			isDoubanSync: function(a) {
				if (!ENV.douban) return;
				if (!ENV.douban[ENV.blogUrl]) b.hide(t.el[O]), t._syncDouban = !1;
				else {
					b.show(t.el[O]), t._syncDouban = !0;
					if (!a) {
						var c = !0,
							d = t.postToSelect,
							e = d ? d.getValue() : qb;
						e == qb && ENV.syncStatus && (c = ENV.syncStatus.douban), b[c ? "addClass" : "removeClass"](t.el[P], "on")
					}
				}
				return t._syncDouban
			},
			isQzoneSync: function(a) {
				if (!ENV.qzone) return;
				if (!ENV.qzone[ENV.blogUrl]) b.hide(t.el[Q]), t._syncQzone = !1;
				else {
					b.show(t.el[Q]), t._syncQzone = !0;
					if (!a) {
						var c = !0,
							d = t.postToSelect,
							e = d ? d.getValue() : qb;
						e == qb && ENV.syncStatus && (c = ENV.syncStatus.qzone), b[c ? "addClass" : "removeClass"](t.el[R], "on")
					}
				}
				return t._syncQzone
			},
			isRenrenSync: function(a) {
				if (!ENV.renren) return;
				if (!ENV.renren[ENV.blogUrl]) b.hide(t.el[S]), t._syncRenren = !1;
				else {
					b.show(t.el[S]), t._syncRenren = !0;
					if (!a) {
						var c = !0,
							d = t.postToSelect,
							e = d ? d.getValue() : qb;
						e == qb && ENV.syncStatus && (c = ENV.syncStatus.renren), b[c ? "addClass" : "removeClass"](t.el[T], "on")
					}
				}
				return t._syncRenren
			},
			isFacebookSync: function(a) {
				if (!ENV.facebook) return;
				if (!ENV.facebook[ENV.blogUrl]) b.hide(t.el[U]), t._syncFacebook = !1;
				else {
					b.show(t.el[U]), t._syncFacebook = !0;
					if (!a) {
						var c = !0,
							d = t.postToSelect,
							e = d ? d.getValue() : qb;
						e == qb && ENV.syncStatus && (c = ENV.syncStatus.facebook), b[c ? "addClass" : "removeClass"](t.el[V], "on")
					}
				}
				return t._syncFacebook
			},
			isTwitterSync: function(a) {
				if (!ENV.twitter) return;
				if (!ENV.twitter[ENV.blogUrl]) b.hide(t.el[W]), t._syncTwitter = !1;
				else {
					b.show(t.el[W]), t._syncTwitter = !0;
					if (!a) {
						var c = !0,
							d = t.postToSelect,
							e = d ? d.getValue() : qb;
						e == qb && ENV.syncStatus && (c = ENV.syncStatus.twitter), b[c ? "addClass" : "removeClass"](t.el[X], "on")
					}
				}
				return t._syncTwitter
			},
			isFlickrSync: function(a) {
				if (!ENV.flickr) return;
				if (!ENV.flickr[ENV.blogUrl]) b.hide(t.el[Y]), t._syncFlickr = !1;
				else {
					b.show(t.el[Y]), t._syncFlickr = !0;
					if (!a) {
						var c = !0,
							d = t.postToSelect,
							e = d ? d.getValue() : qb;
						e == qb && ENV.syncStatus && (c = ENV.syncStatus.flickr), b[c ? "addClass" : "removeClass"](t.el[Z], "on")
					}
				}
				return t._syncFlickr
			},
			addTag: function(a) {
				t.addTags([a])
			},
			addTags: function(c) {
				if (!t.el[y]) return;
				var d, e = c.length,
					f = 0,
					g = [],
					h;
				for (; f < e; f++) {
					d = a.trim(t.unEscapeHTML(c[f])), d = d.replace(/^#+/, "").replace(/#+$/, "");
					if (!d) continue;
					try {
						h = '<li tag="' + encodeURIComponent(d) + '"><span>' + a.escapeHTML(d) + '</span><a title="\u5220\u9664" class="delete-tag-btn">x</a></li>', g.push(h)
					} catch (i) {}
				}
				b.appendHtml(t.el[y], g.join("")), b.css(t.el[y], {
					zoom: 1
				})
			},
			setTags: function(a) {
				if (!t.el[y]) return;
				t.el[y].innerHTML = "", t.addTags(a)
			},
			getTags: function() {
				if ("submit" == ENV.contribute) {
					var c = [];
					return a.each(b.query("input", "#pb-submit-tag"), function(a, b) {
						a.checked && c.push(a.value)
					}), c
				}
				var d = t.el[y],
					e = b.children(d, "li"),
					c = [],
					f, g = e.length,
					h = 0;
				for (; h < g; h++) f = e[h], f = b.attr(f, "tag"), f = decodeURIComponent(f), c.push(f);
				return c
			},
			preview: function() {
				t.submit("preview")
			},
			weiboOauth: function(a) {
				function g() {
					e.enableDom(), b.remove("#oauth-tip"), lb = !0
				}
				function h() {
					d({
						type: "post",
						url: "http://www.diandian.com/sinaweibo/deauthorize/" + a,
						success: function() {}
					})
				}
				function i() {
					s("#pb-sync-to-weibo", "click", function() {
						var c = "http://www.diandian.com/",
							e = "sinaweibo/authorize/",
							f = "sinaweibo/check/",
							g;
						ub++, window.open(c + e + a, "\u65b0\u6d6a\u5fae\u535a\u91cd\u65b0\u6388\u6743"), ub <= 1 && (g = window.setInterval(function() {
							d({
								type: "post",
								url: c + f + a,
								success: function(a) {
									a.errCode == "1" && (window.clearInterval(g), b.addClass("#pb-sync-to-weibo", "on"), b.scrollIntoView("#pb-sync-to-weibo"))
								}
							})
						}, 2e3))
					})
				}
				var f = b.create('<div id="oauth-tip"><div id="oauth-tip-weibo">\u65b0\u6d6a\u5fae\u535a\u6388\u6743\u8fc7\u671f<br><a id="weiboblindlink" href="#">\u91cd\u65b0\u7ed1\u5b9a ></a></div><a id="oauth-tip-close" href="#" title="\u5173\u95ed">\u5173\u95ed</a></div>');
				b.append(f, "#pb-sync-holder"), e.disableDom({
					zIndex: 1e3
				}), b.css("#oauth-tip", {
					display: "block",
					zIndex: "1002"
				}), b.scrollIntoView("#oauth-tip"), s("#oauth-tip-close", "click", function() {
					g()
				}), s("#weiboblindlink", "click", function() {
					var e = "http://www.diandian.com/",
						f = "sinaweibo/authorize/",
						h = "sinaweibo/check/",
						i;
					tb++, window.open(e + f + a, "\u65b0\u6d6a\u5fae\u535a\u91cd\u65b0\u6388\u6743"), b.text(this, "\u8bbe\u7f6e\u4e2d"), tb == 1 && (i = window.setInterval(function() {
						d({
							type: "post",
							url: e + h + a,
							success: function(a) {
								a.errCode == "1" && (window.clearInterval(i), g(), b.text(this, "\u91cd\u65b0\u7ed1\u5b9a >"), c.detach("#pb-sync-to-weibo", "click"))
							}
						})
					}, 2e3))
				}), s("#oauth-tip-close", "click", function() {
					h(), g(), b.removeClass("#pb-sync-to-weibo", "on"), c.detach("#pb-sync-to-weibo", "click"), i()
				})
			},
			submit: function(f, g) {
				var h = t.privacySelect,
					j = t.el[E],
					k = h ? h.getValue() : "",
					l = f == "preview",
					m = f == "weibo2long",
					n = k == "queue",
					o = k == "timer",
					p = "",
					q = f == "draft" || k == "draft" || !! n || !! o,
					s = "autosave" === f,
					u = t.currentType,
					v = t[u].doSubmit(s),
					w = t.getTags().join(","),
					x = t.el[J],
					y, z, A, B, D = {},
					g = g || {};
				t.el[_] && t.el[_].checked ? k = 2 : k = 0;
				if (!v || !! t._submiting) return;
				if (o) {
					var F = a.trim(t.el[bb].value),
						G = a.trim(t.el[cb].value),
						H = a.trim(t.el[db].value),
						K = "";
					if (!F || !G || !H) K = "\u53d1\u5e03\u65f6\u95f4\u4e0d\u80fd\u4e3a\u7a7a";
					else {
						F = F.match(/^(\d+)[-|\/](\d+)[-|\/](\d+)$/);
						if (!F) K = "\u53d1\u5e03\u65f6\u95f4\u7684\u683c\u5f0f\u9519\u8bef\uff0c\u8bf7\u91cd\u65b0\u8f93\u5165";
						else {
							var M = (new Date(F[1], F[2] - 1, F[3], G, H)).getTime();
							M ? B = M : K = "\u53d1\u5e03\u65f6\u95f4\u7684\u683c\u5f0f\u9519\u8bef\uff0c\u8bf7\u91cd\u65b0\u8f93\u5165"
						}
					}
					if (K && !s) return e.alert(K)
				}
				t.el[fb] && (p = a.trim(t.el[fb].getValue()), p == t.el[fb]["_default_value"] && (p = ""), v.uri = p);
				if ( !! ENV.weiboBindExpire && !! ENV.weiboBindExpire[ENV.blogUrl] && !lb && b.hasClass("#pb-sync-to-weibo", "on")) {
					t.weiboOauth(ENV.blogUrl);
					return
				}
				if ((A = t._tagTips) && !A._isShown && !l && !q && !n && !o && !w && !s && !m) {
					b.css("#content", {
						position: "static"
					}), e.disableDom({
						zIndex: 1e3
					}), b.css("#post-tag-holder", {
						zIndex: 1002,
						position: "relative"
					}), b.addClass("#post-tag-holder", "guide"), A.setZIndex(1001), A.toggle(!0), b.scrollIntoView("#post-tag-holder");
					return
				}!t.el[C] || (y = t.postToSelect.value), a.mix(v, {
					tags: w,
					privacy: k
				}), !x || (x = x.checked ? !0 : !1, a.mix(v, {
					setTop: x
				})), i.postCc && a.mix(v, i.postCc.getData()), i.weibo2long && a.mix(v, i.weibo2long.getData());
				if (i.modifiedCreateTime) {
					var O = i.modifiedCreateTime.getData();
					if (typeof O != "string") a.mix(v, O);
					else if (!s) {
						e.alert(O);
						return
					}
				}
				"submit" === ENV.contribute ? (z = e.url.host + "/submit/post", v.blogUrl = ENV.blogUrl, v.type = u, e.Dispatcher.fire("post::submit")) : !t[u].editContribute || !q ? t[u].editContribute ? (z = e.url.host + "/contribute/publish?contributeId=" + t[u].editPostData.contributeId, y = ENV.blogUrl, D.submitType = "pubContribute") : !t[u].editDraft || !q ? t[u].editDraft ? (z = e.url.host + "/draft/publish", v.type = u, v.direct = !1, v.draftId = t[u].editPostData.draftId, v.newBlogUrl = y, D.submitType = "pubDraft") : t[u].editPostData && t[u].editPostData.postId ? (z = e.url.host + "/edit/" + t[u].editPostData.postId, v.feed_id = t[u].editPostData.postId, v.post_type = t[u].editPostData.postType == "microtext" ? "text" : t[u].editPostData.postType, v.blogUrl = y, D.submitType = "edit") : q ? (z = e.url.host + "/draft/create", v.type = u, v.blogUrl = y, D.submitType = "createDraft", n && (v.queue = "true"), o && (v.timer = B), t[u].reblogData && (v.reblog = !0, v.postId = t[u].reblogData.postId)) : t[u].reblogData ? (z = e.url.host + "/reblog/" + y + "/" + t[u].reblogData.postId, D.submitType = "reblog", e.Dispatcher.fire("post::reblog")) : (z = e.url.host + "/dianlog/" + y + "/new/" + u, D.submitType = "new", e.Dispatcher.fire("post::create")) : (z = e.url.host + "/draft/edit", v.type = u, v.draftId = t[u].editPostData.draftId, v.newBlogUrl = y, v.blogUrl = ENV.blogUrl, D.submitType = "editDraft", n && (v.queue = "true"), o && (v.timer = B)) : (z = e.url.host + "/draft/create", v.type = u, y = ENV.blogUrl, v.blogUrl = y, v.contributeId = t[u].editPostData.contributeId, D.submitType = "contributeToDraft", n && (v.queue = "true"), o && (v.timer = B));
				var Q = t.privacySelect && t.privacySelect.getValue() || "0",
					S = function(a) {
						var c = {
							weibo: L,
							qqWeibo: N,
							douban: P,
							qzone: R,
							renren: T,
							facebook: V,
							twitter: X,
							flickr: Z
						};
						return !!ENV[a] && !! ENV[a][y] && !! b.hasClass(t.el[c[a]], "on") && Q != "2"
					};
				v.syncToWeibo = S("weibo"), v.syncToQqWeibo = S("qqWeibo"), v.syncToDouban = S("douban"), v.syncToQzone = S("qzone"), v.syncToRenren = S("renren"), v.syncToFacebook = S("facebook"), v.syncToTwitter = S("twitter"), v.syncToFlickr = S("flickr");
				if (s) return t[u].reblogData && (v.reblog = !0, v.postId = t[u].reblogData.postId), v.type = u, y = ENV.blogUrl, v.blogUrl = y, v;
				ENV.autosaveId && (v.autoSaveId = ENV.autosaveId);
				if (l === !0) {
					var U = "publisherPreviewTempForm";
					r("#" + U) && b.remove("#" + U), z = "http://tpl.diandian.com/postpreview/" + y + "/new/" + u;
					var W = document.createElement("form"),
						Y, $;
					W.id = U, W.name = U, W.target = "diandianPostPreview", W.action = z, W.method = "post", W.style.display = "none";
					for (Y in v) v[Y].toString && v[Y].toString().indexOf("\n") != -1 ? $ = document.createElement("textarea") : $ = document.createElement("input"), $.name = Y, $.value = v[Y], W.appendChild($);
					document.body.appendChild(W), W.submit();
					return
				}!q || (ENV.redirectUrl = encodeURIComponent(e.url.host + "/draft/" + y), ENV.editDraft = !0);
				if ( !! n || !! o) ENV.redirectUrl = encodeURIComponent(e.url.host + "/queue/" + y);
				m || t.submiting();
				var ab = (new Date).getTime();
				if (u == "photo") var eb = setTimeout(function() {
					b.html(I, "\u6b63\u5728\u5904\u7406\u56fe\u7247\u4fe1\u606f..."), b.show(I)
				}, 5e3); !! t.__icodeObj && !! t.__icodeObj.submitCode && (v.icode = t.__icodeObj.submitCode), !! t.__icodeObj && !! t.__icodeObj.dialog && t.__icodeObj.dialog.destory(), t.__icodeObj = {}, m && (g.weibo2longUrl && (z = g.weibo2longUrl), a.mix(v, g), delete v.weibo2longUrl, c.fire(ENV, "weibo2long::beforeStart")), d({
					type: "post",
					url: z,
					data: v,
					success: function(a) {
						eb && clearTimeout(eb);
						try {
							if ( !! a.icode) {
								t._iCodeHandler(a);
								return
							}
						} catch (b) {}
						t.submitSuccess(a, f, g)
					},
					complete: function() {
						t._submiting = !1, b.hide(t.el[I]);
						try {
							var c = (new Date).getTime();
							a.mix(D, {
								time: c - ab,
								blogUrl: y ? y : "",
								type: u
							}), e.log("publishtime", D)
						} catch (d) {}
					},
					error: function() {
						e.alert("\u670d\u52a1\u5668\u6682\u65f6\u4e0d\u80fd\u5e2e\u4f60\u53d1\u5e03\u4fe1\u606f\uff0c\u8bf7\u7a0d\u5019\u518d\u8bd5\u3002"), b.removeClass(t.el[E], "disabled")
					}
				})
			},
			submiting: function() {
				t._submiting = !0, f.get(E).setDisabled(!0), b.show(t.el[I])
			},
			submitSuccess: function(a, g, i) {
				try {
					if (g == "weibo2long") {
						if (a.meta.code == 0) c.fire(ENV, "weibo2long::preview", {
							url: a.result.imageUrl
						});
						else if (a.meta.code == -31) {
							if (a.result.previewId) {
								function j() {
									d.post(i.weibo2longUrl, {
										previewId: a.result.previewId
									}, function(a) {
										a.meta.code == 0 ? c.fire(ENV, "weibo2long::preview", {
											url: a.result.imageUrl
										}) : setTimeout(j, 1e3)
									})
								}
								j()
							}
						} else c.fire(ENV, "weibo2long::afterEnd"), e.alert(a.meta.msg);
						return
					}
					if (a.errCode < 0) if (a.errCode == -30) {
						if (a.taskId) {
							function k() {
								d.get(e.url.host + "/dianlog/editor_task?id=" + a.taskId, function(a) {
									a.errCode == 0 ? t.submit(g) : setTimeout(k, 1e3)
								})
							}
							k()
						}
					} else f.get(E).setDisabled(!1), e.alert(a.result);
					else {
						if ("submit" === ENV.contribute) {
							window.onbeforeunload = null, t.el[I].innerHTML = "\u53d1\u5e03\u6210\u529f...", b.show(t.el[I]), b.hide("#pb-submit-main"), b.show("#submit-success-holder"), b.scrollIntoView("#pb-post-area"), setTimeout(function() {
								top.location.href = "http://" + (ENV.blogCName ? ENV.blogCName : ENV.blogUrl + "." + e.url.root)
							}, 5e3);
							return
						}
						t.el[I].innerHTML = "\u4fdd\u5b58\u6210\u529f...", b.show(t.el[I]), ENV.isNewPost && a.publisherAfterTipsPortlet && h.set("ppd", a.publisherAfterTipsPortlet, new Date(2999, 1, 1), "diandian.com", "/"), !a.postUrl || (ENV.redirectUrl = a.postUrl), window.onbeforeunload = null, t.redirect()
					}
				} catch (l) {
					t.el[I].innerHTML = "\u4fdd\u5b58\u6210\u529f...", b.show(t.el[I]), window.onbeforeunload = null, t.redirect()
				}
			},
			_changeDraftStatus: function() {
				var a = t.el[H],
					c = t.privacySelect.getValue();
				a && (a = a.main, c != 0 ? b.hide(a) : b.show(a)), t.isSync()
			},
			_iCodeHandler: function() {
				var a = t.__icodeObj;
				!a.dialog || (a.dialog.destory(), a.dialog = null), e.disableDom({
					zIndex: 1e3
				});
				var d = new e.Dialog({
					zIndex: 1001
				}),
					f = '<div><img src="' + e.url.host + "/icode/reblog?rnd=" + +(new Date) + '" style="float:left;cursor:pointer;" title="\u770b\u4e0d\u6e05\u695a?\u70b9\u51fb\u5237\u65b0\u9a8c\u8bc1\u7801" id="comment-icode-image">' + '<input type="text" class="simple-input-text" id="comment-icode-input" style="float:left;height:35px;margin-left:5px;width:100px;font-size:24px;">' + "</div>",
					g = '<span class="blue-button" id="comment-icode-submit" style="clear:both;float:right;">\u53d1\u5e03</span>';
				d.setSize({
					width: 300
				}), d.setTitle("\u8bf7\u8f93\u5165\u9a8c\u8bc1\u7801"), d.setContentHtml(f), d.setFooterHtml(g), d.show(), d.setPosition("center"), c.on("#comment-icode-submit", "click", function() {
					a.submitCode = b.get("#comment-icode-input").value, d.hide(), e.enableDom(), t.submit()
				}), c.on("#comment-icode-image", "click", function() {
					b.get("#comment-icode-image").src = "http://www.diandian.com/icode/reblog?rnd=" + (new Date).getTime()
				}), a.dialog = d, d.on("hide", function(a) {
					e.enableDom()
				})
			},
			clearValue: function() {
				var a = t.currentType;
				t[a].clearValue()
			},
			redirect: function() {
				var a, b = t.currentType;
				ENV.redirectUrl ? (a = decodeURIComponent(ENV.redirectUrl), (t[b].editPostData && t.el[C] && !ENV.editDraft || ENV.isUserVideo) && t.postToSelect && (ENV.autosavePost || ENV.isUserVideo ? a = a.replace(/\{\{blogUrl\}\}/, t.postToSelect.getValue()) : a = a.replace(t[b].editPostData.authorDomain, t.postToSelect.getValue()))) : !document.referrer || (a = document.referrer), !! a && a.indexOf("blogUrl") < 0 ? location.href = a : location.href = e.url.host
			},
			cancel: function() {
				var a = t.currentType,
					b;
				if (!a) return;
				if (t.isBookmarklet) {
					window.close();
					return
				}
				if (t[a].reloadCheck() || (!t[a].reloadCheck() || (b = ENV.autosaveId)) && confirm(x)) window.onbeforeunload = null, (b = ENV.autosaveId) ? d.post(e.url.host + "/autosave/delete", {
					action: "one",
					autoSaveId: b
				}, t.redirect) : ENV.beforeCancel ? ENV.beforeCancel(t.redirect) : t.redirect()
			},
			initEdit: function() {
				var a = t.currentType,
					b = t[a].editPostData,
					c = b.tags;
				!c || t.setTags(c), t.privacySelect && (t.privacySelect.getValue() == "timer" && t.initPostByTimer(b.timestamp), t.renderPrivacySelectByPostTo(), t.renderPrivacySelect()), t.isSync(), t[a].initEdit()
			},
			initContributeEdit: function() {
				var a = t.currentType;
				t[a].editContribute = !0, t.initEdit()
			},
			initDraftEdit: function() {
				var a = t.currentType;
				t[a].editDraft = !0, t.initEdit()
			},
			initReblog: function() {
				var a = t[t.currentType].reblogData.tags;
				!a || t.setTags(a), t[t.currentType].initReblog()
			},
			processRichData: function(a) {
				return a.replace(/[\t]/g, "").replace(/^<p([^>]*)>(&nbsp;)*<\/p>/, "").replace(/<p([^>]*)>(&nbsp;)*<\/p>\s*$/, "")
			},
			editorPasteFilter: function(a) {
				function c() {
					var a = arguments;
					return "<" + a[1] + a[3] + ">"
				}
				var b = /<(.*)style=['"]*([^'"]+)['"]*(.*)>/g;
				return a.replace(/<div/g, "<p").replace(/<\/div>/g, "</p>").replace(b, c)
			},
			unEscapeHTML: function(b) {
				var c = document.createElement("div");
				return c.innerHTML = b, b = c.innerHTML, a.unEscapeHTML(b)
			}
		};
	return t.markdown = j, t.markdown.parent = t, t
}, {
	requires: ["dom", "event", "ajax", "util.$7202", "sky.$6939", "sky/Dialog.$7202", "cookie", "app/publisher/pluginmanager.$7036", "app/publisher/plugins/markdown.$7252"]
});