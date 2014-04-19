KISSY.add("feed/core", function(a, b, c) {
	function p(a) {
		var b;
		return (b = a.id.match(k)) && b[1]
	}
	function q(a) {
		if (!(this instanceof q)) return new q(a);
		this.id = null, this.ele = a, this.offset = 0, this.collection = null, this._init()
	}
	function r(a, b) {
		if (!(this instanceof r)) return new r(a, b);
		this.container = a, this.config = b, this.viewportHeight = 0, this.feeds = [], this.feedsMap = {}, this._init() !== !1 && (this._initPlugins(), this.updateFeedList(!0), this.feeds.length > 0 && (this._basicWindowEventBinding(), this._feedEventBinding()));
		if ( !! b.lazyInit && !! this.Plugins.InfiniteLoad) {
			var c = this.feeds.length,
				d = this.feeds[c - 1];
			d && this.Plugins.InfiniteLoad.loadingMore(b.InfiniteLoad.api.replace(/\{\{feedId\}\}/, d.id))
		}
	}
	var d, e, f, g, h = ".",
		i = "feed",
		j = 95,
		k = /^feed-([\w\-]+)/i,
		l = "feedlist::update",
		m = "feed::",
		n = m + "viewinfoupdate",
		o = {
			mouseover: "mouseenter",
			mouseout: "mouseleave"
		};
	return a.augment(q, {
		_init: function() {
			var c = this.ele,
				d, e, f;
			return c ? (d = p(c)) ? (this.id = d, isNaN(e = parseInt(b.offset(c).top, 10)) ? (a.log("Invaild feed offset.", "error"), this) : (this.offset = e, (f = a.get(".J_FeedFooter", c)) ? this.footer = {
				ele: f,
				triangle: a.get(".J_FeedFooterTriangle", f),
				mods: {}
			} : a.log("Feed lacks footer element.", "info"), this)) : (a.log("Missing feed id.", "error"), this) : (a.log("Missing feed element.", "error"), this)
		},
		updateFooterTrianglePos: function() {
			var a = this.footer,
				c = a.currentMod,
				d, e, f, g = this.collection;
			if (!c) return;
			try {
				d = c.firePoint, e = b.offset(d).left, f = b.width(d)
			} catch (h) {}
			c.triangleOffset = e - g.leftOffset + f / 2 - j + 4, b.css(a.triangle, "left", c.triangleOffset + "px")
		},
		toggleFooter: function(a, c, d) {
			var e = this.footer,
				f = e.mods,
				g, h = this.collection,
				i = this.ele,
				k, l, m = !0,
				n, o, p;
			if (!(g = f[a])) {
				try {
					k = b.offset(c).left, l = b.width(c)
				} catch (q) {}
				p = d(e.ele), b.addClass(p, a), g = {
					shown: !1,
					triangleOffset: k - h.leftOffset + l / 2 - j + 4,
					firePoint: c,
					container: p
				}, f[a] = g
			}
			for (n in f) f.hasOwnProperty(n) && (o = f[n]) !== g && (o.shown = !1, b.hide(o.container));
			(g.shown = !g.shown) ? (b.addClass(i, "feed-expand"), b.show(g.container), b.css(e.triangle, "left", g.triangleOffset + "px"), b.show(e.ele), e.currentMod = g) : (b.removeClass(i, "feed-expand"), b.hide(g.container), b.hide(e.ele), e.currentMod = null), h.updateFeedOffsetInfo()
		}
	}), r.Plugins = [], a.augment(r, a.EventTarget, {
		_init: function() {
			var c = this.container;
			a.isString(c) && (c = a.get(c));
			if (!c || !c.nodeName) return a.log("Feedlist container not found.", "info"), !1;
			this.container = c, this.viewportHeight = b.viewportHeight(), this.leftOffset = parseInt(b.offset(c).left, 10) || 0
		},
		_initPlugins: function() {
			var b = this,
				c = this.config,
				d = {};
			return a.each(this.constructor.Plugins, function(e) {
				var f = e.name,
					g, h, i;
				(g = c[f]) && !0 === g.enable && (h = e.init) && (a.log("Feed plugin " + f + " enabled.", "info"), i = e.init(b, g), i && (d[f] = i))
			}), this.Plugins = d, this
		},
		_basicWindowEventBinding: function() {
			var a = this;
			return c.on(window, "scroll", function() {
				a.updateFeedViewInfo()
			}), c.on(window, "resize", function() {
				a.viewportHeight = b.viewportHeight(), this.leftOffset = parseInt(b.offset(a.container).left, 10) || 0
			}), this
		},
		_feedEventBinding: function() {
			var b = this,
				d = ["mouseover", "click", "mouseout", "mousedown"];
			return a.UA.mobile == "apple" && d.shift(), c.on(this.container, d.join(" "), function(a) {
				b._feedEventDispatcher(a)
			}), this
		},
		_feedEventDispatcher: function(c) {
			var d = c.target,
				e, f, g = c.type,
				j, k, l;
			b.hasClass(d, i) ? e = d : e = b.parent(d, h + i);
			if (!e) return this;
			if (!(f = p(e))) return a.log("Invalid feed id.", "error"), this;
			j = a.get(".feed-content-holder", e);
			if ((l = o[g]) && (d === j || b.contains(j, d))) {
				k = c.relatedTarget;
				while (k && k !== j) k = k.parentNode;
				k !== j && this.fire(m + l, {
					feed: this.feedsMap[f],
					event: c
				})
			}
			return this.fire(m + g, {
				feed: this.feedsMap[f],
				event: c
			}), this
		},
		updateFeedList: function(b) {
			!b || (this.feedsMap = {}, this.feeds = []);
			var c = this,
				d, e = a.query(h + i, this.container),
				f = this.feedsMap,
				g = this.feeds,
				j = [];
			return !e || 0 === e.length ? (a.log("There is no feed.", "info"), this) : (a.each(e, function(b) {
				!(d = p(b)) || d in f ? d || a.log("Invalid feed id.", "error") : (b = new q(b), b.collection = c, g.push(b), f[d] = b, j.push(b))
			}), j.length > 0 && (this.fire(l, {
				updateList: j
			}), this.updateFeedViewInfo()), this)
		},
		updateFeedOffsetInfo: function() {
			var c = !1;
			a.each(this.feeds, function(a) {
				var d = a.ele,
					e = b.offset(d).top,
					f = a.offset;
				e !== f && (a.offset = e, c = !0)
			}), c && this.updateFeedViewInfo()
		},
		updateFeedViewInfo: function() {
			if (this.feeds.length <= 0) return this;
			var a = b.scrollTop(),
				c = this.viewportHeight,
				h = a + c,
				i, j = this.feeds,
				k = 0,
				l = j.length,
				m = l - 1,
				o, p, q, r;
			for (; k < l; ++k) {
				if (undefined !== o && undefined !== p && undefined !== q && undefined !== r) break;
				i = j[k], undefined === p && i.offset >= a && (o = k, p = i.id), undefined === r && i.offset >= h && (q = k, r = i.id)
			}
			undefined === r && (q = m, r = j[m].id);
			if (d !== p || e !== r) d = undefined !== p ? p : r, f = undefined !== o ? o : q, e = undefined !== r ? r : p, g = undefined !== q ? q : o, this.fire(n, {
				firstInViewIndex: f,
				firstInViewId: d,
				lastInViewIndex: g,
				lastInViewId: e
			});
			return this
		},
		getFirstFeedInfoInView: function() {
			return {
				id: d,
				index: f
			}
		},
		getLastFeedInfoInView: function() {
			return {
				id: e,
				index: g
			}
		},
		removeFeed: function(c) {
			var d = this.feeds,
				e = a.indexOf(c, d),
				f;
			return e < 0 ? (a.log("Remove invalid feed.", "error"), this) : (d.splice(e, 1), delete this.feedsMap[c.id], b.remove(c.ele), c = null, (f = d[0]) && b.removeClass(f.ele, "user-repeat"), this.updateFeedOffsetInfo(), this)
		}
	}), r
}, {
	requires: ["dom", "event"]
}), KISSY.add("feed/infiniteload", function(a, b, c, d, e) {
	function m(d) {
		if (!0 === h || !0 === j[d]) return;
		!0 === g && !a.inArray(i, d) && i.push(d);
		if (a.isFunction(k.loadLock) && !! k.loadLock()) return;
		var e = b.get(k.loadingContainer) || b.get("#wrap") || document.body;
		g = !0, j[d] = !0, b.appendHtml(e, l), c({
			url: d,
			dataType: "html",
			success: function(c) {
				c = a.trim(c), b.remove("#loading-more-newsfeed"), c ? (b.appendHtml(f.container, c, !0), f.updateFeedList()) : h = !0, g = !1, (d = i.shift()) && m(d)
			}
		})
	}
	var f, g = !1,
		h = !1,
		i = [],
		j = {},
		k, l = '<div id="loading-more-newsfeed" style="margin-top:-20px;padding:40px;color:#333;text-align:center;font-size:32px;"><div style="width:500px;height:32px;line-height:32px;background:url(' + e.url.staticHost + '/img/element/loading.$6839.gif) no-repeat 100px center;text-indent:-9999px;margin:0 auto;text-align:center;">\u6b63\u5728\u52a0\u8f7d...</div>' + "</div>";
	d.Plugins.push({
		name: "InfiniteLoad",
		init: function(a, b) {
			return f = a, k = b, a.on("feed::viewinfoupdate", function(c) {
				var d = c.lastInViewIndex,
					e = a.feeds.length,
					f;
				e - d < 3 && (f = a.feeds[e - 1], b.type && b.type === "search" ? m(b.api.replace(/\{\{feedCount\}\}/, e)) : m(b.api.replace(/\{\{feedId\}\}/, f.id)))
			}), {
				loadingMore: m
			}
		}
	})
}, {
	requires: ["dom", "ajax", "feed/core", "util.$6781"]
}), KISSY.add("feed/imagelazyload", function(a, b, c, d) {
	function f(c) {
		if (!0 === c.lazyLoaded) return;
		var d, f = c.blogAvatar,
			g = c.authorAvatar;
		b.css(f, "backgroundImage", 'url("' + b.attr(f, "avatar") + '")'), b.css(g, "backgroundImage", 'url("' + b.attr(g, "avatar") + '")'), a.each(c.imgs, function(a) {
			a.src = b.attr(a, "imgsrc"), e && (a.onload = function() {
				this.style.zoom = 1, this.onload = null
			})
		}), c.lazyLoaded = !0
	}
	var e = c.ie <= 6;
	d.Plugins.push({
		name: "ImageLazyload",
		init: function(c, d) {
			c.on("feedlist::update", function(d) {
				var e = d.updateList;
				a.each(e, function(c) {
					function h() {
						if (g = a.query("img", d)) c.imgs = a.filter(g, function(a) {
							return b.attr(a, "imgsrc") && "true" === b.attr(a, "data-lazyload")
						})
					}
					var d = c.ele,
						e, f, g;
					if (f = a.get(".blog-avatar", d)) c.blogAvatar = f;
					if (e = a.get(".author-avatar-span", d)) c.authorAvatar = e;
					h()
				}), c.updateFeedOffsetInfo()
			}), c.on("feed::viewinfoupdate", function(a) {
				var b = d.limit || 3,
					e = c.feeds,
					g = a.firstInViewIndex,
					h = a.lastInViewIndex,
					i = e.length,
					j = g > 0 ? g - 1 : g,
					k = h + b < i ? h + 3 : i;
				for (; j < k; ++j) f(e[j])
			})
		}
	})
}, {
	requires: ["dom", "ua", "feed/core"]
}), KISSY.add("feed/imagesupport", function(a, b, c, d, e, f) {
	function m(c, d, e, h) {
		var i = c.ele,
			j = g(".link-to-post", i),
			k = g(".feed-img-all", i),
			l = b.query(".feed-img", k),
			m = [],
			n = ENV && ENV.labsFullScreenSlide;
		d || (d = 0), !j || (j = j.href), a.each(l, function(a) {
			m.push(b.attr(a, "data-origin-info").split(":")[4])
		}), !e._feedslide || e._feedslide.destroy(), e._feedslide = new f({
			data: m,
			postUrl: j,
			fullScreenSupport: n || !1
		}), e._feedslide.show(d), !h || e._feedslide.showExifInfo()
	}
	function n(c, d, e) {
		var f = c.ele,
			h = g(".feed-ct", f),
			j = g(".feed-img-thumb", f),
			k = g(".feed-img-all", f),
			l = b.query(".feed-img", k),
			m, n = b.attr(h, "largeimg");
		a.each(l, function(a) {
			var c = b.attr(a, "imgsrc");
			!a.src && c && (a.src = c)
		}), b.toggle(j), b.toggle(k), m = "none" !== k.style.display, !m && b.scrollTop() > c.offset && b.scrollIntoView(f), b.hasClass(h, "feed-repost") && b.toggleClass(h, "feed-repost-expand"), e.fire(i, {
			feed: c,
			type: "image",
			open: m
		})
	}
	function o(c, d, e) {
		var f = b.parent(d.target, ".text-img-holder"),
			g = b.get(".text-img-thumb", f),
			h = b.data(g, "size") || a.JSON.parse(b.attr(g, "data")),
			j = g.width,
			k = g.height,
			l;
		if (j == h.width && k == h.height) return;
		l = "left" === b.css(f, "float"), l ? b.css(f, "float", "none") : b.css(f, "float", "left"), b.css(g, h), b.data(g, "size", {
			width: j,
			height: k
		}), b.hasClass(g, "feed-thumb-open") ? b.removeClass(g, "feed-thumb-open") : b.addClass(g, "feed-thumb-open"), b.hasClass(f, "text-img-too-high") ? (b.removeClass(f, "text-img-too-high"), b.addClass(f, "text-img-too-high-open")) : b.hasClass(f, "text-img-too-high-open") && (b.addClass(f, "text-img-too-high"), b.removeClass(f, "text-img-too-high-open"), b.scrollTop() > c.offset && b.scrollIntoView(c.ele)), e.fire(i, {
			feed: c,
			type: "image",
			open: l
		}), d.halt()
	}
	function p(a) {
		var b = a;
		return !a.make && !a.model && (b = undefined), b
	}
	function q(b) {
		var c = [],
			d;
		return a.each(k, function(a) {
			var d = a.name,
				e;
			if (e = b[d]) d == "gpsAddress" && (e = '<span class="gps-detail" title="\u67e5\u770b\u5730\u56fe">' + e + "</span>"), c.push({
				name: a.value,
				value: e
			})
		}), c
	}
	function r(c, d) {
		var e, f, g, h;
		for (e in c) c.hasOwnProperty(e) && (h = p(c[e])) && (f = q(h), g = a.Template(l).render({
			exifs: f
		}), a.each(d[e], function(c) {
			var d = a.get(".exif-info", c),
				e;
			b.addClass(c, "enable"), d.innerHTML = g
		}))
	}
	function s(a, c, d) {
		var e = b.get(".feed-img-all", a.ele),
			f = b.get(".feed-img-thumb", a.ele),
			g = b.get(".feed-ct", a.ele),
			h = b.get(".feed-img", e),
			j = b.get(".feed-img-too-hight-close-holder", g),
			k = b.attr(g, "largeimg");
		k != "true" ? (b.hide(f), b.show(e)) : (b.removeClass(e, "feed-img-too-high"), b.addClass(), b.show(), b.show(j)), d.fire(i, {
			feed: a,
			type: "image",
			open: !0
		})
	}
	function t(a, c, d) {
		var e = b.get(".feed-img-all", a.ele),
			f = b.get(".feed-ct", a.ele),
			g = b.get(".feed-img-too-hight-close-holder", f);
		b.addClass(e, "feed-img-too-high"), b.hide(g), b.scrollIntoView(a.ele), d.fire(i, {
			feed: a,
			type: "image",
			open: !1
		})
	}
	var g = a.get,
		h = a.UA.ie <= 6,
		i = "feed::mediatoggle",
		j = d.url.host + "/exif",
		k = [{
			name: "make",
			value: "\u54c1\u724c"
		}, {
			name: "model",
			value: "\u578b\u53f7"
		}, {
			name: "dateTime",
			value: "\u7167\u7247\u65f6\u95f4"
		}, {
			name: "lens",
			value: "\u955c\u5934"
		}, {
			name: "iSOSpeedRatings",
			value: "ISO"
		}, {
			name: "exposureTime",
			value: "\u66dd\u5149\u65f6\u95f4"
		}, {
			name: "fNumber",
			value: "\u5149\u5708"
		}, {
			name: "whiteBalance",
			value: "\u767d\u5e73\u8861"
		}, {
			name: "flash",
			value: "\u95ea\u5149\u706f"
		}, {
			name: "focalLength",
			value: "\u7126\u8ddd"
		}, {
			name: "focalLength35",
			value: "35mm\u7b49\u6548\u7126\u8ddd"
		}, {
			name: "exposureBiasValue",
			value: "\u66dd\u5149\u8865\u507f"
		}, {
			name: "exposureProgram",
			value: "\u66dd\u5149\u7a0b\u5e8f"
		}, {
			name: "software",
			value: "\u8f6f\u4ef6"
		}, {
			name: "gpsAddress",
			value: "\u5730\u7406\u4f4d\u7f6e"
		}],
		l = '<table><tbody>{{#each exifs as exif}}<tr><th class="exif-hd">{{exif.name}}</th><td class="exif-bd">{{exif.value}}</td></tr>{{/each}}</tbody></table>';
	e.Plugins.push({
		name: "ImageSupport",
		init: function(e) {
			e.on("feedlist::update", function(e) {
				var f = [],
					g = {};
				a.each(e.updateList, function(c) {
					var d = c.ele,
						e = a.query(".img-exif-holder", d);
					e && e.length > 0 && a.each(e, function(a) {
						var c, d;
						if (c = b.attr(a, "data-id")) f.push(c), (d = g[c]) || (d = g[c] = []), d.push(a)
					})
				});
				if (0 === f.length) return;
				c.post(j, {
					ids: f.join(",")
				}, function(a) {
					if (0 == a.errorCode) {
						for (var b in a.exif) {
							if (!ENV.feedImgInfos[b]) continue;
							ENV.feedImgInfos[b].exif = a.exif[b], a.exif[b].gpsAddress && d.Dispatcher.fire("feedlist::exifLocationLoad")
						}
						r(a.exif, g)
					} else d.alert(a.result)
				}, "json"), h && a.each(e.updateList, function(c) {
					if (c._exifHoverPatched) return;
					a.Event.on(a.query(".feed-big-img", c.ele), "mouseenter mouseleave", function(a) {
						var c = "mouseenter" === a.type ? b.addClass : b.removeClass;
						c(this, "hover")
					}), c._exifHoverPatched = !0
				})
			}), e.on("feed::click", function(c) {
				var d = c.event,
					f = d.target,
					g = c.feed,
					i, j, k = b.get(".feed-ct", g.ele),
					l = b.attr(k, "largeimg");
				b.hasClass(f, "feed-img") && !b.hasClass(f, "slide-show") ? (l == "false" ? n(g, d, e) : m(g, b.attr(f, "data-origin-info").split(":")[5], e), e.updateFeedOffsetInfo()) : b.parent(f, ".text-img-holder") ? (c.event.halt(), o(g, d, e), e.updateFeedOffsetInfo()) : b.hasClass(f, "exif-toggler") && (i = b.parent(f, ".img-exif-holder"), b.toggleClass(i, "open"), h && b.hasClass(i, "open") && !b.data(f, "maskPatched") && (j = a.get(".exif-mask", i), b.width(j, b.width(i) + 100 + "px"), b.height(j, b.height(i) + 40 + "px"), b.data(f, "maskPatched", !0)), f.blur()), !b.hasClass(f, "feed-img-too-high-tip") || (s(g, d, e), e.updateFeedOffsetInfo()), !b.hasClass(f, "feed-img-too-hight-close-holder") || (t(g, d, e), e.updateFeedOffsetInfo());
				if ( !! b.hasClass(f, "feed-slide-hook")) {
					var p = b.attr(f, "index");
					m(g, p, e)
				}
				if ( !! b.hasClass(f, "gps-detail")) {
					var q = b.parent(f, ".feed-big-img"),
						r = b.get(".feed-slide-hook", q),
						p = b.attr(r, "index");
					m(g, p, e, !0)
				}
			}), e.on("feed::mouseover", function(c) {
				var d = c.feed,
					e, f, g = b.get(".rich-content", d.ele);
				if (!g) return;
				e = b.query("a", g), f = b.query(".text-img-thumb", g), a.each(e, function(a) {
					!b.get("img", a) || (a.style.cursor = "default", a.removeAttribute("title"), a.removeAttribute("href"))
				}), a.each(f, function(c) {
					var d = b.data(c, "size") || a.JSON.parse(b.attr(c, "data")),
						e = c.width,
						f = c.height;
					e == d.width && f == d.height && (c.style.cursor = "default")
				})
			})
		}
	})
}, {
	requires: ["dom", "ajax", "util.$7066", "feed/core", "lib/feedslide.$7116"]
}), KISSY.add("feed/audiosupport", function(a, b, c) {
	function m(a, c, e, f) {
		f = f || "xiami";
		var g = c.ele,
			h = d(".feed-ct", g),
			i = b.hasClass(h, "cover-expand"),
			j = /(\.\w+)$/,
			k = /_2(\.\w+)$/;
		i ? (f == "mplayer" ? (a.src = b.attr(a, "imgsrc"), a.width = a.height = 150) : (a.src = a.src.replace(j, "_2$1"), a.width = a.height = 150), b.removeClass(h, "cover-expand")) : (a.removeAttribute("width"), a.removeAttribute("height"), f == "mplayer" ? a.src = b.attr(a, "large") : a.src = a.src.replace(k, "$1"), b.addClass(h, "cover-expand"), a.onload = function() {
			var a = this.width;
			this.width = a > 500 ? 500 : a, e.updateFeedOffsetInfo(), this.onload = null
		})
	}
	function n(a, c) {
		var e = a.ele,
			g = d(".feed-ct", e),
			h = d(".feed-audio-player", e),
			j = b.attr(g, "xiamiid"),
			k = d(".xiami-player", e),
			l = e.id,
			m = l.replace("-", ""),
			n = f.replace(/\{\{xiamiId\}\}/g, j).replace(/\{\{feedId\}\}/, m),
			p = b.get("#xiami" + m);
		if (!p) b.hide(k), b.appendHtml(h, n);
		else {
			if (a._playing) {
				try {
					p.musicPause()
				} catch (q) {
					o(a)
				}
				a._playing = !1, i = null;
				return
			}
			p.musicPlay()
		}
		i = a, a._playing = !0
	}
	function o(a) {
		var c = a.ele;
		b.remove(".xiami-flash-player", c), b.show(".xiami-player", c)
	}
	function p(a) {
		var b = a.ele,
			c = b.id,
			e = c.replace("-", ""),
			f = d("#xiami" + e);
		try {
			f.musicPause()
		} catch (g) {
			o(a)
		}
		i = null, a._playing = !1
	}
	function q(a, b) {
		a._playing ? (a._playing = !1, i = null) : (b.fire(g, {
			feed: a,
			from: "xiami"
		}), a._playing = !0, i = a, b.fire(h, {
			feed: a,
			type: "music",
			open: !0
		}))
	}
	function r(a, c) {
		if (j && a == j) {
			k.jPlayer.pause(), j = null, k = null;
			return
		}
		c.fire(g, {
			feed: a,
			from: "mplayer"
		});
		var d = b.get(".music-player", a.ele),
			e = b.get(".jp-jplayer", a.ele),
			f = b.attr(d, "musicsrc"),
			i = b.attr(d, "musicid");
		f && KISSY.use("lib/mplayer/mplayer.$6680", function(b, l) {
			l.init("#" + d.id, "#" + e.id, {
				src: f,
				musicId: i,
				cb: function(b) {
					j = a, k = b, a.jPlayer = b, b("#" + e.id).bind(b.jPlayer.event.play, function() {
						c.fire(g, {
							feed: a,
							from: "mplayer"
						})
					})
				}
			}), c.updateFeedOffsetInfo(), c.fire(h, {
				feed: a,
				type: "music",
				open: !0
			})
		})
	}
	var d = a.get,
		e = b.hasClass,
		f = '<div class="xiami-flash-player"><object width="257" id="xiami{{feedId}}" name="xiami{{feedId}}" class="xiami-flash-player-object" height="33" type="application/x-shockwave-flash" data="http://img.xiami.com/widget/0_{{xiamiId}}_/singlePlayer.swf"><param value="http://img.xiami.com/widget/0_{{xiamiId}}_/singlePlayer.swf" name="movie"><param value="transparent" name="wmode"><param value="high" name="quality"><param name="allowScriptAccess" value="always" /></object></div>',
		g = "feed::beforemediaplay",
		h = "feed::mediatoggle",
		i, j, k, l = a.UA.mobile == "apple";
	window.songPlayComplete = function() {
		!i || (i._playing = !1, i = null)
	}, c.Plugins.push({
		name: "AudioSupport",
		init: function(a) {
			l && a.on("feedlist::update", function(a) {
				KISSY.use("lib/mplayer/mplayer.$6680", function(c, d) {
					var e = a.updateList;
					c.each(e, function(a, c) {
						var e = b.get(".music-player", a.ele);
						if (e) {
							var f = b.get(".jp-jplayer", a.ele),
								g = b.attr(e, "musicsrc"),
								h = b.attr(e, "musicid");
							g && d.init("#" + e.id, "#" + f.id, {
								src: g,
								musicId: h,
								autoPlay: !1
							})
						}
					})
				})
			}), a.on("feed::mousedown", function(b) {
				var c = b.event.target,
					d = b.feed;
				e(c, "xiami-flash-player-object") && q(d, a)
			}), a.on("feed::click", function(c) {
				var d = c.event.target,
					f = c.feed,
					i = b.parent(d, ".music-player");
				e(d, "feed-audio-thumb") ? (m(d, f, a), a.updateFeedOffsetInfo(), a.fire(h, {
					feed: f,
					type: "musicCover",
					open: !0
				})) : e(d, "feed-audio-thumb-mplayer") ? (m(d, f, a, "mplayer"), a.updateFeedOffsetInfo(), a.fire(h, {
					feed: f,
					type: "musicCover",
					open: !0
				})) : e(d, "xiami-player-link") ? (a.fire(g, {
					feed: f,
					from: "xiami"
				}), n(f, a), a.updateFeedOffsetInfo(), a.fire(h, {
					feed: f,
					type: "music",
					open: !0
				})) : i && !l && r(f, a)
			}), a.on(g, function(c) {
				var d = c.feed,
					e, f, g;
				j && d !== j && c.from != "mplayer" && k.jPlayer.pause(), i && c.from == "mplayer" && p(i), i && d !== i && (p(i), g = !0), g && (a.updateFeedOffsetInfo(), a.fire(h, {
					feed: i,
					type: "music",
					open: !1
				}), e = d.offset, f = b.scrollTop(), (e < f || e > f + a.viewportHeight) && b.scrollIntoView(d.ele))
			})
		}
	})
}, {
	requires: ["dom", "feed/core"]
}), KISSY.add("feed/videosupport", function(a, b, c) {
	function d(a) {
		var b = a.split("/"),
			c = b.pop();
		return b.push("&autoPlay=true"), b.push(c), b.join("/")
	}
	function e(a) {
		return a.replace("/video/player", "/video/swf").replace("v_0.swf", "2/a.swf")
	}
	function f(a) {
		return a.replace("autoplay=0", "autoplay=1")
	}
	function o(b) {
		var c = b.vars,
			d = [],
			e = [],
			f;
		for (f in c) c.hasOwnProperty(f) && (d.push('<param name="' + f + '" value="' + c[f] + '" />'), e.push(f + "=" + c[f]));
		return b.params = d.join(""), b.flashVars = 'flashvars="' + e.join("&") + '"', a.substitute(k, b)
	}
	function p(c) {
		var d = c.ele,
			e = h(".feed-ct", d),
			f = h(".feed-video-ct", d),
			k = h(".feed-video-img-holder", d),
			l = g(e, "feed-repost"),
			m = a.JSON.parse(b.attr(f, "data")),
			p = m.hostType,
			r = m.id,
			s = m.flashurl,
			t = m.videourl,
			u, v, w = h(".feed-full-video-wrap", d);
		if (w) {
			q(c);
			return
		}
		u = a.merge(j, i[p] || {}), a.isFunction(u.url) ? u.url = u.url(s) : u.url = u.url.replace(/\{\{vUrl\}\}/g, s), u.link = t, l && (u.width = u.repostWidth, u.height = u.repostHeight, b.addClass(e, "feed-repost-expand")), b.hide(k), v = o(u), w = b.create('<div class="feed-full-video-wrap clearfix">', {
			html: v
		}), b.insertBefore(w, k), n = c
	}
	function q(a) {
		var c = a.ele,
			d = h(".feed-video-img-holder", c),
			e = h(".feed-full-video-wrap", c);
		b.remove(e), b.show(d), n = null
	}
	var g = b.hasClass,
		h = a.get,
		i = [{}, {
			url: "{{vUrl}}&isAutoPlay=true",
			height: 416,
			repostHeight: 391,
			vars: {
				isAutoPlay: !0
			},
			name: "youku.com"
		}, {
			vars: {
				auto: !0
			},
			name: "tudou.com",
			url: d
		}, {
			url: "{{vUrl}}&auto=1",
			name: "ku6.com"
		}, {
			height: 362,
			repostHeight: 385,
			vars: {
				flag: 1
			},
			name: "6.cn"
		}, {
			name: "56.com"
		}, {
			name: "yinyuetai.com",
			url: e
		}, {
			name: "sina.com.cn"
		}, {
			name: "tv.sohu.com"
		}, {
			name: "iqiyi.com",
			url: f
		}, {
			name: "bilibili.tv",
			height: 385
		}, {
			name: "acfun.tv"
		}, {
			name: "letv.com"
		}, {
			name: "baomihua.com"
		}],
		j = {
			url: "{{vUrl}}",
			width: 500,
			repostWidth: 471,
			height: 416,
			repostHeight: 391
		},
		k = '<div class="feed-full-video"><object width="{width}" height="{height}">{params}<param name="allowscriptaccess" value="sameDomain" /><param name="wmode" value="transparent" /><param name="allowfullscreen" value="true" /><param name="movie" value="{url}" /><embed {flashVars} src="{url}" width="{width}" height="{height}" allowscriptaccess="sameDomain" wmode="transparent" type="application/x-shockwave-flash" allowfullscreen="true"></embed></object></div><div class="feed-video-footer clearfix"><span class="feed-video-link"><a href="{link}" target="_blank">{name}</a>&rarr;</span><a class="feed-video-close">\u5173\u95ed\u89c6\u9891</a></div>',
		l = "feed::beforemediaplay",
		m = "feed::mediatoggle",
		n;
	c.Plugins.push({
		name: "VideoSupport",
		init: function(a) {
			a.on("feed::click", function(b) {
				var c = b.event.target,
					d = b.feed;
				g(c, "feed-video-img") || g(c, "feed-video-play") ? (a.fire(l, {
					feed: d
				}), p(b.feed, a), a.updateFeedOffsetInfo(), a.fire(m, {
					feed: d,
					type: "video",
					open: !0
				})) : g(c, "feed-video-close") && (q(d), a.updateFeedOffsetInfo(), a.fire(m, {
					feed: d,
					type: "video",
					open: !1
				}))
			}), a.on(l, function(c) {
				var d = c.feed,
					e, f;
				n && d !== n && (q(n), a.updateFeedOffsetInfo(), a.fire(m, {
					feed: n,
					type: "video",
					open: !1
				}), e = d.offset, f = b.scrollTop(), (e < f || e > f + a.viewportHeight) && b.scrollIntoView(d.ele))
			})
		}
	})
}, {
	requires: ["dom", "feed/core"]
}), KISSY.add("feed/scrolltopbutton", function(a, b, c, d, e, f) {
	function g() {
		var a = parseInt(Math.random() * 100);
		return a < 15 ? "0 -52px" : a < 30 ? "0 -104px" : a < 45 ? "0 -156px" : "0 0"
	}
	var h = 6 === a.UA.ie,
		i = 1500,
		j = '.scroll-to-top,.scroll-to-top:link,.scroll-to-top:visited {position:fixed;text-indent:-9999px;display:block;width:42px;height:42px;bottom:{{bottom}}px;left:50%;margin-left:200px;outline:none;background:url("' + e.url.staticHost + '/img/icon/feed-icons.$6973.png") no-repeat -200px -60px;' + '_background:url("' + e.url.staticHost + '/img/icon/feed-icons-ie.$5234.png") no-repeat -200px -60px;' + "_display:none;" + "}" + ".scroll-to-top:active," + ".scroll-to-top:hover {" + "background-position: -250px -60px;" + "}" + "#_dd_shortcut_tip{" + 'background:url("' + e.url.staticHost + '/img/icon/feed-short-tip.$6396.png") no-repeat ' + g() + ";position:fixed;bottom:{{bottom}}px;left:50%;margin-left:255px;display:block;width:140px;height:42px;}";
	d.Plugins.push({
		name: "ScrollTopButton",
		init: function(a, d) {
			function q(a) {
				b.css(a, {
					opacity: 0
				}), b.show(a), (new f(a, {
					opacity: 1
				}, .3, "easeBoth")).run()
			}
			function r(a) {
				b.css(a, {
					opacity: 1
				}), (new f(a, {
					opacity: 0
				}, .3, "easeBoth", function() {
					b.hide(a)
				})).run()
			}
			function s() {
				if (b.scrollTop() > i) {
					if (k) return;
					q(o), l || (q(p), g || (g = setTimeout(function() {
						r(p), l = !0
					}, 3e3))), k = !0
				} else {
					if (!k) return;
					r(o), r(p), l = !1, k = !1, g = clearTimeout(g)
				}
			}
			if (h) return;
			var g, k, l, m = 20,
				n = b.get(d.container) || b.get("#wrap") || document.body;
			d.positionBottom && (m = d.positionBottom), b.addStyleSheet(j.replace(/\{\{bottom\}\}/g, m));
			var o = b.create('<a class="scroll-to-top" style="display:none">Top</a>');
			n.appendChild(o);
			var p = b.create('<span id="_dd_shortcut_tip"></span>');
			n.appendChild(p), b.hide(p), c.on(o, "click", function() {
				e.scrollToTop()
			}), c.on(window, "scroll", s), s()
		}
	})
}, {
	requires: ["dom", "event", "feed/core", "util.$6939", "anim"]
}), KISSY.add("feed/keyboardshortcut", function(a, b, c, d) {
	function e(a, c) {
		var d = c.getFirstFeedInfoInView().index,
			e = c.feeds,
			f = e[d],
			g = Math.floor(f.offset),
			h, i, j = b.scrollTop();
		"next" === a ? g > j ? window.scrollTo(0, g) : (h = e[d + 1]) && window.scrollTo(0, h.offset) : d <= 1 ? b.scrollIntoView("#wrap") : (i = e[d - 1]) && window.scrollTo(0, i.offset)
	}
	function f(a) {
		var c = a.getFirstFeedInfoInView().index,
			d = a.feeds,
			e = d[c],
			f = e.ele,
			g = b.scrollTop(),
			h = d[c - 1] ? d[c - 1].ele : d[c].ele,
			i = d[c].ele,
			j = b.offset(h).top,
			k = b.offset(i).top,
			l = b.viewportHeight(),
			m = k - g > l ? h : i;
		return m
	}
	function g(a) {
		var d = f(a),
			e = b.get(".feed-fav", d);
		e && c.fire(e, "click")
	}
	function h(a) {
		var d = f(a),
			e = b.get(".feed-cmt", d);
		e && c.fire(e, "click")
	}
	function i(a) {
		var d = f(a),
			e = b.get(".feed-slide-hook", d),
			g = b.get(".feed-video-play", d) || b.get(".xiami-player-link", d) || b.get(".jp-play", d);
		e ? (!a._feedslide || a._feedslide.destroy(), c.fire(e, "click")) : g && c.fire(g, "click")
	}
	d.Plugins.push({
		name: "KeyboardShortcut",
		init: function(a) {
			c.on(document, "keydown", function(b) {
				var c = b.originalTarget,
					d, f = b.keyCode;
				c || (c = document.activeElement), c && (d = c.nodeName);
				if ("INPUT" === d || "TEXTAREA" === d) return;
				if (74 === f || 78 === f) {
					if ( !! a._feedslide && a._feedslide.isShow()) {
						a._feedslide.nextImg();
						return
					}
					e("next", a)
				} else if (75 === f || 80 === f) {
					if ( !! a._feedslide && a._feedslide.isShow()) {
						a._feedslide.prevImg();
						return
					}
					e("prev", a)
				} else if (76 === f && b.metaKey !== !0 && b.altKey !== !0 && b.ctrlKey !== !0) g(a);
				else if (72 === f && b.metaKey !== !0 && b.altKey !== !0 && b.ctrlKey !== !0) {
					if ( !! a._feedslide && a._feedslide.isShow()) {
						a._feedslide.destroy();
						return
					}
					i(a)
				} else 82 === f && b.ctrlKey !== !0 && b.metaKey !== !0 && h(a)
			})
		}
	})
}, {
	requires: ["dom", "event", "feed/core"]
}), KISSY.add("feed/hoverlink", function(a, b, c) {
	var d = a.get,
		e = b.show,
		f = b.hide;
	c.Plugins.push({
		name: "HoverLink",
		init: function(c) {
			var g = "feed::" + (a.UA.mobile == "apple" ? "click" : "mouseenter"),
				h = b.height("#header-holder") || 72;
			c.on(g, function(c) {
				var f = c.feed,
					g = d(".link-to-post-holder", f.ele),
					i = d(".link-to-post-inner", g),
					j = d(".rich-content", f.ele),
					k = b.query("a", j);
				b.css(i, {
					"background-position": "0 -" + (f.offset - h) + "px"
				}), a.each(k, function(a) {
					b.attr(a, "target") !== "_blank" && b.attr(a, "target", "_blank")
				}), b.hasClass(f.ele, "new-post-guide") && (g = !1), g && e(g)
			}), c.on("feed::mouseleave", function(a) {
				var b = a.feed,
					c = d(".link-to-post-holder", b.ele);
				f(c)
			})
		}
	})
}, {
	requires: ["dom", "feed/core"]
}), KISSY.add("feed/comment", function(a, b, c, d, e, f, g, h, i, j) {
	function B(c, d, e) {
		C();
		var i = c.ele,
			j = b.attr(i, "data-comment"),
			k, l, m = !! b.get(".feed-cmt", i).innerHTML.match(/\(\d+\)/),
			n = g(x).render({
				feedId: c.id,
				isLogin: p,
				hasComment: m,
				connectInfo: q,
				root: f.url.host
			}),
			o = b.create(n);
		h.init(o), D(c);
		if (k = w[j]) l = b.create('<p class="feed-comment-tips">' + k + "</p>"), b.hide(a.get(".add-comment", o)), b.hide(a.get(".cmt-at-list", o)), b.hide(a.get(".register-third", o)), b.prepend(l, b.get(".feed-comment", o));
		return d.appendChild(o), k || E(c), F(c), a.isFunction(e) && e(o), o
	}
	function C() {
		if (l) return;
		var a = ENV.connectUserInfo;
		if (a) p = !1, q = {
			name: a.name,
			type: a.connectTarget
		};
		else {
			var c = b.get("#connect-user-login");
			c ? p = b.attr(c, "loginStatus") == "1" : p = !0
		}
		p || S()
	}
	function D(a) {
		var b = h.get(a.id + "publish");
		c.add(b, "click", function(b) {
			O(a)
		})
	}
	function E(d) {
		var e = h.get(d.id + "input"),
			f;
		e.on("ctrlenter", function(a) {
			O(d)
		}), e.on("heightchanged", function(a) {
			m.updateFeedOffsetInfo()
		}), A[d.id] = f = new j("#" + d.id + "photo-reply"), c.on(f, "over", function() {
			b.show(b.get(".link-to-post-holder", "#feed-" + d.id))
		});
		try {
			setTimeout(function() {
				e.main.focus()
			}, 0)
		} catch (g) {
			a.log(g, "error")
		}
	}
	function F(c, e, g) {
		var i = c.id,
			j = c.ele,
			k = a.get(".feed-cmt", j),
			l = h.get(i + "input"),
			n = a.get(".cmt-list", j),
			o = b.attr(k, "data-nid"),
			p = b.get(".J_GetMoreComments", j),
			q = b.get(".J_CommentsLoading", j),
			s, t, v, w, x = c.lastCommentId;
		g = g || u, v = {
			sPostId: o,
			postId: i,
			count: g,
			types: "3",
			t: +(new Date)
		}, x && (v.lastNoteId = x), b.hide(p), b.show(q), d({
			type: "get",
			url: r,
			data: v,
			success: function(a) {
				a.errCode ? f.alert(a.result) : ( !! a.notes && 0 !== (s = a.notes.length) && (w = G(c, a, l.main), b.append(b.create(w), n), X(c), b.show(n)), a.hasNext ? b.show(p) : b.hide(p), m.updateFeedOffsetInfo())
			},
			complete: function(a) {
				b.hide(q)
			}
		})
	}
	function G(b, c, d) {
		var e = c.notes,
			g = e.length,
			h = [];
		return a.each(e, function(a) {
			if (a.type != 3 || !a.canReply) return;
			h.push({
				userid: a.authorId || a.authorUuid,
				name: a.authorName,
				personalUrl: a.authorUrl,
				avatar: a.authorImageUrl
			})
		}), b.lastCommentId = e[g - 1].id, h.length > 0 && f.Dispatcher.on("add-at-item", function(a) {
			J("add", a.id, a.name, a.container, !0)
		}), !b.hasComments && g > 0 && (e[0].firstClass = "first-cmt", b.hasComments = !0), a.Template(y).render({
			notes: c.notes,
			canComment: c.canComment == -1 && !p ? 1 : c.canComment
		})
	}
	function H(c, d) {
		if (!p && !q.name) {
			window.open(f.url.host + "/register");
			return
		}
		var e = d.ele,
			g = h.get(d.id + "input"),
			i = b.attr(c, "data-authorName"),
			j = b.attr(c, "data-authorId"),
			k = a.get(".cmt-at-list", e);
		b.show(k), J("add", j, i, k, !0), g.main.focus()
	}
	function I(c, d) {
		var e = d.ele,
			f = b.attr(c, "data-authorId"),
			g = a.get(".cmt-at-list", e);
		J("del", f, null, g, !0), a.get(".at-item", g) || b.hide(g)
	}
	function J(c, d, e, f, g) {
		var h, i = b.data(f, "atData") || [];
		g = g || !0, h = a.filter(i, function(a) {
			return a.id != d
		}), c === "add" && h.push({
			id: d,
			name: e
		}), b.data(f, "atData", h), g && K(f, h)
	}
	function K(b, c) {
		var d = [];
		a.each(c, function(b) {
			d.push(a.Template(z).render({
				id: b.id,
				name: a.escapeHTML(b.name)
			}))
		}), b.innerHTML = '<span class="cmt-prefix">\u56de\u5e94:</span>' + d.join("")
	}
	function L(a) {
		a.innerHTML = "", b.removeData(a, "atData")
	}
	function M(c) {
		var d = {},
			e = b.data(c, "atData");
		return e ? (a.each(e, function(a) {
			d[a.name] = a.id
		}), a.JSON.stringify(d)) : ""
	}
	function N(c, d, e, f) {
		var g = b.create("<div>"),
			i = document.createDocumentFragment(),
			j, k, l = h.get(f + "input");
		c.firstClass = "first-cmt", j = a.Template(y).render({
			notes: [c],
			canComment: 1
		}), g.innerHTML = j, b.css(g.firstChild, {
			opacity: 0
		});
		while (k = g.firstChild) i.appendChild(k);
		g = null, (k = d.firstChild) ? (b.removeClass(k, "first-cmt"), b.insertBefore(i, k)) : (d.appendChild(i), b.show(d)), a.Anim(d.firstChild, "opacity:1", .5, "easeBoth", function() {
			m.updateFeedOffsetInfo()
		}).run(), l.setValue(""), l.resetAutoGrow(), X(e)
	}
	function O(c) {
		var e = c.ele,
			g = c.id,
			i = h.get(g + "publish"),
			j = h.get(g + "input"),
			k = a.get(".cmt-at-list", e),
			l = a.get(".cmt-list", e),
			m = a.trim(j.getValue()),
			o = M(k),
			q = A[c.id].getValue();
		if (!m && !q || c.sendingCmt) return;
		c.sendingCmt = !0, j.setDisabled(!0), i.setDisabled(!0), L(k);
		var r = {},
			u = {},
			v = a.JSON.parse(o);
		for (var w in v) Number(v[w]) ? r[w] = v[w] : u[w] = v[w];
		var x = {
			feed_id: g,
			content: m,
			imageId: q,
			atUuid: a.JSON.stringify(u),
			at: a.JSON.stringify(r)
		};
		n.submitCode && (x.icode = n.submitCode);
		var y = b.get(".register-third-panel", e);
		y && y.style.display != "none" && b.get(".register-third-sync-input", y).checked && (x.syncComment = !0), x.formKey = window.DDformKey, d({
			url: p ? s : t,
			type: "post",
			data: x,
			dataType: "json",
			success: function(a) {
				if (a.icode) {
					n.feed = c, P();
					return
				}
				a.errCode == 0 ? (b.removeClass(b.get(".register-third", e), "noborder"), N(a, l, c, g), f.Dispatcher.fire("post::addComment", {
					feed: c
				}), n.dialog && n.dialog.destory(), n = {}, A[c.id].setValue()) : f.alert(a.result)
			},
			complete: function() {
				c.sendingCmt = !1, j.setDisabled(!1), i.setDisabled(!1)
			}
		})
	}
	function P() {
		n.dialog && (n.dialog.destory(), n.dialog = null), f.disableDom({
			zIndex: 100
		});
		var a = new f.Dialog({
			zIndex: 101
		}),
			d = '<div><img src="http://www.diandian.com/icode/comment?rnd=' + +(new Date) + '" style="float:left;cursor:pointer;" title="\u770b\u4e0d\u6e05\u695a?\u70b9\u51fb\u5237\u65b0\u9a8c\u8bc1\u7801" id="comment-icode-image">' + '<input type="text" class="simple-input-text" id="comment-icode-input" style="float:left;height:35px;margin-left:5px;width:100px;font-size:24px;">' + "</div>",
			e = '<span class="blue-button" id="comment-icode-submit" style="clear:both;float:right;">\u53d1\u5e03</span>';
		a.setSize({
			width: 300
		}), a.setTitle("\u8bf7\u5411\u6211\u4eec\u8bc1\u660e\u4f60\u662f\u4e2a\u597d\u4eba~"), a.setContentHtml(d), a.setFooterHtml(e), a.show(), a.setPosition("center"), c.on("#comment-icode-submit", "click", function() {
			n.submitCode = b.get("#comment-icode-input").value, a.hide(), f.enableDom(), O(n.feed)
		}), c.on("#comment-icode-image", "click", function() {
			b.get("#comment-icode-image").src = "http://www.diandian.com/icode/comment?rnd=" + +(new Date)
		}), n.dialog = a, a.on("hide", function(a) {
			f.enableDom()
		})
	}
	function Q(a) {
		var c;
		return b.hasClass(a, "cmt-list-item") ? c = a : c = b.parent(a, ".cmt-list-item"), c
	}
	function R(c, e) {
		function l() {
			d({
				type: "post",
				url: s + "/remove",
				data: {
					feed_id: k,
					comment_id: j,
					formKey: window.DDformKey
				},
				success: function(c) {
					c.errCode == 0 ? (a.Anim(g, "opacity:0", .3, "easeBoth", function() {
						g.parentNode.removeChild(g), g = null, 0 === b.children(i).length ? b.hide(i) : b.addClass(i.firstChild, "first-cmt"), m.updateFeedOffsetInfo()
					}).run(), f.Dispatcher.fire("post::delComment", {
						feed: e
					})) : f.alert(c.result)
				}
			})
		}
		var g = b.parent(c, "li"),
			i = b.parent(g, "ul"),
			j = g.id.match(/cmt-([\w\-]+)/)[1],
			k = e.id;
		h.Dialog.confirm({
			content: "\u786e\u8ba4\u5220\u9664\u8fd9\u6761\u56de\u5e94\u5417\uff1f",
			onok: l
		})
	}
	function S() {
		if (l) return;
		m.on("connect::callback", function(c) {
			var d = c.data,
				e = d.name,
				f = d.connectTarget;
			a.each(b.query(".register-third"), function(a, c) {
				a.style.display != "none" && (b.get(".register-third-title", a).innerHTML = e, b.get(".register-third-sync-title", a).innerHTML = "\u540c\u6b65\u5230" + f, b.show(b.get(".register-third-panel", a)), b.hide(b.get(".register-third-items", a)), b.show(b.get(".add-comment", b.parent(a, ".feed-comment"))))
			}), q.name = e, q.type = f, m.updateFeedOffsetInfo()
		}), m.on("connect::logout", function() {
			a.each(b.query(".register-third"), function(a, c) {
				a.style.display != "none" && (b.hide(b.get(".register-third-panel", a)), b.show(b.get(".register-third-items", a)), b.hide(b.get(".add-comment", b.parent(a, ".feed-comment"))))
			}), q = {}, p = !1, m.updateFeedOffsetInfo()
		}), m.on("connect::ddlogin", function(c) {
			var d = c.data.formKey;
			a.each(b.query(".register-third"), function(a, c) {
				a.style.display != "none" && (b.hide(b.get(".register-third-panel", a)), b.hide(b.get(".register-third-items", a)), b.show(b.get(".add-comment", b.parent(a, ".feed-comment"))))
			}), q = {}, p = !0, window.DDformKey = d, m.updateFeedOffsetInfo()
		}), l = !0
	}
	function T(c, d) {
		function j() {
			f.block.addById(i, function() {
				a.Anim(e, "opacity:0", .3, "easeBoth", function() {
					e.parentNode.removeChild(e), e = null, 0 === b.children(g).length ? b.hide(g) : b.addClass(g.firstChild, "first-cmt"), m.updateFeedOffsetInfo()
				}).run()
			})
		}
		var e = b.parent(c, "li"),
			g = b.parent(e, "ul"),
			i = b.attr(e, "userid");
		h.Dialog.confirm({
			content: "\u786e\u5b9a\u8981\u5c06\u8be5\u7528\u6237\u52a0\u5165\u5230\u9ed1\u540d\u5355\u5417\uff1f",
			onok: j
		})
	}
	function U(a, c) {
		function j() {
			f.block.report({
				userId: i,
				postId: c.id,
				type: 1
			}, function() {
				f.globalNotify("\u4e3e\u62a5\u6210\u529f")
			})
		}
		var d = b.parent(a, "li"),
			e = b.parent(d, "ul"),
			g = b.attr(d, "user"),
			i = b.attr(d, "userid");
		h.Dialog.confirm({
			content: "\u786e\u5b9a\u8981\u4e3e\u62a5\u8be5\u7528\u6237\u5417\uff1f",
			onok: j
		})
	}
	function V(a, b, c) {
		b.toggleFooter("comment", a, function(a) {
			return B(b, a, c)
		})
	}
	function W(a, c) {
		var d = b.parent(a, ".cmt-photo");
		b.hasClass(d, "on") ? b.removeClass(d, "on") : b.addClass(d, "on");
		var e = a.src,
			f = b.attr(a, "toggle");
		a.src = f, b.attr(a, "toggle", e), X(c)
	}
	function X(c) {
		var d = 464,
			e = b.get("#feed-" + c.id);
		a.each(b.query(".cmt-photo", e), function(a) {
			var c = b.get("img", a),
				e = c.src.match(/_(\d+)_(\d+)\.([^.]+?)$/),
				f, g, h = b.hasClass(a, "on"),
				i, j = h ? d : d / 3;
			e && (g = Math.min(e[1], j), f = g / e[1] * e[2], h ? i = f : i = Math.min(f, 250)), b.css(a, {
				width: g,
				display: "block"
			}), b.css(b.get(".photo-i", a), {
				width: g,
				height: i
			}), b.css(c, {
				width: g,
				height: f
			})
		}), m.updateFeedOffsetInfo()
	}
	var k = f.url.host,
		l, m, n = {},
		o, p, q = {},
		r = k + "/notes",
		s = k + "/comment",
		t = k + "/unloginedComment",
		u = 100,
		v = 2,
		w = {
			"-1": "\u8be5\u535a\u5ba2\u5173\u95ed\u4e86\u56de\u5e94\u529f\u80fd",
			2: "\u8be5\u535a\u5ba2\u8bbe\u7f6e\u4e86\u60a8\u53ea\u6709\u5173\u6ce8\u5927\u4e8e7\u5929\u4ee5\u4e0a\u624d\u53ef\u4ee5\u56de\u5e94"
		},
		x = '<div class="feed-fold-container"><div class="feed-comment"><div class="cmt-at-list clearfix"></div><div class="add-comment clearfix" {{#if (!isLogin && !connectInfo.name)}}style="display:none;"{{/if}}><textarea autocomplete="off" cloud="type:TextInput;width:408;skin:willwhite;id:{{feedId}}input;autogrow:true;autogrowSuffix:ww,fold:0"></textarea><div class="pre-style-willsilver" cloud="type:Button;preclass:pre-style-willsilver;skin:willsilver;width:60;id:{{feedId}}publish">\u53d1\u5e03</div><div id="{{feedId}}photo-reply" class="photo-reply"></div></div><div class="register-third {{#if (!hasComment)}}noborder{{/if}}" {{#if (isLogin)}}style="display:none;"{{/if}}><div class="register-third-items clearfix" {{#if (connectInfo.name)}}style="display:none"{{/if}}><span>\u652f\u6301\u7528\u5176\u4ed6\u5e73\u53f0\u8d26\u53f7\u56de\u5e94</span><a title="\u70b9\u70b9" target="_blank" class="login-icon login-dd" href="{{root}}/login?nextUrl=http%3A%2F%2Fwww.diandian.com%2Flogin%2Fcallback">\u70b9\u70b9</a><a title="\u65b0\u6d6a\u5fae\u535a" target="_blank" class="login-icon login-sina" href="{{root}}/connectcmt/sinaweibo/authorize">\u65b0\u6d6a\u5fae\u535a</a><a title="\u4eba\u4eba\u7f51" target="_blank" class="login-icon login-renren" href="{{root}}/connectcmt/renren/authorize">\u4eba\u4eba\u7f51</a><a title="QQ\u7a7a\u95f4" target="_blank" class="login-icon login-qq" href="{{root}}/connectcmt/qzone/authorize">QQ\u7a7a\u95f4</a><a title="\u8c46\u74e3" target="_blank" class="login-icon login-douban" href="{{root}}/connectcmt/douban/authorize">\u8c46\u74e3</a></div><div class="register-third-panel" {{#if (!connectInfo.name)}}style="display:none"{{/if}}><span class="register-third-title">{{connectInfo.name}}</span><span class="register-third-logout">(<a href="/unloginedComment/logout" target="_blank">\u9000\u51fa</a>)</span><span class="register-third-sync"><input type="checkbox" name="register-third-sync" id="register-third-{{feedId}}" class="register-third-sync-input" checked/><label for="register-third-{{feedId}}"><span class="register-third-sync-title">\u540c\u6b65\u5230{{connectInfo.type}}</span></label></span></div></div><ul class="cmt-list" style="display:none;"></ul></div><div class="feed-fold-footer"><a class="J_CommentsLoading fold-btn-loading" style="display:none;">\u6b63\u5728\u52a0\u8f7d...</a><a class="J_CommentsFolder fold-btn-close" href="#" onclick="return false;"><span class="J_CommentsFolder btn-icon"></span>\u6536\u8d77</a><a class="J_GetMoreComments fold-btn-more" href="#" onclick="return false;" style="display:none;"><span class="J_GetMoreComments btn-icon"></span>\u66f4\u591a\u56de\u5e94</a></div></div>',
		y = '{{#each notes as note}}<li class="cmt-list-item clearfix {{note.firstClass}}" id="cmt-{{note.id}}" user="{{note.authorName}}" userid="{{note.authorId}}"><div class="clearfix">{{#if (note.authorUrl)}}<a href="http://{{note.authorUrl}}" target="_blank">{{/if}}{{#if (!note.authorUrl)}}<span>{{/if}}<img class="cmt-avatar" src="{{note.authorImageUrl}}" width="20" height="20">{{#if (note.authorUrl)}}</a>{{/if}}{{#if (!note.authorUrl)}}</span>{{/if}}<span class="cmt-main">{{#if (note.authorUrl)}}<a href="http://{{note.authorUrl}}" target="_blank" class="cmt-user">{{/if}}{{#if (!note.authorUrl)}}<span class="cmt-user">{{/if}}{{note.authorName}}{{#if (note.authorUrl)}}</a>{{/if}}{{#if (!note.authorUrl)}}</span>{{/if}}<span class="cmt-content">{{#if (note.replies)}}\u56de\u5e94{{#each note.replies as reply}} <a href="{{reply.url}}">{{reply.name}}</a> {{/each}}{{/if}}{{note.comment}}</span></span>{{#if (canComment == 1 && note.canReply)}}<a class="cmt-reply" data-authorId="{{note.authorId||note.authorUuid}}" data-authorName="{{note.authorName}}">\u56de\u5e94</a>{{/if}}{{#if (note.canDel)}}<a class="cmt-del" style="display:none;">\u5220\u9664</a>{{/if}}{{#if (note.canBlock)}}<a class="cmt-block" style="display:none;">\u52a0\u9ed1</a>{{/if}}{{#if (note.canReport)}}<a class="cmt-report" style="display:none;">\u4e3e\u62a5</a>{{/if}}</div>{{#if (note.photoB250)}}<div class="cmt-photo" style="display: none;"><div class="photo-i"><img src="{{note.photoB250}}" toggle="{{note.photoB500}}" class="comment-photo-hook"/></div></div>{{/if}}</li>{{/each}}',
		z = '<span class="at-item">{{name}}<span class="at-cancel" data-authorId="{{id}}">X</span></span>',
		A = {};
	e.Plugins.push({
		name: "Comment",
		init: function(c) {
			var d = {
				"feed::mouseover": b.show,
				"feed::mouseout": b.hide
			};
			return m = c, c.on("feed::click", function(a) {
				var c = a.feed,
					d = a.event.target,
					e;
				b.hasClass(d, "feed-cmt") || (e = b.hasClass(d, "J_CommentsFolder")) ? (V(d, c), e && b.scrollIntoView(c.ele)) : b.hasClass(d, "cmt-reply") ? H(d, c) : b.hasClass(d, "cmt-del") ? R(d, c) : b.hasClass(d, "at-cancel") ? I(d, c) : b.hasClass(d, "cmt-block") ? T(d, c) : b.hasClass(d, "cmt-report") ? U(d, c) : b.hasClass(d, "J_GetMoreComments") ? F(c) : b.hasClass(d, "comment-photo-hook") && W(d, c)
			}), c.on("feed::mouseover feed::mouseout", function(b) {
				var c = b.event.target,
					e, f = d[b.type];
				if (e = Q(c)) f(a.get(".cmt-del", e)), f(a.get(".cmt-block", e)), f(a.get(".cmt-report", e))
			}), {
				toggle: V
			}
		}
	})
}, {
	requires: ["dom", "event", "ajax", "feed/core", "util.$7176", "template", "sky.$6939", "sky/Dialog.$7066", "lib/photo-reply.$7176"]
}), KISSY.add("feed/notes", function(a, b, c, d, e, f) {
	function n(a, c, d) {
		var e = b.create(l);
		return d.appendChild(e), o(a, c), e
	}
	function o(d, e, j) {
		var k = e.id,
			l = b.attr(d, "data-nid"),
			m = e.lastNoteId,
			n, o = a.get(".feed-notes-body", e.footer.ele);
		j && (b.addClass(j, "J_Loading"), j.style.cursor = "default", j.innerHTML = "\u6b63\u5728\u52a0\u8f7d..."), n = {
			sPostId: l,
			postId: k,
			types: "1,2,3,4",
			count: i,
			t: +(new Date)
		}, m && (n.lastNoteId = m), c.get(h, n, function(a) {
			a.errCode ? f.alert(a.result) : ((!a.notes || 0 === a.notes.length) && !e.hasNotes ? o.innerHTML = '<div class="feed-notes-text">\u6682\u65e0\u70ed\u5ea6~</div>' : p(o, a, e, d, j), g.updateFeedOffsetInfo())
		}, "json")
	}
	function p(c, e, f, g, h) {
		var i = b.attr(g, "data-type"),
			l = !f.hasNotes,
			n = e.notes,
			o = n.length - 1,
			p, r, s, t = b.get(".J_GetMoreNotes", f.ele);
		if (o < 0) {
			h && (b.remove(h), h = null);
			return
		}
		p = d(m).render({
			first: l,
			data: n,
			dataLastIndex: o,
			postTypeText: j[i],
			typeClassMap: k
		}), f.lastNoteId = n[o].id, l ? (e.hasNext ? b.show(t) : b.hide(t), c.innerHTML = p, a.UA.ie <= 7 && b.css(c.parentNode, "zoom", "1"), f.hasNotes = !0) : (r = a.get(".feed-notes-list", c), b.removeClass(a.get(".last", r), "last"), s = b.createFragment(p), r.appendChild(s), e.hasNext ? (h.innerHTML = '<span class="btn-icon"></span>\u66f4\u591a\u70ed\u5ea6', b.attr(h, "style", ""), b.removeClass(h, "J_Loading")) : (b.remove(h), h = null)), q(f)
	}
	function q(c) {
		var d = 454,
			e = b.get("#feed-" + c.id);
		a.each(b.query(".notes-photo", e), function(a) {
			var c = b.get("img", a),
				e = c.src.match(/_(\d+)_(\d+)\.([^.]+?)$/),
				f, g, h = b.hasClass(a, "on"),
				i, j = h ? d : d / 3;
			e && (g = Math.min(e[1], j), f = g / e[1] * e[2], h ? i = f : i = Math.min(f, 250)), b.css(a, {
				width: g,
				display: "block"
			}), b.css(b.get(".photo-i", a), {
				width: g,
				height: i
			}), b.css(c, {
				width: g,
				height: f
			})
		}), g.updateFeedOffsetInfo()
	}
	var g, h = f.url.host + "/notes",
		i = 20,
		j = {
			text: "\u6587\u5b57",
			photo: "\u56fe\u7247",
			audio: "\u58f0\u97f3",
			video: "\u5f71\u50cf",
			link: "\u94fe\u63a5",
			"-1": "\u6587\u7ae0"
		},
		k = ["", "nt-fav", "nt-rt", "nt-cmt"],
		l = '<div class="feed-fold-container"><div class="feed-notes"><div class="feed-notes-body"><div class="feed-notes-text">\u6b63\u5728\u52a0\u8f7d...</div></div></div><div class="feed-fold-footer"><a class="J_NotesFolder fold-btn-close" href="#" onclick="return false;"><span class="J_NotesFolder btn-icon"></span>\u6536\u8d77</a><a class="J_GetMoreNotes fold-btn-more" href="#" onclick="return false;" style="display:none;"><span class="J_GetMoreNotes btn-icon"></span>\u66f4\u591a\u70ed\u5ea6</a></div></div>',
		m = '{{#if (first)}}<ul class="feed-notes-list">{{/if}}{{#each data as notes index}}<li class="notes-list-item {{typeClassMap[notes.type]}} clearfix{{#if (first && 0 === index)}} first{{#elseif (index === dataLastIndex)}} last{{/if}}"><div class="notes-item-hd clearfix">{{#if (notes.type == 2)}}<a target="_blank" href="http://{{notes.toBlogCName}}"><img width="20" height="20" alt="{{notes.toBlogName}}" class="notes-avatar" src="{{notes.toBlogImageUrl}}"></a>{{#else}}{{#if (notes.authorUrl)}}<a href="http://{{notes.authorUrl}}" target="_blank">{{/if}}{{#if (!notes.authorUrl)}}<span>{{/if}}<img width="20" height="20" alt="{{notes.authorName}}" class="notes-avatar" src="{{notes.authorImageUrl}}">{{#if (notes.authorUrl)}}</a>{{/if}}{{#if (!notes.authorUrl)}}</span>{{/if}}{{/if}}<span class="notes-info">{{#if (notes.type == 2)}}<a target="_blank" class="notes-user" href="//{{notes.toBlogCName}}">{{notes.toBlogName}}</a>{{#else}}{{#if (notes.authorUrl)}}<a href="http://{{notes.authorUrl}}" target="_blank" class="notes-user">{{/if}}{{#if (!notes.authorUrl)}}<span class="notes-user">{{/if}}{{notes.authorName}}{{#if (notes.authorUrl)}}</a>{{/if}}{{#if (!notes.authorUrl)}}</span>{{/if}}{{/if}}{{#if (notes.type == 1)}}' + a.format("\u5f88\u559c\u6b22\u6b64{0}", "{{postTypeText}}") + "{{#elseif (notes.type == 2)}}" + a.format("\u4ece{0}\u8f6c\u8f7d\u4e86\u6b64{1}", '&nbsp;<a target="_blank" href="http://{{notes.fromBlogCName}}/post/{{notes.fromPostId}}">{{notes.fromBlogName}}</a>&nbsp;', "{{postTypeText}}") + "{{#elseif (notes.type == 3)}}" + "{{#if (notes.replies)}}" + a.format("\u5728{0}\u56de\u5e94\u4e86 {1}", '&nbsp;<a target="_blank" href="http://{{notes.fromBlogCName}}/post/{{notes.fromPostId}}">{{notes.fromBlogName}}</a>&nbsp;', '{{#each notes.replies as reply}}<a href="{{reply.url}}">{{reply.name}}</a> {{/each}}') + "{{#else}}" + a.format("\u5728{0}\u56de\u5e94\u4e86\u6b64{1}", '&nbsp;<a target="_blank" href="http://{{notes.fromBlogCName}}/post/{{notes.fromPostId}}">{{notes.fromBlogName}}</a>&nbsp;', "{{postTypeText}}") + "{{/if}}" + "{{#elseif (notes.type == 4)}}" + a.format("\u5c06\u8be5{1}\u63a8\u8350\u5230\u4e86{0}\u6807\u7b7e\u4e0b", '&nbsp;<a target="_blank" href="http://www.diandian.com{{notes.tagUrl}}">{{notes.tag}}</a>&nbsp;', "{{postTypeText}}") + "{{/if}}" + "</span>" + '<s class="notes-icon"></s>' + "</div>" + '{{#if (notes.comment && notes.comment !== "&nbsp;")}}<div class="notes-comment">{{notes.comment}}</div>{{/if}}' + '{{#if (notes.photoB250)}}<div class="notes-photo-o"><div class="notes-photo" style="display: none;">' + '<div class="photo-i"><img src="{{notes.photoB250}}" toggle="{{notes.photoB500}}" class="notes-photo-hook"/></div>' + "</div></div>{{/if}}" + "</li>" + "{{/each}}" + "{{#if (first)}}</ul>{{/if}}";
	e.Plugins.push({
		name: "Notes",
		init: function(c) {
			function d(a, c) {
				var d = b.parent(a, ".notes-photo");
				b.hasClass(d, "on") ? b.removeClass(d, "on") : b.addClass(d, "on");
				var e = a.src,
					f = b.attr(a, "toggle");
				a.src = f, b.attr(a, "toggle", e), q(c)
			}
			function e(a) {
				var b = a.match(/(热度|回应)\(?([\d|\+]*)\)?/),
					c, d;
				return b ? (c = b[2]) ? c == "100+" ? b[0] : (d = parseInt(c) + 1, b[0].replace(c, d)) : b[0] + "(1)" : ""
			}
			function h(a) {
				var b = a.match(/(热度|回应)\(?([\d]*)\)?/),
					c, d;
				if (!b) return "";
				if ( !! (c = b[2])) return c == "100+" ? b[0] : (d = parseInt(c) - 1, d <= 0 ? b[0].replace("(" + c + ")", "") : b[0].replace(c, d))
			}
			function i(b) {
				var c = a.get(".feed-nt", b.ele);
				!c || (c.innerHTML = e(c.innerHTML)), b.updateFooterTrianglePos()
			}
			function j(c) {
				var d = a.get(".feed-nt", c.ele);
				!d || (d.innerHTML = h(d.innerHTML), d.innerHTML == "\u70ed\u5ea6" && (b.hide(d), b.hide(c.footer.ele), b.removeClass(c.ele, "feed-expand"))), c.updateFooterTrianglePos()
			}
			function k(b) {
				var c = a.get(".feed-cmt", b.ele);
				!c || (c.innerHTML = e(c.innerHTML)), b.updateFooterTrianglePos()
			}
			function l(b) {
				var c = a.get(".feed-cmt", b.ele);
				!c || (c.innerHTML = h(c.innerHTML)), b.updateFooterTrianglePos()
			}
			g = c, c.on("feed::click", function(c) {
				var e = c.event.target,
					f = c.feed,
					g;
				b.hasClass(e, "feed-nt") || (g = b.hasClass(e, "J_NotesFolder")) ? (f.toggleFooter("notes", e, function(a) {
					return n(e, f, a)
				}), g && b.scrollIntoView(f.ele)) : b.hasClass(e, "J_GetMoreNotes") && !b.hasClass(e, "J_Loading") ? o(a.get(".feed-nt", f.ele), f, e) : b.hasClass(e, "notes-photo-hook") && d(e, f)
			}), f.Dispatcher.on("post::addComment", function(a) {
				if (!a.feed) return;
				i(a.feed), k(a.feed)
			}), f.Dispatcher.on("post::delComment", function(a) {
				if (!a.feed) return;
				j(a.feed), l(a.feed)
			}), f.Dispatcher.on("post::like", function(a) {
				if (!a.feed) return;
				i(a.feed)
			}), f.Dispatcher.on("post::unlike", function(a) {
				if (!a.feed) return;
				j(a.feed)
			})
		}
	})
}, {
	requires: ["dom", "ajax", "template", "feed/core", "util.$7176"]
}), KISSY.add("feed/actions", function(a, b, c, d, e, f, g, h) {
	function z(b) {
		function c() {
			d.post(p, {
				feed_id: b.id
			}, function(c) {
				c.errCode >= 0 ? (a.Anim(b.ele, "opacity:0", .5, "easeBoth", function() {
					i.removeFeed(b), b = null
				}).run(), e(b)) : g.alert(res.result)
			}, "json")
		}
		function e(b) {
			var c = a.get("div.feed", "#feed-list"),
				d = a.one("#J_readmark");
			c == b.ele && a.one(b.ele).next().hasClass("readmark-wrapper") && d.animate({
				opacity: 0
			}, .5, "easeBoth", function() {
				d.remove()
			})
		}
		h.Dialog.confirm({
			content: "\u786e\u8ba4\u5220\u9664\u8fd9\u7bc7\u6587\u7ae0\u5417\uff1f",
			onok: c
		})
	}
	function A(a, c, e) {
		function h(c, d) {
			function i() {
				f < e ? (b.addClass(a, c[f]), f > 0 && b.removeClass(a, c[f - 1]), f += 1, setTimeout(function() {
					i()
				}, 50)) : d()
			}
			var e = c.length,
				f = 0,
				g, h;
			i()
		}
		var f;
		if (b.hasClass(a, "J_ActionLock")) return;
		b.addClass(a, "J_ActionLock"), "add" === e ? (f = q, g.Dispatcher.fire("post::like", {
			feed: c
		})) : (f = q + "/remove", g.Dispatcher.fire("post::unlike", {
			feed: c
		})), d.post(f, {
			feed_id: c.id
		}, function(c) {
			if (c.errCode == 0) {
				if ("add" === e) return h(["faved", "faved-frame1", "faved-frame2", "faved-frame1", "faved", "faved-frame1", "faved-frame2", "faved-frame1", "faved"], function() {
					b.removeClass(a, "J_ActionLock")
				}), !1;
				b.removeClass(a, "faved")
			} else g.alert(c.result);
			b.removeClass(a, "J_ActionLock")
		}, "json")
	}
	function B(a, c) {
		function f() {
			d.post(t, {
				postId: c.id
			}, function(a) {
				g.globalNotify("\u7f6e\u9876\u6210\u529f"), setTimeout(function() {
					window.location.reload()
				}, 1e3)
			})
		}
		var e = b.attr(a, "data-topid");
		e ? h.Dialog.confirm({
			content: "\u786e\u5b9a\u8981\u66ff\u6362\u5df2\u7f6e\u9876\u7684\u6587\u7ae0\u5417\uff1f",
			onok: f
		}) : f()
	}
	function C(a, b) {
		function c() {
			d.post(u, {
				postId: b.id
			}, function(a) {
				g.globalNotify("\u53d6\u6d88\u7f6e\u9876\u6210\u529f"), setTimeout(function() {
					window.location.reload()
				}, 1e3)
			})
		}
		h.Dialog.confirm({
			content: "\u786e\u5b9a\u8981\u53d6\u6d88\u7f6e\u9876\u8fd9\u7bc7\u6587\u7ae0\u5417\uff1f",
			onok: c
		})
	}
	function D(b, c, e) {
		function f() {
			d.post(r, {
				postId: c.id
			}, function(b) {
				a.Anim(c.ele, "opacity:0", .5, "easeBoth", function() {
					i.removeFeed(c), c = null
				}).run()
			})
		}!0 !== e ? h.Dialog.confirm({
			content: "\u662f\u5426\u5c06\u8fd9\u4e2a\u535a\u5ba2\u52a0\u5165\u9ed1\u540d\u5355\uff1f",
			onok: f
		}) : f()
	}
	function E(a, c) {
		function f() {
			g.block.report({
				userId: d,
				postId: c.id,
				type: 0
			}, function() {
				g.globalNotify("\u4e3e\u62a5\u6210\u529f")
			})
		}
		var d = b.attr(a, "data-user-id"),
			e = b.attr(a, "data-blog-url");
		h.Dialog.confirm({
			content: "\u786e\u5b9a\u8981\u4e3e\u62a5\u8be5\u6587\u7ae0\u5417\uff1f",
			onok: f
		})
	}
	function F() {
		a.each(i.feeds, function(c) {
			var d, f, g, h, i;
			h = y[c.blogId], !c.blogAvatar || (h.visitUrl = c.blogAvatar.href + "menu");
			if (!c._blogMenuInit && "follow" in h) {
				c._blogMenuInit = !0, i = c.ele;
				if (g = a.get(".blog-menu-info", i)) h.canInbox ? d = e(x).render(h) : d = e(w).render(h), f = b.create(d), b.addClass(g, "enable"), b.append(f, g)
			}
		})
	}
	var i, j, k = 6 === a.UA.ie,
		l = [10, 50],
		m = 15,
		n = .6,
		o = g.url.host,
		p = o + "/delete",
		q = o + "/fav",
		r = o + "/wall/new/block",
		s = o + "/blog/followstatus",
		t = o + "/setPostTop",
		u = o + "/unsetPostTop",
		v = "unkownen",
		w = '<div class="blog-menu pop-menu-list-holder"><div class="pop-menu-list-inner"><div class="pop-menu-list-triangle"></div><ul class="pop-menu-list mini"><li class="first">{{#if (follow)}}<a class="J_BlogFollowAction follow-special unfollow" title="\u53d6\u6d88\u5173\u6ce8">\u53d6\u6d88\u5173\u6ce8</a>{{#else}}<a class="J_BlogFollowAction follow-special follow" title="\u5173\u6ce8">\u5173\u6ce8</a>{{/if}}</li><li class="last"><a target="_blank" class="J_BlogVisitAction" href="{{visitUrl}}" title="\u8bbf\u95ee\u535a\u5ba2">\u8bbf\u95ee\u535a\u5ba2</a></li></ul></div></div>',
		x = '<div class="blog-menu pop-menu-list-holder"><div class="pop-menu-list-inner"><div class="pop-menu-list-triangle"></div><ul class="pop-menu-list mini"><li class="first"><a class="J_BlogInboxAction" data-url="{{inboxUrl}}" title="\u53d1\u79c1\u4fe1">\u53d1\u79c1\u4fe1</a></li><li>{{#if (follow)}}<a class="J_BlogFollowAction follow-special unfollow" title="\u53d6\u6d88\u5173\u6ce8">\u53d6\u6d88\u5173\u6ce8</a>{{#else}}<a class="J_BlogFollowAction follow-special follow" title="\u5173\u6ce8">\u5173\u6ce8</a>{{/if}}</li><li class="last"><a class="J_BlogVisitAction" {{#if (visitUrl)}} data-url="{{visitUrl}}" {{/if}} title="\u8bbf\u95ee\u535a\u5ba2">\u8bbf\u95ee\u535a\u5ba2</a></li></ul></div></div>',
		y = {};
	f.Plugins.push({
		name: "FeedAction",
		init: function(e, f) {
			var h, j;
			i = e, e.on("feed::click", function(a) {
				var c = a.event.target,
					d = a.feed;
				if (b.hasClass(c, "feed-not-login")) return;
				if (b.hasClass(c, "feed-del")) z(d);
				else if (b.hasClass(c, "faved")) A(c, d, "remove");
				else if (b.hasClass(c, "feed-fav")) A(c, d, "add");
				else if (b.hasClass(c, "feed-block")) D(c, d, f.blockFeedSilent);
				else if (b.hasClass(c, "feed-report")) E(c, d);
				else if (b.hasClass(c, "feed-top")) B(c, d);
				else if (b.hasClass(c, "feed-untop")) C(c, d);
				else if (b.hasClass(c, "J_BlogFollowAction")) d._followDisabled || (d._followDisabled = !0, b.hasClass(c, "follow") ? g.follow.follow(d.blogId, function() {
					c.title = "\u53d6\u6d88\u5173\u6ce8", c.innerHTML = "\u53d6\u6d88\u5173\u6ce8", b.removeClass(c, "follow"), b.addClass(c, "unfollow"), d._followDisabled = !1
				}) : g.follow.unfollow(d.blogId, function() {
					c.title = "\u5173\u6ce8", c.innerHTML = "\u5173\u6ce8", b.removeClass(c, "unfollow"), b.addClass(c, "follow"), d._followDisabled = !1
				}));
				else if (b.hasClass(c, "J_BlogInboxAction") || b.hasClass(c, "J_BlogVisitAction")) {
					var e = b.attr(c, "data-url"); !! e && window.open(e)
				}
			}), a.one(document).delegate("mouseenter", ".blog-menu-info", function(b) {
				var c = a.one(b.currentTarget),
					d = a.one(".blog-menu", c),
					e = a.one("ul.pop-menu-list", d),
					f = e.children().length * 23;
				d.fadeIn(.2), e.first("li").css({
					"margin-top": -f
				}).animate({
					"margin-top": 0
				}, .2)
			}), a.one(document).delegate("mouseleave", ".blog-menu-info", function(b) {
				var c = a.one(b.currentTarget),
					d = a.one(".blog-menu", c),
					e = a.one("ul.pop-menu-list", d),
					f = e.children().length * 23;
				d.fadeOut(.2), e.first("li").animate({
					"margin-top": -f
				}, .2)
			}), e.on("feedlist::update", function(e) {
				var f = [];
				a.each(e.updateList, function(d) {
					var e = a.get(".blog-menu-info", d.ele),
						g = b.attr(e, "data-id"),
						h, i = b.attr(e, "data-follow"),
						j = b.attr(e, "data-canInbox");
					a.UA.ie < 7 && c.on(a.get(".feed-avatar", d.ele), "mouseenter mouseleave", function(a) {
						var c = "mouseenter" === a.type ? b.addClass : b.removeClass;
						c(this, "hover")
					}), d.blogId = g, (h = y[g]) || (h = y[g] = {}, h.ele = e), v === i ? !h.follow && a.indexOf(g, f) < 0 && f.push(g) : (h = y[g], h.follow = "true" === i), j === "true" && (h.canInbox = !0, h.inboxUrl = b.attr(e, "data-inbox"))
				}), f.length > 0 && d.post(s, {
					blogIds: f.join(",")
				}, function(a) {
					var b, c;
					for (b in a) a.hasOwnProperty(b) && (c = y[b], c.follow = a[b]);
					F()
				}), F()
			}), e.on("feed::mouseenter feed::mouseleave", function(c) {
				var d = c.event.target,
					e = c.feed,
					f;
				f = "feed::mouseenter" === c.type ? b.show : b.hide, f(a.query(".hover-item", e.ele))
			}), c.delegate(document, "mouseenter", "#J_readmark", function() {
				b.addClass("#J_readmark", "readmark-hover")
			}), c.delegate(document, "mouseleave", "#J_readmark", function() {
				b.removeClass("#J_readmark", "readmark-hover")
			}), g.Dispatcher.on("newbie-reblog-show", function(c) {
				var d = a.get("#" + c.id);
				b.addClass(d, "guide-tip-fixed")
			}), g.Dispatcher.on("newbie-reblog-hide", function(c) {
				var d = a.get("#" + c.id);
				b.removeClass(d, "guide-tip-fixed")
			})
		}
	})
}, {
	requires: ["dom", "event", "ajax", "template", "feed/core", "util.$7202", "sky.$6939", "sky/Dialog.$7202", "node"]
}), KISSY.add("feed/notloginsupport", function(a, b, c, d, e, f, g, h) {
	function v(b, c, d) {
		var e = a.get(".feed-cmt-not-login-login-button", b),
			f = c.id,
			g = d == "reblog" ? o : p;
		e.href = q + encodeURIComponent(g.replace(/\{\{feedId\}\}/g, c.id))
	}
	var i = window.location,
		j = g.url.host,
		k, l, m, n, o = j + "/reblog/{{feedId}}",
		p = j + i.pathname + "?firstfeed={{feedId}}",
		q = j + "/login?nextUrl=",
		r, s = '<div class="feed-cmt-not-login clearfix"><div class="icons clearfix"><a title="\u70b9\u70b9" class="login-icon login-dd" href="/login/fav?p={feedId}">\u70b9\u70b9</a><a title="\u65b0\u6d6a\u5fae\u535a" target="_blank" class="login-icon login-sina" href="http://www.diandian.com/connectcmt/sinaweibo/authorize">\u65b0\u6d6a\u5fae\u535a</a><a title="\u4eba\u4eba\u7f51" target="_blank" class="login-icon login-renren" href="http://www.diandian.com/connectcmt/renren/authorize">\u4eba\u4eba\u7f51</a><a title="QQ\u7a7a\u95f4" target="_blank" class="login-icon login-qq" href="http://www.diandian.com/connectcmt/qzone/authorize">QQ\u7a7a\u95f4</a><a title="\u8c46\u74e3" target="_blank" class="login-icon login-douban" href="http://www.diandian.com/connectcmt/douban/authorize">\u8c46\u74e3</a></div></div>',
		t = '<div class="feed-cmt-not-login connectUserInfo" id="connectUserInfo">{{#if url}}<a href="http://{{url}}" target="_blank" class="info"><img src="{{picUrl}}" width="20" height="20"></a>{{#else}}<span class="info"><img src="{{picUrl}}" width="20" height="20"></span>{{/if}}{{#if url}}<a class="info" href="http://{{url}}" target="_blank">{{name}}(<span id="connectUserName" class="connect-target-hook">{{connectTarget}}</span>)</a>{{#else}}<span class="info">{{name}}(<span id="connectUserName" class="connect-target-hook">{{connectTarget}}</span>)</span>{{/if}}<a href="/unloginedComment/logout" target="_blank" class="logout">\u9000\u51fa</a><span class="share"><input name="connect-share" id="connect-share" type="checkbox" checked/><label for="connect-share">\u5206\u4eab\u559c\u6b22\u5230<span class="connect-target-hook">{{connectTarget}}</span></label></span></div>',
		u = '<div class="feed-fold-container"><div class="feed-comment"><div class="feed-cmt-not-login clearfix">\u60a8\u9700\u8981\u767b\u5f55\u540e\u624d\u53ef\u4ee5\u64cd\u4f5c <a href="/login" class="feed-cmt-not-login-login-button" title="\u767b\u5f55">\u767b\u5f55</a> | <a href="' + j + '/j/325" target="_blank" class="feed-cmt-not-login-reg-button" title="\u7acb\u5373\u6ce8\u518c">\u7acb\u5373\u6ce8\u518c</a>' + "</div>" + "</div>" + '<div class="feed-fold-footer">' + '<a class="feed-not-login J_NotLoginReblogFolder fold-btn-close" href="#" onclick="return false;"><span class="J_NotLoginReblogFolder btn-icon"></span>\u6536\u8d77</a>' + "</div>" + "</div>";
	f.Plugins.push({
		name: "NotLoginSupport",
		init: function(a) {
			var c = b.createFragment(s),
				e = b.create(u),
				f = this;
			k = a, this._initConnectUserInfo(), this._initFavCallback(), a.on("feed::click", function(a) {
				var c = a.event.target,
					h = a.feed,
					i;
				b.hasClass(c, "feed-not-login") && (b.hasClass(c, "feed-fav") ? b.hasClass(c, "faved") ? d({
					type: "post",
					url: g.url.host + "/unloginedFav/remove",
					data: {
						feed_id: h.id
					},
					success: function() {
						b.removeClass(c, "faved")
					}
				}) : f._createFavDialog(h.id, c) : (b.hasClass(c, "feed-rt") || b.hasClass(c, "J_NotLoginReblogFolder")) && h.toggleFooter("reblog", c, function(a) {
					return i = e.cloneNode(!0), a.appendChild(i), v(i, h, "reblog"), i
				}))
			})
		},
		_initConnectUserInfo: function() {
			var a = {
				SINA_WEIBO: "\u65b0\u6d6a\u5fae\u535a",
				DOUBAN: "\u8c46\u74e3",
				Renren: "\u4eba\u4eba",
				QZONE: "QQ"
			},
				b = ENV.connectUserInfo;
			ENV.__connect_callback = function(b) {
				b.connectTarget = a[b.connectTarget], b.url = b.url || "", k.fire("connect::callback", {
					data: b
				})
			}, ENV.__connect_ddlogin = function(a) {
				k.fire("connect::ddlogin", {
					formKey: a
				})
			}, ENV.__connect_logout = function() {
				k.fire("connect::logout")
			}, b && (b.connectTarget = a[b.connectTarget], b.url = b.url || "")
		},
		_initFavCallback: function() {
			var a = this,
				c = function(b) {
					ENV.connectUserInfo = b.data || null;
					if (!r) return;
					l.hide(), a._createFavDialog()
				};
			k.on("connect::callback", c), k.on("connect::logout", function(a) {
				c(a), b.removeClass(".feed-fav", "faved")
			})
		},
		_createFavDialog: function(a, b) {
			l = h.Dialog.alert(this.getFavDialogConfig(a, b)), l.on("hide", function() {
				r = !1, l.__dispose()
			})
		},
		getFavDialogConfig: function(c, f) {
			var h = !! ENV.connectUserInfo,
				i = {};
			return r = !0, c ? m = c : c = m, f ? n = f : f = n, h ? (i.title = "\u786e\u8ba4\u559c\u6b22\u6b64\u56fe\u7247", i.content = e(t).render(ENV.connectUserInfo), i.onok = function() {
				var a = b.get("#connect-share").checked ? "true" : "false";
				return d({
					type: "post",
					data: {
						feed_id: c,
						syncFav: a
					},
					url: "/unloginedFav",
					success: function(a) {
						a.errCode == 0 ? b.addClass(f, "faved") : g.alert(a.result)
					}
				}), l.hide(), !1
			}) : (i.title = "\u652f\u6301\u4ee5\u4e0b\u8d26\u53f7\u559c\u6b22", i.content = a.substitute(s, {
				feedId: c
			}), i.onok = function() {
				return l.hide(), !1
			}), i
		}
	})
}, {
	requires: ["dom", "event", "ajax", "template", "feed/core", "util.$6855", "sky.$6855", "sky/Dialog.$6855"]
}), KISSY.add("feed/editorsupport", function(a, b, c, d, e, f, g) {
	var h = e.url.host + "/editor",
		i = a.one,
		j = a.all;
	d.Plugins.push({
		name: "EditorSupport",
		init: function(d, f) {
			var k = f.currentTag;
			if (!k) return;
			d.on("feed::click", function(f) {
				var l = f.event.target,
					m = f.feed,
					n = m.ele;
				if (b.hasClass(l, "editor-block")) c.post(h + "/block", {
					postId: m.id,
					tag: decodeURIComponent(k)
				}, function() {
					a.Anim(n, "opacity:0", .5, "easeBoth", function() {
						d.removeFeed(m)
					}).run()
				});
				else if (b.hasClass(l, "editor-ex-slide")) {
					var o = j("a.editor-ex-btn", n);
					b.hasClass(l, "editor-ex-btn-hide") ? (o.fadeOut(.3), b.removeClass(l, "editor-ex-btn-hide")) : (o.fadeIn(.3), b.addClass(l, "editor-ex-btn-hide"))
				} else if (b.hasClass(l, "editor-promote")) c.post(h + "/pick", {
					postId: m.id,
					tag: decodeURIComponent(k)
				}, function() {
					e.globalNotify("\u63a8\u8350\u6210\u529f"), b.hide(b.query(".editor-ex-control", n)), i("div.editor-control-panel", n).addClass("editor-control-panel-ext"), i(l).hide().html("\u5df2\u63a8\u8350").replaceClass("editor-promote", "editor-promoted").css({
						top: "-42px"
					}).show().animate({
						top: "0px"
					}, .3, "easeBoth")
				});
				else if (b.hasClass(l, "editor-promote-cancel")) c.post(h + "/unpick", {
					postId: m.id,
					tag: decodeURIComponent(k)
				}, function() {
					e.globalNotify("\u53d6\u6d88\u63a8\u8350\u6210\u529f"), i(l).addClass("editor-animite").animate({
						top: "-42px"
					}, .3, "easeBoth", function() {
						i(l).css({
							top: "0px"
						}).hide().removeClass("editor-animite"), i("div.editor-control-panel", n).removeClass("editor-control-panel-ext"), i(".editor-promoted", n).html("\u63a8\u8350").replaceClass("editor-promoted", "editor-promote").add(b.query(".editor-ex-control", n)).show()
					})
				});
				else if (b.hasClass(l, "editor-black")) c.post(h + "/blacklist", {
					blogId: b.attr(l, "blog"),
					tag: decodeURIComponent(k)
				}, function() {
					e.globalNotify("\u52a0\u9ed1\u6210\u529f")
				});
				else if (b.hasClass(l, "editor-block-top10")) c.post(h + "/hottag/block", {
					postId: m.id,
					tag: decodeURIComponent(k)
				}, function() {
					a.Anim(n, "opacity:0", .5, "easeBoth", function() {
						d.removeFeed(m)
					}).run()
				});
				else if (b.hasClass(l, "editor-unblock-top10")) c.post(h + "/hottag/unblock", {
					postId: m.id,
					tag: decodeURIComponent(k)
				}, function() {
					e.globalNotify("\u6062\u590d\u5341\u5927\u6210\u529f"), b.hide(l)
				});
				else if (b.hasClass(l, "editor-pick")) {
					var p = b.attr(l, "data-tags"),
						q = p.split(","),
						r = [];
					'<input type="radio" cloud="type:Radio;value:{{tag}}" /></div>', r.push('<div class="editor-pick-list clearfix">'), a.each(q, function(b, c) {
						b = decodeURIComponent(a.trim(b)), r.push('<span class="editor-pick-item"><input type="radio" name="pick-tag" cloud="type:Radio;id:pick-tag-' + m.id + c + '" ' + (c === 0 ? 'checked="checked"' : "") + ' value="' + b + '" title="' + b + '" /></span>')
					}), r.push("</div>");

					function s(a) {
						var b = g.get("pick-tag-" + m.id + "0").getGroup().getValue();
						return c.post(h + "/pick", {
							postId: m.id,
							tag: decodeURIComponent(b)
						}, function() {
							e.globalNotify("\u91c7\u7f16\u6210\u529f"), a.hide(), a.dispose()
						}), !1
					}
					g.Dialog.confirm({
						title: "\u91c7\u7f16",
						content: r.join(""),
						onok: s
					})
				} else if (b.hasClass(l, "editor-warning")) {
					var t = b.attr(l, "data-blogname"),
						u = {
							radioReason1: "\u5185\u5bb9\u4e0e\u6807\u7b7e\u4e0d\u7b26\uff0c\u8bf7\u5408\u7406\u4f7f\u7528\u6807\u7b7e",
							radioReason2: "\u8bf7\u6ce8\u610f\u6587\u7ae0\u5185\u5bb9\u8d28\u91cf\u54e6\u3002",
							radioReason3: "\u8bf7\u52ff\u6ee5\u53d1\u5e7f\u544a\uff0c\u5171\u540c\u7ef4\u62a4\u6807\u7b7e\u6c1b\u56f4"
						};
					contentTpl = '<dl class="editor-warning-body"><dd><input type="radio" name="warning-reason" value="1" cloud="type:Radio;id:radioReason1" checked="checked" /></dd><dd><input type="radio" name="warning-reason" value="2" cloud="type:Radio;id:radioReason2" /></dd><dd><input type="radio" name="warning-reason" value="3" cloud="type:Radio;id:radioReason3" /></dd><dd><input type="radio" name="warning-reason" value="custom" cloud="type:Radio;id:radioReasonCustom" /><input type="text" cloud="type:TextInput;id:textCustomReason;skin:willwhite-lite;width:185" placeholder="\u81ea\u5b9a\u4e49\u539f\u56e0\uff08\u6700\u591a\u586b\u519915\u5b57\uff09" /></dd><dd class="error-tips"></dd>', "</dl>", footTpl = '<div cloud="type:Button;id:warning-reason-ok;skin:willblue;width:60">\u786e\u5b9a</div><div cloud="type:Button;id:warning-reason-cancel;skin:willlight;width:60">\u53d6\u6d88</div>', dialog = g.create("Dialog", {
						id: "warningDialog",
						skin: "willwhite",
						width: 500,
						closeButton: 1,
						mask: {
							level: 3
						}
					}), dialog.on("show", function() {
						dialog.setTitle(a.format("\u8bf7\u586b\u5199\u7ed9 {0} \u7684\u8b66\u544a\u5185\u5bb9", t)), dialog.setContent(contentTpl), dialog.getFoot().innerHTML = footTpl, g.init(this.getLayer().main), a.each(u, function(a, b) {
							var c = g.get(b);
							c.setValue(a), c.setTitle(a)
						});
						var d = g.get("warning-reason-ok"),
							f = g.get("warning-reason-cancel"),
							i = g.get("radioReasonCustom"),
							j = g.get("textCustomReason"),
							l = b.get(".error-tips", this.getLayer().main),
							n = i.getGroup(),
							o, p;
						f.on("click", function() {
							dialog.hide()
						}), d.on("click", function() {
							b.hide(l), o = n.getValue();
							if (o == "custom") {
								p = j.getValue();
								if (p == "") {
									l.innerHTML = "\u8bf7\u5148\u586b\u5199\u8b66\u544a\u5185\u5bb9\u54e6\uff01", b.show(l);
									return
								}
								if (p.length > 15) {
									l.innerHTML = "\u8b66\u544a\u539f\u56e0\u6700\u591a\u586b\u519915\u4e2a\u5b57", b.show(l);
									return
								}
							} else p = o;
							c.post(h + "/warning", {
								postId: m.id,
								tag: decodeURIComponent(k),
								reason: p
							}, function(a) {
								a == "0" ? (e.globalNotify("\u8b66\u544a\u6210\u529f"), dialog.hide()) : (l.innerHTML = "\u670d\u52a1\u5668\u5f00\u5c0f\u5dee\u5566\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5\uff01", b.show(l))
							})
						}), j.on("focus", function() {
							i.setChecked(!0)
						})
					}), dialog.on("hide", function() {
						this.dispose()
					}), dialog.show()
				}
			}), d.on("feed::mouseover", function(a) {
				var c = a.event.target,
					d = a.feed,
					e = d.ele;
				b.hasClass(c, "editor-promoted") && (i(".editor-promote-cancel", e).fadeIn(.2), i(c).fadeOut(.2))
			}), d.on("feed::mouseout", function(a) {
				var c = a.event.target,
					d = a.feed,
					e = d.ele;
				b.hasClass(c, "editor-promote-cancel") && !b.hasClass(c, "editor-animite") && (i(".editor-promoted", e).fadeIn(.2), i(c).fadeOut(.2))
			})
		}
	})
}, {
	requires: ["dom", "ajax", "feed/core", "util.$6373", "template", "sky.$6260", "sky/Dialog.$6373", "node"]
}), KISSY.add("feed/rankInHotTag", function(a, b, c) {
	function j() {
		var c = e(".feed", h),
			d = a.filter(c, function(a) {
				return !b.hasClass(a, "user-repeat")
			});
		return d
	}
	function k(b) {
		a.each(b, function(b, c) {
			var e = d(".feed-avatar", b),
				h = g(a.substitute(i, {
					index: c + 1
				}));
			f(h, e)
		})
	}
	var d = b.get,
		e = b.query,
		f = b.append,
		g = b.create,
		h = "#feed-list",
		i = "<span class='rank-list'>{index}</span>";
	c.Plugins.push({
		name: "RankInHotTag",
		init: function() {
			var a = j();
			k(a)
		}
	})
}, {
	requires: ["dom", "feed/core"]
}), KISSY.add("lib/feed", function(a, b) {
	return b
}, {
	requires: ["feed/core.$5820", "feed/actions.$7227", "feed/infiniteload.$6839", "feed/imagelazyload.$4556", "feed/imagesupport.$7116", "feed/audiosupport.$6680", "feed/videosupport.$6496", "feed/scrolltopbutton.$6973", "feed/keyboardshortcut.$5987", "feed/hoverlink.$7204", "feed/comment.$7176", "feed/notes.$7176", "feed/notloginsupport.$6892", "feed/editorsupport.$6380", "feed/rankInHotTag.$4055"]
});