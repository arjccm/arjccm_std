!
function e(t, i, n) {
    function r(s, o) {
        if (!i[s]) {
            if (!t[s]) {
                var u = "function" == typeof require && require;
                if (!o && u) return u(s, !0);
                if (a) return a(s, !0);
                var d = new Error("Cannot find module '" + s + "'");
                throw d.code = "MODULE_NOT_FOUND",
                d
            }
            var l = i[s] = {
                exports: {}
            };
            t[s][0].call(l.exports,
            function(e) {
                var i = t[s][1][e];
                return r(i ? i: e)
            },
            l, l.exports, e, t, i, n)
        }
        return i[s].exports
    }
    for (var a = "function" == typeof require && require,
    s = 0; s < n.length; s++) r(n[s]);
    return r
} ({
    1 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var r = function() {
            function e(e, t) {
                var i = [],
                n = !0,
                r = !1,
                a = void 0;
                try {
                    for (var s, o = e[Symbol.iterator](); ! (n = (s = o.next()).done) && (i.push(s.value), !t || i.length !== t); n = !0);
                } catch(e) {
                    r = !0,
                    a = e
                } finally {
                    try { ! n && o.
                        return && o.
                        return ()
                    } finally {
                        if (r) throw a
                    }
                }
                return i
            }
            return function(t, i) {
                if (Array.isArray(t)) return t;
                if (Symbol.iterator in Object(t)) return e(t, i);
                throw new TypeError("Invalid attempt to destructure non-iterable instance")
            }
        } (),
        a = e(27),
        s = n(a),
        o = function(e, t) {
            for (var i = e.cues,
            n = 0; n < i.length; n++) {
                var r = i[n];
                if (t >= r.adStartTime && t <= r.adEndTime) return r
            }
            return null
        },
        u = function(e, t) {
            var i = arguments.length <= 2 || void 0 === arguments[2] ? 0 : arguments[2];
            if (e.segments) for (var n = i,
            a = void 0,
            u = 0; u < e.segments.length; u++) {
                var d = e.segments[u];
                if (a || (a = o(t, n + d.duration / 2)), a) {
                    if ("cueIn" in d) {
                        a.endTime = n,
                        a.adEndTime = n,
                        n += d.duration,
                        a = null;
                        continue
                    }
                    if (n < a.endTime) {
                        n += d.duration;
                        continue
                    }
                    a.endTime += d.duration
                } else if ("cueOut" in d && (a = new s.
            default.VTTCue(n, n + d.duration, d.cueOut), a.adStartTime = n, a.adEndTime = n + parseFloat(d.cueOut), t.addCue(a)), "cueOutCont" in d) {
                    var l = void 0,
                    f = void 0,
                    c = d.cueOutCont.split("/").map(parseFloat),
                    h = r(c, 2);
                    l = h[0],
                    f = h[1],
                    a = new s.
                default.VTTCue(n, n + d.duration, ""),
                    a.adStartTime = n - l,
                    a.adEndTime = a.adStartTime + f,
                    t.addCue(a)
                }
                n += d.duration
            }
        };
        i.
    default = {
            updateAdCues: u,
            findAdCue: o
        },
        t.exports = i.
    default
    },
    {}],
    2 : [function(e, t, i) {
        "use strict";
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var n = function(e, t) {
            return e.start(t) + "-" + e.end(t)
        },
        r = function(e, t) {
            var i = e.toString(16);
            return "00".substring(0, 2 - i.length) + i + (t % 2 ? " ": "")
        },
        a = function(e) {
            return e >= 32 && e < 126 ? String.fromCharCode(e) : "."
        },
        s = {
            hexDump: function(e) {
                for (var t = Array.prototype.slice.call(e), i = 16, n = "", s = void 0, o = void 0, u = 0; u < t.length / i; u++) s = t.slice(u * i, u * i + i).map(r).join(""),
                o = t.slice(u * i, u * i + i).map(a).join(""),
                n += s + " " + o + "\n";
                return n
            },
            tagDump: function(e) {
                return s.hexDump(e.bytes)
            },
            textRanges: function(e) {
                var t = "",
                i = void 0;
                for (i = 0; i < e.length; i++) t += n(e, i) + " ";
                return t
            }
        };
        i.
    default = s,
        t.exports = i.
    default
    },
    {}],
    3 : [function(e, t, i) {
        "use strict";
        Object.defineProperty(i, "__esModule", {
            value: !0
        }),
        i.
    default = {
            GOAL_BUFFER_LENGTH: 30
        },
        t.exports = i.
    default
    },
    {}],
    4 : [function(e, t, i) { (function(t) {
            "use strict";
            function n(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function r(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            function a(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }),
                t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var s = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            o = function(e, t, i) {
                for (var n = !0; n;) {
                    var r = e,
                    a = t,
                    s = i;
                    n = !1,
                    null === r && (r = Function.prototype);
                    var o = Object.getOwnPropertyDescriptor(r, a);
                    if (void 0 !== o) {
                        if ("value" in o) return o.value;
                        var u = o.get;
                        if (void 0 === u) return;
                        return u.call(s)
                    }
                    var d = Object.getPrototypeOf(r);
                    if (null === d) return;
                    e = d,
                    t = a,
                    i = s,
                    n = !0,
                    o = d = void 0
                }
            },
            u = e(6),
            d = n(u),
            l = e(12),
            f = n(l),
            c = e(8),
            h = n(c),
            p = "undefined" != typeof window ? window.videojs: "undefined" != typeof t ? t.videojs: null,
            m = n(p),
            y = e(1),
            g = n(y),
            v = e(15),
            _ = n(v),
            b = 3e5,
            T = void 0,
            S = function(e, t) {
                if (typeof e != typeof t) return ! 0;
                if (Object.keys(e).length !== Object.keys(t).length) return ! 0;
                for (var i in e) if (e[i] !== t[i]) return ! 0;
                return ! 1
            },
            w = function(e) {
                var t = {
                    codecCount: 0,
                    videoCodec: null,
                    videoObjectTypeIndicator: null,
                    audioProfile: null
                },
                i = void 0;
                return t.codecCount = e.split(",").length,
                t.codecCount = t.codecCount || 2,
                i = /(^|\s|,)+(avc1)([^ ,]*)/i.exec(e),
                i && (t.videoCodec = i[2], t.videoObjectTypeIndicator = i[3]),
                t.audioProfile = /(^|\s|,)+mp4a.[0-9A-Fa-f]+\.([0-9A-Fa-f]+)/i.exec(e),
                t.audioProfile = t.audioProfile && t.audioProfile[2],
                t
            },
            k = function(e, t) {
                var i = "mp2t",
                n = {
                    videoCodec: "avc1",
                    videoObjectTypeIndicator: ".4d400d",
                    audioProfile: "2"
                },
                r = [],
                a = void 0,
                s = null;
                if (!t) return [];
                t.segments && t.segments.length && t.segments[0].map && (i = "mp4"),
                a = t.attributes || {},
                a.CODECS && !
                function() {
                    var e = w(a.CODECS);
                    Object.keys(e).forEach(function(t) {
                        n[t] = e[t] || n[t]
                    })
                } (),
                e.mediaGroups.AUDIO && (r = e.mediaGroups.AUDIO[a.AUDIO]);
                for (var o in r) {
                    if (s && !!r[o].uri != !!s.uri) return ["video/" + i + '; codecs="' + n.videoCodec + n.videoObjectTypeIndicator + ", mp4a.40." + n.audioProfile + '"', "audio/" + i + '; codecs="mp4a.40.' + n.audioProfile + '"'];
                    s = r[o]
                }
                return s && s.uri ? ["video/" + i + '; codecs="' + n.videoCodec + n.videoObjectTypeIndicator + '"', "audio/" + i + '; codecs="mp4a.40.' + n.audioProfile + '"'] : ["video/" + i + '; codecs="' + n.videoCodec + n.videoObjectTypeIndicator + ", mp4a.40." + n.audioProfile + '"']
            };
            i.mimeTypesForPlaylist_ = k;
            var O = function(e) {
                function t(e) {
                    var i = this;
                    r(this, t),
                    o(Object.getPrototypeOf(t.prototype), "constructor", this).call(this);
                    var n = e.url,
                    a = e.withCredentials,
                    s = e.mode,
                    u = e.tech,
                    l = e.bandwidth,
                    c = e.externHls,
                    h = e.useCueTags;
                    if (!n) throw new Error("A non-empty playlist URL is required");
                    T = c,
                    this.withCredentials = a,
                    this.tech_ = u,
                    this.hls_ = u.hls,
                    this.mode_ = s,
                    this.useCueTags_ = h,
                    this.useCueTags_ && (this.cueTagsTrack_ = this.tech_.addTextTrack("metadata", "ad-cues"), this.cueTagsTrack_.inBandMetadataTrackDispatchType = "", this.tech_.textTracks().addTrack_(this.cueTagsTrack_)),
                    this.audioTracks_ = [],
                    this.requestOptions_ = {
                        withCredentials: this.withCredentials,
                        timeout: null
                    },
                    this.audioGroups_ = {},
                    this.mediaSource = new m.
                default.MediaSource({
                        mode:
                        s
                    }),
                    this.audioinfo_ = null,
                    this.mediaSource.on("audioinfo", this.handleAudioinfoUpdate_.bind(this)),
                    this.mediaSource.addEventListener("sourceopen", this.handleSourceOpen_.bind(this)),
                    this.seekable_ = m.
                default.createTimeRanges(),
                    this.hasPlayed_ = function() {
                        return ! 1
                    },
                    this.syncController_ = new _.
                default;
                    var p = {
                        hls: this.hls_,
                        mediaSource: this.mediaSource,
                        currentTime: this.tech_.currentTime.bind(this.tech_),
                        seekable: function() {
                            return i.seekable()
                        },
                        seeking: function() {
                            return i.tech_.seeking()
                        },
                        setCurrentTime: function(e) {
                            return i.tech_.setCurrentTime(e)
                        },
                        hasPlayed: function() {
                            return i.hasPlayed_()
                        },
                        bandwidth: l,
                        syncController: this.syncController_
                    };
                    this.masterPlaylistLoader_ = new d.
                default(n, this.hls_, this.withCredentials),
                    this.setupMasterPlaylistLoaderListeners_(),
                    this.audioPlaylistLoader_ = null,
                    this.mainSegmentLoader_ = new f.
                default(p),
                    this.audioSegmentLoader_ = new f.
                default(p),
                    this.setupSegmentLoaderListeners_(),
                    this.masterPlaylistLoader_.start()
                }
                return a(t, e),
                s(t, [{
                    key: "setupMasterPlaylistLoaderListeners_",
                    value: function() {
                        var e = this;
                        this.masterPlaylistLoader_.on("loadedmetadata",
                        function() {
                            var t = e.masterPlaylistLoader_.media(),
                            i = 1.5 * e.masterPlaylistLoader_.targetDuration * 1e3;
                            e.requestOptions_.timeout = i,
                            t.endList && "none" !== e.tech_.preload() && (e.mainSegmentLoader_.playlist(t, e.requestOptions_), e.mainSegmentLoader_.load()),
                            e.fillAudioTracks_(),
                            e.setupAudio();
                            try {
                                e.setupSourceBuffers_()
                            } catch(t) {
                                return m.
                            default.log.warn("Failed to create SourceBuffers", t),
                                e.mediaSource.endOfStream("decode")
                            }
                            e.setupFirstPlay(),
                            e.trigger("audioupdate"),
                            e.trigger("selectedinitialmedia")
                        }),
                        this.masterPlaylistLoader_.on("loadedplaylist",
                        function() {
                            var t = e.masterPlaylistLoader_.media();
                            return t ? (e.useCueTags_ && e.updateAdCues_(t), e.mainSegmentLoader_.playlist(t, e.requestOptions_), e.updateDuration(), void(t.endList || !
                            function() {
                                var t = function() {
                                    var t = e.seekable();
                                    0 !== t.length && e.mediaSource.addSeekableRange_(t.start(0), t.end(0))
                                };
                                e.duration() !== 1 / 0 ? !
                                function() {
                                    var i = function i() {
                                        e.duration() === 1 / 0 ? t() : e.tech_.one("durationchange", i)
                                    };
                                    e.tech_.one("durationchange", i)
                                } () : t()
                            } ())) : (e.initialMedia_ = e.selectPlaylist(), void e.masterPlaylistLoader_.media(e.initialMedia_))
                        }),
                        this.masterPlaylistLoader_.on("error",
                        function() {
//                            e.blacklistCurrentPlaylist(e.masterPlaylistLoader_.error)
                        }),
                        this.masterPlaylistLoader_.on("mediachanging",
                        function() {
                            e.mainSegmentLoader_.abort(),
                            e.mainSegmentLoader_.pause()
                        }),
                        this.masterPlaylistLoader_.on("mediachange",
                        function() {
                            var t = e.masterPlaylistLoader_.media(),
                            i = 1.5 * e.masterPlaylistLoader_.targetDuration * 1e3,
                            n = void 0,
                            r = void 0;
                            e.masterPlaylistLoader_.isLowestEnabledRendition_() ? e.requestOptions_.timeout = 0 : e.requestOptions_.timeout = i,
                            e.mainSegmentLoader_.playlist(t, e.requestOptions_),
                            e.mainSegmentLoader_.load(),
                            n = e.activeAudioGroup(),
                            r = n.filter(function(e) {
                                return e.enabled
                            })[0],
                            r || (e.setupAudio(), e.trigger("audioupdate")),
                            e.tech_.trigger({
                                type: "mediachange",
                                bubbles: !0
                            })
                        })
                    }
                },
                {
                    key: "setupSegmentLoaderListeners_",
                    value: function() {
                        var e = this;
                        this.mainSegmentLoader_.on("progress",
                        function() {
                            e.masterPlaylistLoader_.media(e.selectPlaylist()),
                            e.trigger("progress")
                        }),
                        this.mainSegmentLoader_.on("error",
                        function() {
                            e.blacklistCurrentPlaylist(e.mainSegmentLoader_.error())
                        }),
                        this.mainSegmentLoader_.on("syncinfoupdate",
                        function() {
                            e.onSyncInfoUpdate_()
                        }),
                        this.audioSegmentLoader_.on("syncinfoupdate",
                        function() {
                            e.onSyncInfoUpdate_()
                        }),
                        this.audioSegmentLoader_.on("error",
                        function() {
                            m.
                        default.log.warn("Problem encountered with the current alternate audio track. Switching back to default."),
                            e.audioSegmentLoader_.abort(),
                            e.audioPlaylistLoader_ = null,
                            e.setupAudio()
                        })
                    }
                },
                {
                    key: "handleAudioinfoUpdate_",
                    value: function(e) {
                        if (T.supportsAudioInfoChange_() || !this.audioInfo_ || !S(this.audioInfo_, e.info)) return void(this.audioInfo_ = e.info);
                        var t = "had different audio properties (channels, sample rate, etc.) or changed in some other way.  This behavior is currently unsupported in Firefox 48 and below due to an issue: \n\nhttps://bugzilla.mozilla.org/show_bug.cgi?id=1247138\n\n",
                        i = this.activeAudioGroup().map(function(e) {
                            return e.enabled
                        }).indexOf(!0),
                        n = this.activeAudioGroup()[i],
                        r = this.activeAudioGroup().filter(function(e) {
                            return e.properties_ && e.properties_.
                        default
                        })[0];
                        this.audioPlaylistLoader_ ? (t = "The audio track '" + n.label + "' that we tried to " + ("switch to " + t + " Unfortunately this means we will have to ") + ("return you to the main track '" + r.label + "'. Sorry!"), r.enabled = !0, this.activeAudioGroup().splice(i, 1), this.trigger("audioupdate")) : (t = "The rendition that we tried to switch to " + t + "Unfortunately that means we will have to blacklist the current playlist and switch to another. Sorry!", this.blacklistCurrentPlaylist()),
                        m.
                    default.log.warn(t),
                        this.setupAudio()
                    }
                },
                {
                    key: "mediaRequests_",
                    value: function() {
                        return this.audioSegmentLoader_.mediaRequests + this.mainSegmentLoader_.mediaRequests
                    }
                },
                {
                    key: "mediaTransferDuration_",
                    value: function() {
                        return this.audioSegmentLoader_.mediaTransferDuration + this.mainSegmentLoader_.mediaTransferDuration
                    }
                },
                {
                    key: "mediaBytesTransferred_",
                    value: function() {
                        return this.audioSegmentLoader_.mediaBytesTransferred + this.mainSegmentLoader_.mediaBytesTransferred
                    }
                },
                {
                    key: "mediaSecondsLoaded_",
                    value: function() {
                        return Math.max(this.audioSegmentLoader_.mediaSecondsLoaded + this.mainSegmentLoader_.mediaSecondsLoaded)
                    }
                },
                {
                    key: "fillAudioTracks_",
                    value: function() {
                        var e = this.master(),
                        t = e.mediaGroups || {};
                        t && t.AUDIO && 0 !== Object.keys(t.AUDIO).length && "html5" === this.mode_ || (t.AUDIO = {
                            main: {
                            default:
                                {
                                default:
                                    !0
                                }
                            }
                        });
                        for (var i in t.AUDIO) {
                            this.audioGroups_[i] || (this.audioGroups_[i] = []);
                            for (var n in t.AUDIO[i]) {
                                var r = t.AUDIO[i][n],
                                a = new m.
                            default.AudioTrack({
                                    id:
                                    n,
                                    kind: r.
                                default ? "main": "alternative",
                                    enabled: !1,
                                    language: r.language,
                                    label: n
                                });
                                a.properties_ = r,
                                this.audioGroups_[i].push(a)
                            }
                        } (this.activeAudioGroup().filter(function(e) {
                            return e.properties_.
                        default
                        })[0] || this.activeAudioGroup()[0]).enabled = !0
                    }
                },
                {
                    key: "load",
                    value: function() {
                        this.mainSegmentLoader_.load(),
                        this.audioPlaylistLoader_ && this.audioSegmentLoader_.load()
                    }
                },
                {
                    key: "activeAudioGroup",
                    value: function() {
                        var e = this.masterPlaylistLoader_.media(),
                        t = void 0;
                        return e.attributes && e.attributes.AUDIO && (t = this.audioGroups_[e.attributes.AUDIO]),
                        t || this.audioGroups_.main
                    }
                },
                {
                    key: "setupAudio",
                    value: function() {
                        var e = this,
                        t = this.activeAudioGroup(),
                        i = t.filter(function(e) {
                            return e.enabled
                        })[0];
                        return i || (i = t.filter(function(e) {
                            return e.properties_.
                        default
                        })[0] || t[0], i.enabled = !0),
                        this.audioPlaylistLoader_ && (this.audioPlaylistLoader_.dispose(), this.audioPlaylistLoader_ = null),
                        this.audioSegmentLoader_.pause(),
                        i.properties_.resolvedUri ? (this.audioSegmentLoader_.resetEverything(), this.audioPlaylistLoader_ = new d.
                    default(i.properties_.resolvedUri, this.hls_, this.withCredentials), this.audioPlaylistLoader_.start(), this.audioPlaylistLoader_.on("loadedmetadata",
                        function() {
                            var t = e.audioPlaylistLoader_.media();
                            e.audioSegmentLoader_.playlist(t, e.requestOptions_),
                            (!e.tech_.paused() || t.endList && "none" !== e.tech_.preload()) && e.audioSegmentLoader_.load(),
                            t.endList || e.audioPlaylistLoader_.trigger("firstplay")
                        }), this.audioPlaylistLoader_.on("loadedplaylist",
                        function() {
                            var t = void 0;
                            return e.audioPlaylistLoader_ && (t = e.audioPlaylistLoader_.media()),
                            t ? void e.audioSegmentLoader_.playlist(t, e.requestOptions_) : void e.audioPlaylistLoader_.media(e.audioPlaylistLoader_.playlists.master.playlists[0])
                        }), void this.audioPlaylistLoader_.on("error",
                        function() {
                            m.
                        default.log.warn("Problem encountered loading the alternate audio track. Switching back to default."),
                            e.audioSegmentLoader_.abort(),
                            e.setupAudio()
                        })) : void this.mainSegmentLoader_.resetEverything()
                    }
                },
                {
                    key: "fastQualityChange_",
                    value: function() {
                        var e = this.selectPlaylist();
                        e !== this.masterPlaylistLoader_.media() && (this.masterPlaylistLoader_.media(e), this.mainSegmentLoader_.resetLoader(), this.audiosegmentloader_ && this.audioSegmentLoader_.resetLoader())
                    }
                },
                {
                    key: "play",
                    value: function() {
                        if (!this.setupFirstPlay()) return this.tech_.ended() && this.tech_.setCurrentTime(0),
                        this.hasPlayed_() && this.load(),
                        this.tech_.duration() === 1 / 0 && this.tech_.currentTime() < this.tech_.seekable().start(0) ? this.tech_.setCurrentTime(this.tech_.seekable().start(0)) : void 0
                    }
                },
                {
                    key: "setupFirstPlay",
                    value: function() {
                        var e = void 0,
                        t = this.masterPlaylistLoader_.media();
                        return ! (!t || this.tech_.paused() || this.hasPlayed_()) && (t.endList || (this.trigger("firstplay"), e = this.seekable(), e.length && this.tech_.setCurrentTime(e.end(0))), this.hasPlayed_ = function() {
                            return ! 0
                        },
                        this.load(), !0)
                    }
                },
                {
                    key: "handleSourceOpen_",
                    value: function() {
                        try {
                            this.setupSourceBuffers_()
                        } catch(e) {
                            return m.
                        default.log.warn("Failed to create Source Buffers", e),
                            this.mediaSource.endOfStream("decode")
                        }
                        this.tech_.autoplay() && this.tech_.play(),
                        this.trigger("sourceopen")
                    }
                },
                {
                    key: "blacklistCurrentPlaylist",
                    value: function() {
                        var e = arguments.length <= 0 || void 0 === arguments[0] ? {}: arguments[0],
                        t = void 0,
                        i = void 0;
                        return (t = e.playlist || this.masterPlaylistLoader_.media()) ? (t.excludeUntil = Date.now() + b, (i = this.selectPlaylist()) ? (m.
                    default.log.warn("Problem encountered with the current HLS playlist. Switching to another playlist."), this.masterPlaylistLoader_.media(i)) : (m.
                    default.log.warn("Problem encountered with the current HLS playlist. No suitable alternatives found."), this.error = e, this.mediaSource.endOfStream("network"))) : (this.error = e, this.mediaSource.endOfStream("network"))
                    }
                },
                {
                    key: "pauseLoading",
                    value: function() {
                        this.mainSegmentLoader_.pause(),
                        this.audioPlaylistLoader_ && this.audioSegmentLoader_.pause()
                    }
                },
                {
                    key: "setCurrentTime",
                    value: function(e) {
                        var t = h.
                    default.findRange(this.tech_.buffered(), e);
                        return this.masterPlaylistLoader_ && this.masterPlaylistLoader_.media() && this.masterPlaylistLoader_.media().segments ? t && t.length ? e: (this.mainSegmentLoader_.resetEverything(), this.mainSegmentLoader_.abort(), this.audioPlaylistLoader_ && (this.audioSegmentLoader_.resetEverything(), this.audioSegmentLoader_.abort()), void(this.tech_.paused() || (this.mainSegmentLoader_.load(), this.audioPlaylistLoader_ && this.audioSegmentLoader_.load()))) : 0
                    }
                },
                {
                    key: "duration",
                    value: function() {
                        return this.masterPlaylistLoader_ ? this.mediaSource ? this.mediaSource.duration: T.Playlist.duration(this.masterPlaylistLoader_.media()) : 0
                    }
                },
                {
                    key: "seekable",
                    value: function() {
                        return this.seekable_
                    }
                },
                {
                    key: "onSyncInfoUpdate_",
                    value: function() {
                        var e = void 0,
                        t = void 0,
                        i = void 0;
                        if (this.masterPlaylistLoader_ && (e = this.masterPlaylistLoader_.media(), e && (t = T.Playlist.seekable(e), 0 !== t.length && (!this.audioPlaylistLoader_ || (i = T.Playlist.seekable(this.audioPlaylistLoader_.media()), 0 !== i.length))))) return i ? void(this.seekable_ = m.
                    default.createTimeRanges([[i.start(0) > t.start(0) ? i.start(0) : t.start(0), i.end(0) < t.end(0) ? i.end(0) : t.end(0)]])) : void(this.seekable_ = t)
                    }
                },
                {
                    key: "updateDuration",
                    value: function() {
                        var e = this,
                        t = this.mediaSource.duration,
                        i = T.Playlist.duration(this.masterPlaylistLoader_.media()),
                        n = this.tech_.buffered(),
                        r = function t() {
                            e.mediaSource.duration = i,
                            e.tech_.trigger("durationchange"),
                            e.mediaSource.removeEventListener("sourceopen", t)
                        };
                        n.length > 0 && (i = Math.max(i, n.end(n.length - 1))),
                        t !== i && ("open" !== this.mediaSource.readyState ? this.mediaSource.addEventListener("sourceopen", r) : r())
                    }
                },
                {
                    key: "dispose",
                    value: function() {
                        this.masterPlaylistLoader_.dispose(),
                        this.mainSegmentLoader_.dispose(),
                        this.audioPlaylistLoader_ && this.audioPlaylistLoader_.dispose(),
                        this.audioSegmentLoader_.dispose()
                    }
                },
                {
                    key: "master",
                    value: function() {
                        return this.masterPlaylistLoader_.master
                    }
                },
                {
                    key: "media",
                    value: function() {
                        return this.masterPlaylistLoader_.media() || this.initialMedia_
                    }
                },
                {
                    key: "setupSourceBuffers_",
                    value: function() {
                        var e = this.masterPlaylistLoader_.media(),
                        t = void 0;
                        if (e && "open" === this.mediaSource.readyState) {
                            if (t = k(this.masterPlaylistLoader_.master, e), t.length < 1) return this.error = "No compatible SourceBuffer configuration for the variant stream:" + e.resolvedUri,
                            this.mediaSource.endOfStream("decode");
                            this.mainSegmentLoader_.mimeType(t[0]),
                            t[1] && this.audioSegmentLoader_.mimeType(t[1]),
                            this.excludeIncompatibleVariants_(e)
                        }
                    }
                },
                {
                    key: "excludeIncompatibleVariants_",
                    value: function(e) {
                        var t = this.masterPlaylistLoader_.master,
                        i = 2,
                        n = null,
                        r = null,
                        a = void 0;
                        e.attributes && e.attributes.CODECS && (a = w(e.attributes.CODECS), n = a.videoCodec, r = a.audioProfile, i = a.codecCount),
                        t.playlists.forEach(function(e) {
                            var t = {
                                codecCount: 2,
                                videoCodec: null,
                                audioProfile: null
                            };
                            if (e.attributes && e.attributes.CODECS) {
                                var a = e.attributes.CODECS;
                                t = w(a),
                                window.MediaSource && window.MediaSource.isTypeSupported && !window.MediaSource.isTypeSupported('video/mp4; codecs="' + a + '"') && (e.excludeUntil = 1 / 0)
                            }
                            t.codecCount !== i && (e.excludeUntil = 1 / 0),
                            t.videoCodec !== n && (e.excludeUntil = 1 / 0),
                            ("5" === t.audioProfile && "5" !== r || "5" === r && "5" !== t.audioProfile) && (e.excludeUntil = 1 / 0)
                        })
                    }
                },
                {
                    key: "updateAdCues_",
                    value: function(e) {
                        var t = 0,
                        i = this.seekable();
                        i.length && (t = i.start(0)),
                        g.
                    default.updateAdCues(e, this.cueTagsTrack_, t)
                    }
                }]),
                t
            } (m.
        default.EventTarget);
            i.MasterPlaylistController = O
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    5 : [function(e, t, i) { (function(n) {
            "use strict";
            function r(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function a(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var s = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            o = e(8),
            u = r(o),
            d = "undefined" != typeof window ? window.videojs: "undefined" != typeof n ? n.videojs: null,
            l = r(d),
            f = ["seeking", "seeked", "pause", "playing", "error"],
            c = function() {
                function e(t) {
                    var i = this;
                    a(this, e),
                    this.tech_ = t.tech,
                    this.seekable = t.seekable,
                    this.consecutiveUpdates = 0,
                    this.lastRecordedTime = null,
                    this.timer_ = null,
                    this.checkCurrentTimeTimeout_ = null,
                    t.debug && (this.logger_ = l.
                default.log.bind(l.
                default, "playback-watcher ->")),
                    this.logger_("initialize");
                    var n = function() {
                        return i.waiting_()
                    },
                    r = function() {
                        return i.cancelTimer_()
                    };
                    this.tech_.on("waiting", n),
                    this.tech_.on(f, r),
                    this.monitorCurrentTime_(),
                    this.dispose = function() {
                        i.logger_("dispose"),
                        i.tech_.off("waiting", n),
                        i.tech_.off(f, r),
                        i.checkCurrentTimeTimeout_ && clearTimeout(i.checkCurrentTimeTimeout_),
                        i.cancelTimer_()
                    }
                }
                return s(e, [{
                    key: "monitorCurrentTime_",
                    value: function() {
                        this.checkCurrentTime_(),
                        this.checkCurrentTimeTimeout_ && clearTimeout(this.checkCurrentTimeTimeout_),
                        this.checkCurrentTimeTimeout_ = setTimeout(this.monitorCurrentTime_.bind(this), 250)
                    }
                },
                {
                    key: "checkCurrentTime_",
                    value: function() {
                        if (!this.tech_.paused() && !this.tech_.seeking()) {
                            var e = this.tech_.currentTime();
                            this.consecutiveUpdates >= 5 && e === this.lastRecordedTime ? (this.consecutiveUpdates++, this.waiting_()) : e === this.lastRecordedTime ? this.consecutiveUpdates++:(this.consecutiveUpdates = 0, this.lastRecordedTime = e)
                        }
                    }
                },
                {
                    key: "cancelTimer_",
                    value: function() {
                        this.consecutiveUpdates = 0,
                        this.timer_ && (this.logger_("cancelTimer_"), clearTimeout(this.timer_)),
                        this.timer_ = null
                    }
                },
                {
                    key: "waiting_",
                    value: function() {
                        var e = this.seekable(),
                        t = this.tech_.currentTime();
                        if (!this.tech_.seeking() && null === this.timer_) {
                            if (this.fellOutOfLiveWindow_(e, t)) {
                                var i = e.end(e.length - 1);
                                return this.logger_("Fell out of live window at time " + t + ". Seeking to live point (seekable end) " + i),
                                this.cancelTimer_(),
                                void this.tech_.setCurrentTime(i)
                            }
                            var n = this.tech_.buffered(),
                            r = u.
                        default.findNextRange(n, t);
                            if (this.videoUnderflow_(r, n, t)) return this.cancelTimer_(),
                            void this.tech_.setCurrentTime(t);
                            if (r.length > 0) {
                                var a = r.start(0) - t;
                                this.logger_("Stopped at " + t + ", setting timer for " + a + ", seeking to " + r.start(0)),
                                this.timer_ = setTimeout(this.skipTheGap_.bind(this), 1e3 * a, t)
                            }
                        }
                    }
                },
                {
                    key: "fellOutOfLiveWindow_",
                    value: function(e, t) {
                        return !! (e.length && e.start(0) > 0 && t < e.start(0))
                    }
                },
                {
                    key: "videoUnderflow_",
                    value: function(e, t, i) {
                        if (0 === e.length) {
                            var n = this.gapFromVideoUnderflow_(t, i);
                            if (n) return this.logger_("Encountered a gap in video from " + n.start + " to " + n.end + ". Seeking to current time " + i),
                            !0
                        }
                        return ! 1
                    }
                },
                {
                    key: "skipTheGap_",
                    value: function(e) {
                        var t = this.tech_.buffered(),
                        i = this.tech_.currentTime(),
                        n = u.
                    default.findNextRange(t, i);
                        this.cancelTimer_(),
                        0 !== n.length && i === e && (this.logger_("skipTheGap_:", "currentTime:", i, "scheduled currentTime:", e, "nextRange start:", n.start(0)), this.tech_.setCurrentTime(n.start(0) + u.
                    default.TIME_FUDGE_FACTOR))
                    }
                },
                {
                    key: "gapFromVideoUnderflow_",
                    value: function(e, t) {
                        for (var i = u.
                    default.findGaps(e), n = 0; n < i.length; n++) {
                            var r = i.start(n),
                            a = i.end(n);
                            if (t - r < 4 && t - r > 2) return {
                                start: r,
                                end: a
                            }
                        }
                        return null
                    }
                },
                {
                    key: "logger_",
                    value: function() {}
                }]),
                e
            } ();
            i.
        default = c,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    6 : [function(e, t, i) { (function(n) {
            "use strict";
            function r(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var a = e(11),
            s = r(a),
            o = "undefined" != typeof window ? window.videojs: "undefined" != typeof n ? n.videojs: null,
            u = e(14),
            d = r(u),
            l = e(64),
            f = r(l),
            c = e(27),
            h = r(c),
            p = function(e, t, i) {
                var n = t.slice(),
                r = void 0,
                a = void 0;
                for (i = i || 0, r = Math.min(e.length, t.length + i), a = i; a < r; a++) n[a - i] = (0, o.mergeOptions)(e[a], n[a - i]);
                return n
            },
            m = function(e, t) {
                for (var i = !1,
                n = (0, o.mergeOptions)(e, {}), r = e.playlists.length, a = void 0, u = void 0, d = void 0; r--;) if (a = n.playlists[r], a.uri === t.uri) {
                    if (a.segments && t.segments && a.segments.length === t.segments.length && a.mediaSequence === t.mediaSequence) continue;
                    for (n.playlists[r] = (0, o.mergeOptions)(a, t), n.playlists[t.uri] = n.playlists[r], a.segments && (n.playlists[r].segments = p(a.segments, t.segments, t.mediaSequence - a.mediaSequence)), d = 0, n.playlists[r].segments && (d = n.playlists[r].segments.length); d--;) u = n.playlists[r].segments[d],
                    u.resolvedUri || (u.resolvedUri = (0, s.
                default)(a.resolvedUri, u.uri)),
                    u.key && !u.key.resolvedUri && (u.key.resolvedUri = (0, s.
                default)(a.resolvedUri, u.key.uri)),
                    u.map && !u.map.resolvedUri && (u.map.resolvedUri = (0, s.
                default)(a.resolvedUri, u.map.uri));
                    i = !0
                }
                return i ? n: null
            },
            y = function e(t, i, n) {
                var r = this,
                a = this,
                o = void 0,
                u = void 0,
                d = void 0,
                l = void 0,
                c = void 0;
                if (e.prototype.constructor.call(this), this.hls_ = i, !t) throw new Error("A non-empty playlist URL is required");
                l = function(e, t, i) {
                    a.setBandwidth(d || e),
                    d = null,
                    i && (a.state = i),
                    a.error = {
                        playlist: a.master.playlists[t],
                        status: e.status,
                        message: "HLS playlist request error at URL: " + t,
                        responseText: e.responseText,
                        code: e.status >= 500 ? 4 : 2
                    },
                    a.trigger("error")
                },
                c = function(e, t) {
                    var i = void 0,
                    n = void 0,
                    r = void 0;
                    a.setBandwidth(d || e),
                    d = null,
                    a.state = "HAVE_METADATA",
                    i = new f.
                default.Parser,
                    i.push(e.responseText),
                    i.end(),
                    i.manifest.uri = t,
                    r = m(a.master, i.manifest),
                    n = 1e3 * (i.manifest.targetDuration || 10),
                    a.targetDuration = i.manifest.targetDuration,
                    r ? (a.master = r, a.media_ = a.master.playlists[i.manifest.uri]) : n /= 2,
                    a.media().endList || (h.
                default.clearTimeout(u), u = h.
                default.setTimeout(function() {
                        a.trigger("mediaupdatetimeout")
                    },
                    n)),
                    a.trigger("loadedplaylist")
                },
                a.state = "HAVE_NOTHING",
                o = this.dispose,
                a.dispose = function() {
                    a.stopRequest(),
                    h.
                default.clearTimeout(u),
                    o.call(this)
                },
                a.stopRequest = function() {
                    if (d) {
                        var e = d;
                        d = null,
                        e.onreadystatechange = null,
                        e.abort()
                    }
                },
                a.enabledPlaylists_ = function() {
                    return a.master.playlists.filter(function(e, t, i) {
                        return ! e.excludeUntil || e.excludeUntil <= Date.now()
                    }).length
                },
                a.isLowestEnabledRendition_ = function() {
                    var e = a.media();
                    if (!e || !e.attributes) return ! 1;
                    var t = a.media().attributes.BANDWIDTH || 0;
                    return ! (a.master.playlists.filter(function(e) {
                        var i = "undefined" == typeof e.excludeUntil || e.excludeUntil <= Date.now();
                        if (!i) return ! 1;
                        var n = 0;
                        return e && e.attributes && (n = e.attributes.BANDWIDTH),
                        n <= t
                    }).length > 1)
                },
                a.media = function(e) {
                    var t = a.state,
                    i = void 0;
                    if (!e) return a.media_;
                    if ("HAVE_NOTHING" === a.state) throw new Error("Cannot switch media playlist from " + a.state);
                    if ("string" == typeof e) {
                        if (!a.master.playlists[e]) throw new Error("Unknown playlist URI: " + e);
                        e = a.master.playlists[e]
                    }
                    if (i = !a.media_ || e.uri !== a.media_.uri, a.master.playlists[e.uri].endList) return d && (d.onreadystatechange = null, d.abort(), d = null),
                    a.state = "HAVE_METADATA",
                    a.media_ = e,
                    void(i && (a.trigger("mediachanging"), a.trigger("mediachange")));
                    if (i) {
                        if (a.state = "SWITCHING_MEDIA", d) {
                            if ((0, s.
                        default)(a.master.uri, e.uri) === d.url) return;
                            d.onreadystatechange = null,
                            d.abort(),
                            d = null
                        }
                        this.media_ && this.trigger("mediachanging"),
                        d = this.hls_.xhr({
                            uri: (0, s.
                        default)(a.master.uri, e.uri),
                            withCredentials: n
                        },
                        function(i, n) {
                            if (d) {
                                if (i) return l(d, e.uri, t);
                                c(n, e.uri),
                                "HAVE_MASTER" === t ? a.trigger("loadedmetadata") : a.trigger("mediachange")
                            }
                        })
                    }
                },
                a.setBandwidth = function(e) {
                    a.bandwidth = e.bandwidth
                },
                a.on("mediaupdatetimeout",
                function() {
                    "HAVE_METADATA" === a.state && (a.state = "HAVE_CURRENT_METADATA", d = this.hls_.xhr({
                        uri: (0, s.
                    default)(a.master.uri, a.media().uri),
                        withCredentials: n
                    },
                    function(e, t) {
                        if (d) return e ? l(d, a.media().uri) : void c(d, a.media().uri)
                    }))
                }),
                a.on("firstplay",
                function() {
                    var e = a.media();
                    e && (e.syncInfo = {
                        mediaSequence: e.mediaSequence,
                        time: 0
                    })
                }),
                a.pause = function() {
                    a.stopRequest(),
                    h.
                default.clearTimeout(u)
                },
                a.load = function() {
                    a.started ? a.media().endList ? a.trigger("loadedplaylist") : a.trigger("mediaupdatetimeout") : a.start()
                },
                a.start = function() {
                    a.started = !0,
                    d = r.hls_.xhr({
                        uri: t,
                        withCredentials: n
                    },
                    function(e, i) {
                        var n = void 0,
                        r = void 0,
                        o = void 0;
                        if (d) {
                            if (d = null, e) return a.error = {
                                status: i.status,
                                message: "HLS playlist request error at URL: " + t,
                                responseText: i.responseText,
                                code: 2
                            },
                            a.trigger("error");
                            if (n = new f.
                        default.Parser, n.push(i.responseText), n.end(), a.state = "HAVE_MASTER", n.manifest.uri = t, n.manifest.playlists) {
                                for (a.master = n.manifest, o = a.master.playlists.length; o--;) r = a.master.playlists[o],
                                a.master.playlists[r.uri] = r,
                                r.resolvedUri = (0, s.
                            default)(a.master.uri, r.uri);
                                for (var u in a.master.mediaGroups.AUDIO) for (var l in a.master.mediaGroups.AUDIO[u]) {
                                    var p = a.master.mediaGroups.AUDIO[u][l];
                                    p.uri && (p.resolvedUri = (0, s.
                                default)(a.master.uri, p.uri))
                                }
                                return a.trigger("loadedplaylist"),
                                void(d || a.media(n.manifest.playlists[0]))
                            }
                            return a.master = {
                                mediaGroups: {
                                    AUDIO: {},
                                    VIDEO: {},
                                    "CLOSED-CAPTIONS": {},
                                    SUBTITLES: {}
                                },
                                uri: h.
                            default.location.href,
                                playlists: [{
                                    uri: t
                                }]
                            },
                            a.master.playlists[t] = a.master.playlists[0],
                            a.master.playlists[0].resolvedUri = t,
                            c(i, t),
                            a.trigger("loadedmetadata")
                        }
                    })
                }
            };
            y.prototype = new d.
        default,
            i.
        default = y,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    7 : [function(e, t, i) { (function(t) {
            "use strict";
            function n(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var r = "undefined" != typeof window ? window.videojs: "undefined" != typeof t ? t.videojs: null,
            a = e(27),
            s = n(a),
            o = {
                UNSAFE_LIVE_SEGMENTS: 3
            },
            u = function(e, t) {
                var i = 0,
                n = t - e.mediaSequence,
                r = e.segments[n];
                if (r) {
                    if ("undefined" != typeof r.start) return {
                        result: r.start,
                        precise: !0
                    };
                    if ("undefined" != typeof r.end) return {
                        result: r.end - r.duration,
                        precise: !0
                    }
                }
                for (; n--;) {
                    if (r = e.segments[n], "undefined" != typeof r.end) return {
                        result: i + r.end,
                        precise: !0
                    };
                    if (i += r.duration, "undefined" != typeof r.start) return {
                        result: i + r.start,
                        precise: !0
                    }
                }
                return {
                    result: i,
                    precise: !1
                }
            },
            d = function(e, t) {
                for (var i = 0,
                n = void 0,
                r = t - e.mediaSequence; r < e.segments.length; r++) {
                    if (n = e.segments[r], "undefined" != typeof n.start) return {
                        result: n.start - i,
                        precise: !0
                    };
                    if (i += n.duration, "undefined" != typeof n.end) return {
                        result: n.end - i,
                        precise: !0
                    }
                }
                return {
                    result: -1,
                    precise: !1
                }
            },
            l = function(e, t, i) {
                var n = void 0,
                r = void 0;
                return "undefined" == typeof t && (t = e.mediaSequence + e.segments.length),
                t < e.mediaSequence ? 0 : (n = u(e, t), n.precise ? n.result: (r = d(e, t), r.precise ? r.result: n.result + i))
            },
            f = function(e, t, i) {
                if (!e) return 0;
                if ("number" != typeof i && (i = 0), "undefined" == typeof t) {
                    if (e.totalDuration) return e.totalDuration;
                    if (!e.endList) return s.
                default.Infinity
                }
                return l(e, t, i)
            };
            i.duration = f;
            var c = function(e, t, i) {
                var n = 0;
                if (t > i) {
                    var r = [i, t];
                    t = r[0],
                    i = r[1]
                }
                if (t < 0) {
                    for (var a = t; a < Math.min(0, i); a++) n += e.targetDuration;
                    t = 0
                }
                for (var a = t; a < i; a++) n += e.segments[a].duration;
                return n
            };
            i.sumDurations = c;
            var h = function(e) {
                if (!e || !e.segments) return [null, null];
                for (var t = e.syncInfo || null,
                i = null,
                n = 0,
                r = e.segments.length; n < r; n++) {
                    var a = e.segments[n];
                    if ("undefined" != typeof a.start) {
                        i = {
                            mediaSequence: e.mediaSequence + n,
                            time: a.start
                        };
                        break
                    }
                }
                return {
                    expiredSync: t,
                    segmentSync: i
                }
            },
            p = function(e, t, i) {
                if (t && i) {
                    var n = t.mediaSequence - e.mediaSequence,
                    r = i.mediaSequence - e.mediaSequence,
                    a = void 0,
                    s = void 0;
                    return Math.abs(n) > Math.abs(r) ? (a = r, s = -i.time) : (a = n, s = t.time),
                    Math.abs(s + c(e, a, 0))
                }
                if (t) {
                    var a = t.mediaSequence - e.mediaSequence;
                    return t.time + c(e, a, 0)
                }
                if (i) {
                    var a = i.mediaSequence - e.mediaSequence;
                    return i.time - c(e, a, 0)
                }
            },
            m = function(e) {
                if (!e || !e.segments) return (0, r.createTimeRange)();
                if (e.endList) return (0, r.createTimeRange)(0, f(e));
                var t = h(e),
                i = t.expiredSync,
                n = t.segmentSync;
                if (!i && !n) return (0, r.createTimeRange)();
                var a = p(e, i, n),
                s = a,
                u = Math.max(0, e.segments.length - o.UNSAFE_LIVE_SEGMENTS),
                d = l(e, e.mediaSequence + u, a);
                return (0, r.createTimeRange)(s, d)
            };
            i.seekable = m;
            var y = function(e) {
                return e - Math.floor(e) === 0
            },
            g = function(e, t) {
                if (y(t)) return t + .1 * e;
                for (var i = t.toString().split(".")[1].length, n = 1; n <= i; n++) {
                    var r = Math.pow(10, n),
                    a = t * r;
                    if (y(a) || n === i) return (a + e) / r
                }
            },
            v = g.bind(null, 1),
            _ = g.bind(null, -1),
            b = function(e, t, i, n) {
                var r = void 0,
                a = void 0,
                s = e.segments.length,
                o = t - n;
                if (o < 0) {
                    if (i > 0) for (r = i - 1; r >= 0; r--) if (a = e.segments[r], o += _(a.duration), o > 0) return {
                        mediaIndex: r,
                        startTime: n - c(e, i, r)
                    };
                    return {
                        mediaIndex: 0,
                        startTime: t
                    }
                }
                if (i < 0) {
                    for (r = i; r < 0; r++) if (o -= e.targetDuration, o < 0) return {
                        mediaIndex: 0,
                        startTime: t
                    };
                    i = 0
                }
                for (r = i; r < s; r++) if (a = e.segments[r], o -= v(a.duration), o < 0) return {
                    mediaIndex: r,
                    startTime: n + c(e, i, r)
                };
                return {
                    mediaIndex: s - 1,
                    startTime: t
                }
            };
            i.getMediaInfoForTime_ = b,
            o.duration = f,
            o.seekable = m,
            o.getMediaInfoForTime_ = b,
            i.
        default = o
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    8 : [function(e, t, i) { (function(e) {
            "use strict";
            function n(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var r = function() {
                function e(e, t) {
                    var i = [],
                    n = !0,
                    r = !1,
                    a = void 0;
                    try {
                        for (var s, o = e[Symbol.iterator](); ! (n = (s = o.next()).done) && (i.push(s.value), !t || i.length !== t); n = !0);
                    } catch(e) {
                        r = !0,
                        a = e
                    } finally {
                        try { ! n && o.
                            return && o.
                            return ()
                        } finally {
                            if (r) throw a
                        }
                    }
                    return i
                }
                return function(t, i) {
                    if (Array.isArray(t)) return t;
                    if (Symbol.iterator in Object(t)) return e(t, i);
                    throw new TypeError("Invalid attempt to destructure non-iterable instance");
                }
            } (),
            a = "undefined" != typeof window ? window.videojs: "undefined" != typeof e ? e.videojs: null,
            s = n(a),
            o = 1 / 30,
            u = function(e, t) {
                var i = r(t, 2),
                n = i[0],
                a = i[1];
                return Math.min(Math.max(n, e), a)
            },
            d = function(e, t) {
                var i = [],
                n = void 0;
                if (e && e.length) for (n = 0; n < e.length; n++) t(e.start(n), e.end(n)) && i.push([e.start(n), e.end(n)]);
                return s.
            default.createTimeRanges(i)
            },
            l = function(e, t) {
                return d(e,
                function(e, i) {
                    return e - o <= t && i + o >= t
                })
            },
            f = function(e, t) {
                return d(e,
                function(e) {
                    return e - o >= t
                })
            },
            c = function(e) {
                if (e.length < 2) return s.
            default.createTimeRanges();
                for (var t = [], i = 1; i < e.length; i++) {
                    var n = e.end(i - 1),
                    r = e.start(i);
                    t.push([n, r])
                }
                return s.
            default.createTimeRanges(t)
            },
            h = function(e, t) {
                var i = void 0,
                n = void 0,
                r = void 0,
                a = [],
                s = [],
                o = function(e) {
                    return e[0] <= r && e[1] >= r
                };
                if (e) for (i = 0; i < e.length; i++) n = e.start(i),
                r = e.end(i),
                s.push([n, r]);
                if (t) for (i = 0; i < t.length; i++) n = t.start(i),
                r = t.end(i),
                s.some(o) || a.push(r);
                return 1 !== a.length ? null: a[0]
            },
            p = function(e, t) {
                var i = null,
                n = null,
                r = 0,
                a = [],
                o = [];
                if (! (e && e.length && t && t.length)) return s.
            default.createTimeRange();
                for (var u = e.length; u--;) a.push({
                    time: e.start(u),
                    type: "start"
                }),
                a.push({
                    time: e.end(u),
                    type: "end"
                });
                for (u = t.length; u--;) a.push({
                    time: t.start(u),
                    type: "start"
                }),
                a.push({
                    time: t.end(u),
                    type: "end"
                });
                for (a.sort(function(e, t) {
                    return e.time - t.time
                }), u = 0; u < a.length; u++)"start" === a[u].type ? (r++, 2 === r && (i = a[u].time)) : "end" === a[u].type && (r--, 1 === r && (n = a[u].time)),
                null !== i && null !== n && (o.push([i, n]), i = null, n = null);
                return s.
            default.createTimeRanges(o)
            },
            m = function(e, t, i, n) {
                for (var r = t.end(0) - t.start(0), a = e.end(0) - e.start(0), s = r - a, o = p(e, n), u = p(t, n), d = 0, l = 0, f = o.length; f--;) d += o.end(f) - o.start(f),
                o.start(f) === i && (d += s);
                for (f = u.length; f--;) l += u.end(f) - u.start(f);
                return Math.max(d, l) / r * 100
            },
            y = function(e, t, i, n) {
                var r = e + t,
                a = s.
            default.createTimeRanges([[e, r]]),
                o = s.
            default.createTimeRanges([[u(e, [i, r]), r]]);
                if (o.start(0) === o.end(0)) return 0;
                var d = m(o, a, i, n);
                return isNaN(d) || d === 1 / 0 || d === -(1 / 0) ? 0 : d
            };
            i.
        default = {
                findRange: l,
                findNextRange: f,
                findGaps: c,
                findSoleUncommonTimeRangesEnd: h,
                getSegmentBufferedPercent: y,
                TIME_FUDGE_FACTOR: o
            },
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    9 : [function(e, t, i) { (function(e) {
            "use strict";
            function n(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var r = "undefined" != typeof window ? window.videojs: "undefined" != typeof e ? e.videojs: null,
            a = n(r),
            s = {
                errorInterval: 30,
                getSource: function(e) {
                    var t = this.tech({
                        IWillNotUseThisInPlugins: !0
                    }),
                    i = t.currentSource_;
                    return e(i)
                }
            },
            o = function e(t, i) {
                var n = 0,
                r = 0,
                o = a.
            default.mergeOptions(s, i),
                u = function() {
                    r && t.currentTime(r)
                },
                d = function(e) {
                    null !== e && void 0 !== e && (r = t.duration() !== 1 / 0 && t.currentTime() || 0, t.one("loadedmetadata", u), t.src(e), t.play())
                },
                l = function() {
                    if (! (Date.now() - n < 1e3 * o.errorInterval)) return o.getSource && "function" == typeof o.getSource ? (n = Date.now(), o.getSource.call(t, d)) : void a.
                default.log.error("ERROR: reloadSourceOnError - The option getSource must be a function!")
                },
                f = function e() {
                    t.off("loadedmetadata", u),
                    t.off("error", l),
                    t.off("dispose", e)
                },
                c = function(i) {
                    f(),
                    e(t, i)
                };
                t.on("error", l),
                t.on("dispose", f),
                t.reloadSourceOnError = c
            },
            u = function(e) {
                o(this, e)
            };
            i.
        default = u,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    10 : [function(e, t, i) {
        "use strict";
        function n(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var r = function(e, t, i) {
            var n = "undefined" == typeof e.excludeUntil || e.excludeUntil <= Date.now();
            return "undefined" == typeof i ? n: (i !== n && (i ? delete e.excludeUntil: e.excludeUntil = 1 / 0, t()), i)
        },
        a = function e(t, i, a) {
            n(this, e);
            var s = t.masterPlaylistController_.fastQualityChange_.bind(t.masterPlaylistController_);
            if (i.attributes) {
                var o = i.attributes;
                if (o.RESOLUTION) {
                    var u = o.RESOLUTION;
                    this.width = u.width,
                    this.height = u.height
                }
                this.bandwidth = o.BANDWIDTH
            }
            this.id = a,
            this.enabled = r.bind(this, i, s)
        },
        s = function(e) {
            var t = e.playlists;
            e.representations = function() {
                return t.master.playlists.map(function(t, i) {
                    return new a(e, t, i)
                })
            }
        };
        i.
    default = s,
        t.exports = i.
    default
    },
    {}],
    11 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var r = e(90),
        a = n(r),
        s = e(27),
        o = n(s),
        u = function(e, t) {
            return /^[a-z]+:/i.test(t) ? t: (/\/\//i.test(e) || (e = a.
        default.buildAbsoluteURL(o.
        default.location.href, e)), a.
        default.buildAbsoluteURL(e, t))
        };
        i.
    default = u,
        t.exports = i.
    default
    },
    {}],
    12 : [function(e, t, i) { (function(n) {
            "use strict";
            function r(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function a(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            function s(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }),
                t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var o = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            u = function(e, t, i) {
                for (var n = !0; n;) {
                    var r = e,
                    a = t,
                    s = i;
                    n = !1,
                    null === r && (r = Function.prototype);
                    var o = Object.getOwnPropertyDescriptor(r, a);
                    if (void 0 !== o) {
                        if ("value" in o) return o.value;
                        var u = o.get;
                        if (void 0 === u) return;
                        return u.call(s)
                    }
                    var d = Object.getPrototypeOf(r);
                    if (null === d) return;
                    e = d,
                    t = a,
                    i = s,
                    n = !0,
                    o = d = void 0
                }
            },
            d = e(7),
            l = "undefined" != typeof window ? window.videojs: "undefined" != typeof n ? n.videojs: null,
            f = r(l),
            c = e(13),
            h = r(c),
            p = e(20),
            m = e(3),
            y = r(m),
            g = e(27),
            v = r(g),
            _ = 500,
            b = "console",
            T = function() {
                v.
            default.logit && v.
            default[b].log.apply(v.
            default[b], arguments)
            },
            S = function(e, t, i) {
                if (!e) return ! 1;
                var n = e.segments,
                r = i === n.length;
                return e.endList && "open" === t.readyState && r
            },
            w = function(e) {
                var t = void 0,
                i = void 0;
                return i = e.offset + e.length - 1,
                t = e.offset,
                "bytes=" + t + "-" + i
            },
            k = function(e) {
                var t = {};
                return "byterange" in e && (t.Range = w(e.byterange)),
                t
            },
            O = function(e) {
                var t = e.byterange || {
                    length: 1 / 0,
                    offset: 0
                };
                return [t.length, t.offset, e.resolvedUri].join(",")
            },
            P = function(e) {
                function t(e) {
                    var i = this;
                    a(this, t),
                    u(Object.getPrototypeOf(t.prototype), "constructor", this).call(this);
                    var n = void 0;
                    if (!e) throw new TypeError("Initialization options are required");
                    if ("function" != typeof e.currentTime) throw new TypeError("No currentTime getter specified");
                    if (!e.mediaSource) throw new TypeError("No MediaSource specified");
                    n = f.
                default.mergeOptions(f.
                default.options.hls, e),
                    this.state = "INIT",
                    this.bandwidth = n.bandwidth,
                    this.throughput = {
                        rate: 0,
                        count: 0
                    },
                    this.roundTrip = NaN,
                    this.resetStats_(),
                    this.mediaIndex = null,
                    this.hasPlayed_ = n.hasPlayed,
                    this.currentTime_ = n.currentTime,
                    this.seekable_ = n.seekable,
                    this.seeking_ = n.seeking,
                    this.setCurrentTime_ = n.setCurrentTime,
                    this.mediaSource_ = n.mediaSource,
                    this.hls_ = n.hls,
                    this.checkBufferTimeout_ = null,
                    this.error_ = void 0,
                    this.currentTimeline_ = -1,
                    this.xhr_ = null,
                    this.pendingSegment_ = null,
                    this.mimeType_ = null,
                    this.sourceUpdater_ = null,
                    this.xhrOptions_ = null,
                    this.activeInitSegmentId_ = null,
                    this.initSegments_ = {},
                    this.syncController_ = n.syncController,
                    this.syncPoint_ = {
                        segmentIndex: 0,
                        time: 0
                    },
                    this.syncController_.on("syncinfoupdate",
                    function() {
                        return i.trigger("syncinfoupdate")
                    }),
                    this.fetchAtBuffer_ = !1
                }
                return s(t, e),
                o(t, [{
                    key: "resetStats_",
                    value: function() {
                        this.mediaBytesTransferred = 0,
                        this.mediaRequests = 0,
                        this.mediaTransferDuration = 0,
                        this.mediaSecondsLoaded = 0
                    }
                },
                {
                    key: "dispose",
                    value: function() {
                        this.state = "DISPOSED",
                        this.abort_(),
                        this.sourceUpdater_ && this.sourceUpdater_.dispose(),
                        this.resetStats_()
                    }
                },
                {
                    key: "abort",
                    value: function() {
                        return "WAITING" !== this.state ? void(this.pendingSegment_ && (this.pendingSegment_ = null)) : (this.abort_(), void(this.paused() || (this.state = "READY", this.fillBuffer_())))
                    }
                },
                {
                    key: "error",
                    value: function(e) {
                        return "undefined" != typeof e && (this.error_ = e),
                        this.pendingSegment_ = null,
                        this.error_
                    }
                },
                {
                    key: "load",
                    value: function() {
                        if (this.monitorBuffer_(), this.playlist_) return this.syncController_.setDateTimeMapping(this.playlist_),
                        "INIT" === this.state && this.mimeType_ ? this.init_() : void(!this.sourceUpdater_ || "READY" !== this.state && "INIT" !== this.state || (this.state = "READY", this.fillBuffer_()))
                    }
                },
                {
                    key: "playlist",
                    value: function(e) {
                        var t = arguments.length <= 1 || void 0 === arguments[1] ? {}: arguments[1];
                        if (e) {
                            var i = this.playlist_,
                            n = this.pendingSegment_;
                            if (null !== this.mediaIndex) if (i && i.uri === e.uri) {
                                var r = e.mediaSequence - i.mediaSequence;
                                this.mediaIndex -= r,
                                n && !n.isSyncRequest && (n.mediaIndex -= r),
                                this.syncController_.saveExpiredSegmentInfo(i, e)
                            } else this.resyncLoader();
                            else this.hasPlayed_() || (e.syncInfo = {
                                mediaSequence: e.mediaSequence,
                                time: 0
                            },
                            this.trigger("syncinfoupdate"));
                            return this.playlist_ = e,
                            this.xhrOptions_ = t,
                            this.mimeType_ && "INIT" === this.state && !this.paused() ? this.init_() : void 0
                        }
                    }
                },
                {
                    key: "pause",
                    value: function() {
                        this.checkBufferTimeout_ && (v.
                    default.clearTimeout(this.checkBufferTimeout_), this.checkBufferTimeout_ = null)
                    }
                },
                {
                    key: "paused",
                    value: function() {
                        return null === this.checkBufferTimeout_
                    }
                },
                {
                    key: "mimeType",
                    value: function(e) {
                        this.mimeType_ || (this.mimeType_ = e, this.playlist_ && "INIT" === this.state && !this.paused() && this.init_())
                    }
                },
                {
                    key: "monitorBuffer_",
                    value: function() {
                        "READY" === this.state && this.fillBuffer_(),
                        this.checkBufferTimeout_ && v.
                    default.clearTimeout(this.checkBufferTimeout_),
                        this.checkBufferTimeout_ = v.
                    default.setTimeout(this.monitorBuffer_.bind(this), _)
                    }
                },
                {
                    key: "getSyncSegmentCandidate_",
                    value: function(e) {
                        var t = this;
                        if (this.currentTimeline_ === -1) return 0;
                        var i = e.segments.map(function(e, t) {
                            return {
                                timeline: e.timeline,
                                segmentIndex: t
                            }
                        }).filter(function(e) {
                            return e.timeline === t.currentTimeline_
                        });
                        return i.length ? i[Math.min(i.length - 1, 1)].segmentIndex: Math.max(e.segments.length - 1, 0)
                    }
                },
                {
                    key: "checkBuffer_",
                    value: function(e, t, i, n, r, a) {
                        var s = 0,
                        o = void 0;
                        e.length && (s = e.end(e.length - 1));
                        var u = Math.max(0, s - r);
                        if (!t.segments.length) return null;
                        if (T("cB_", "mediaIndex:", i, "hasPlayed:", n, "currentTime:", r, "syncPoint:", a, "fetchAtBuffer:", this.fetchAtBuffer_), T("cB_ 2", "bufferedTime:", u), u >= y.
                    default.GOAL_BUFFER_LENGTH) return null;
                        if (!n && u >= 1) return null;
                        if (null === a) return i = this.getSyncSegmentCandidate_(t),
                        T("getSync", i),
                        this.generateSegmentInfo_(t, i, null, !0);
                        if (null !== i) {
                            T("++", i + 1);
                            var l = t.segments[i];
                            return o = l && l.end ? l.end: s,
                            this.generateSegmentInfo_(t, i + 1, o, !1)
                        }
                        if (this.fetchAtBuffer_) {
                            var f = (0, d.getMediaInfoForTime_)(t, s, a.segmentIndex, a.time);
                            i = f.mediaIndex,
                            o = f.startTime
                        } else {
                            var f = (0, d.getMediaInfoForTime_)(t, r, a.segmentIndex, a.time);
                            i = f.mediaIndex,
                            o = f.startTime
                        }
                        return T("gMIFT", i, "sos", o),
                        this.generateSegmentInfo_(t, i, o, !1)
                    }
                },
                {
                    key: "generateSegmentInfo_",
                    value: function(e, t, i, n) {
                        if (t < 0 || t >= e.segments.length) return null;
                        var r = e.segments[t];
                        return {
                            uri: r.resolvedUri,
                            mediaIndex: t,
                            isSyncRequest: n,
                            startOfSegment: i,
                            playlist: e,
                            bytes: null,
                            encryptedBytes: null,
                            timestampOffset: null,
                            timeline: r.timeline,
                            duration: r.duration
                        }
                    }
                },
                {
                    key: "abort_",
                    value: function() {
                        this.xhr_ && this.xhr_.abort(),
                        this.pendingSegment_ = null
                    }
                },
                {
                    key: "init_",
                    value: function() {
                        return this.state = "READY",
                        this.sourceUpdater_ = new h.
                    default(this.mediaSource_, this.mimeType_),
                        this.resetEverything(),
                        this.fillBuffer_()
                    }
                },
                {
                    key: "fillBuffer_",
                    value: function() {
                        if (!this.sourceUpdater_.updating()) {
                            this.syncPoint_ || (this.syncPoint_ = this.syncController_.getSyncPoint(this.playlist_, this.mediaSource_.duration, this.currentTimeline_));
                            var e = this.checkBuffer_(this.sourceUpdater_.buffered(), this.playlist_, this.mediaIndex, this.hasPlayed_(), this.currentTime_(), this.syncPoint_);
                            if (e) {
                                var t = S(this.playlist_, this.mediaSource_, e.mediaIndex);
                                return t ? void this.mediaSource_.endOfStream() : void((e.mediaIndex !== this.playlist_.segments.length - 1 || "ended" !== this.mediaSource_.readyState || this.seeking_()) && ((e.timeline !== this.currentTimeline_ || null !== e.startOfSegment && e.startOfSegment < this.sourceUpdater_.timestampOffset()) && (this.syncController_.reset(), e.timestampOffset = e.startOfSegment), this.currentTimeline_ = e.timeline, this.loadSegment_(e)))
                            }
                        }
                    }
                },
                {
                    key: "trimBuffer_",
                    value: function(e) {
                        var t = this.seekable_(),
                        i = this.currentTime_(),
                        n = void 0;
                        return t.length && t.start(0) > 0 && t.start(0) < i ? t.start(0) : n = i - 60
                    }
                },
                {
                    key: "loadSegment_",
                    value: function(e) {
                        var t = void 0,
                        i = void 0,
                        n = void 0,
                        r = void 0,
                        a = 0;
                        if (a = this.trimBuffer_(e), a > 0 && this.sourceUpdater_.remove(0, a), t = e.playlist.segments[e.mediaIndex], t.key) {
                            var s = f.
                        default.mergeOptions(this.xhrOptions_, {
                                uri: t.key.resolvedUri,
                                responseType: "arraybuffer"
                            });
                            i = this.hls_.xhr(s, this.handleResponse_.bind(this))
                        }
                        if (t.map && !this.initSegments_[O(t.map)]) {
                            var o = f.
                        default.mergeOptions(this.xhrOptions_, {
                                uri: t.map.resolvedUri,
                                responseType: "arraybuffer",
                                headers: k(t.map)
                            });
                            n = this.hls_.xhr(o, this.handleResponse_.bind(this))
                        }
                        this.pendingSegment_ = e;
                        var u = f.
                    default.mergeOptions(this.xhrOptions_, {
                            uri: e.uri,
                            responseType: "arraybuffer",
                            headers: k(t)
                        });
                        r = this.hls_.xhr(u, this.handleResponse_.bind(this)),
                        this.xhr_ = {
                            keyXhr: i,
                            initSegmentXhr: n,
                            segmentXhr: r,
                            abort: function() {
                                this.segmentXhr && (this.segmentXhr.onreadystatechange = null, this.segmentXhr.abort(), this.segmentXhr = null),
                                this.initSegmentXhr && (this.initSegmentXhr.onreadystatechange = null, this.initSegmentXhr.abort(), this.initSegmentXhr = null),
                                this.keyXhr && (this.keyXhr.onreadystatechange = null, this.keyXhr.abort(), this.keyXhr = null)
                            }
                        },
                        this.state = "WAITING"
                    }
                },
                {
                    key: "handleResponse_",
                    value: function(e, t) {
                        var i = void 0,
                        n = void 0,
                        r = void 0;
                        if (this.xhr_ && (t === this.xhr_.segmentXhr || t === this.xhr_.keyXhr || t === this.xhr_.initSegmentXhr)) {
                            if (i = this.pendingSegment_, n = i.playlist.segments[i.mediaIndex], t.timedout) return this.abort_(),
                            this.bandwidth = 1,
                            this.roundTrip = NaN,
                            this.state = "READY",
                            this.trigger("progress");
                            if (!t.aborted && e) {
                                var a = this.xhr_.keyXhr;
                                return this.abort_(),
                                this.error({
                                    status: t.status,
                                    message: t === a ? "HLS key request error at URL: " + n.key.uri: "HLS segment request error at URL: " + i.uri,
                                    code: 2,
                                    xhr: t
                                }),
                                this.state = "READY",
                                this.pause(),
                                this.trigger("error")
                            }
                            if (!t.response) return void this.abort_();
                            if (t === this.xhr_.segmentXhr && (this.xhr_.segmentXhr = null, i.startOfAppend = Date.now(), this.roundTrip = t.roundTripTime, this.bandwidth = t.bandwidth, this.mediaBytesTransferred += t.bytesReceived || 0, this.mediaRequests += 1, this.mediaTransferDuration += t.roundTripTime || 0, n.key ? i.encryptedBytes = new Uint8Array(t.response) : i.bytes = new Uint8Array(t.response)), t === this.xhr_.keyXhr) {
                                if (this.xhr_.keyXhr = null, 16 !== t.response.byteLength) return this.abort_(),
                                this.error({
                                    status: t.status,
                                    message: "Invalid HLS key at URL: " + n.key.uri,
                                    code: 2,
                                    xhr: t
                                }),
                                this.state = "READY",
                                this.pause(),
                                this.trigger("error");
                                r = new DataView(t.response),
                                n.key.bytes = new Uint32Array([r.getUint32(0), r.getUint32(4), r.getUint32(8), r.getUint32(12)]),
                                n.key.iv = n.key.iv || new Uint32Array([0, 0, 0, i.mediaIndex + i.playlist.mediaSequence])
                            }
                            t === this.xhr_.initSegmentXhr && (this.xhr_.initSegmentXhr = null, n.map.bytes = new Uint8Array(t.response), this.initSegments_[O(n.map)] = n.map),
                            this.xhr_.segmentXhr || this.xhr_.keyXhr || this.xhr_.initSegmentXhr || (this.xhr_ = null, this.processResponse_())
                        }
                    }
                },
                {
                    key: "resetEverything",
                    value: function() {
                        this.resetLoader(),
                        this.remove(0, 1 / 0)
                    }
                },
                {
                    key: "resetLoader",
                    value: function() {
                        this.fetchAtBuffer_ = !1,
                        this.resyncLoader()
                    }
                },
                {
                    key: "resyncLoader",
                    value: function() {
                        this.mediaIndex = null,
                        this.syncPoint_ = null
                    }
                },
                {
                    key: "remove",
                    value: function(e, t) {
                        this.sourceUpdater_ && this.sourceUpdater_.remove(e, t)
                    }
                },
                {
                    key: "processResponse_",
                    value: function() {
                        if (!this.pendingSegment_) return void(this.state = "READY");
                        this.state = "DECRYPTING";
                        var e = this.pendingSegment_,
                        t = e.playlist.segments[e.mediaIndex];
                        t.key ? new p.Decrypter(e.encryptedBytes, t.key.bytes, t.key.iv,
                        function(t, i) {
                            e.bytes = i,
                            this.handleSegment_()
                        }.bind(this)) : this.handleSegment_()
                    }
                },
                {
                    key: "handleSegment_",
                    value: function() {
                        var e = this;
                        if (!this.pendingSegment_) return void(this.state = "READY");
                        this.state = "APPENDING";
                        var t = this.pendingSegment_,
                        i = t.playlist.segments[t.mediaIndex];
                        return this.syncController_.probeSegmentInfo(t),
                        t.isSyncRequest ? (this.pendingSegment_ = null, void(this.state = "READY")) : (null !== t.timestampOffset && t.timestampOffset !== this.sourceUpdater_.timestampOffset() && this.sourceUpdater_.timestampOffset(t.timestampOffset), i.map && !
                        function() {
                            var t = O(i.map);
                            if (!e.activeInitSegmentId_ || e.activeInitSegmentId_ !== t) {
                                var n = e.initSegments_[t];
                                e.sourceUpdater_.appendBuffer(n.bytes,
                                function() {
                                    e.activeInitSegmentId_ = t
                                })
                            }
                        } (), t.byteLength = t.bytes.byteLength, "number" == typeof i.start && "number" == typeof i.end ? this.mediaSecondsLoaded += i.end - i.start: this.mediaSecondsLoaded += i.duration, void this.sourceUpdater_.appendBuffer(t.bytes, this.handleUpdateEnd_.bind(this)))
                    }
                },
                {
                    key: "handleUpdateEnd_",
                    value: function() {
                        if (!this.pendingSegment_) return this.state = "READY",
                        void(this.paused() || this.fillBuffer_());
                        var e = this.pendingSegment_;
                        this.pendingSegment_ = null,
                        this.recordThroughput_(e),
                        T("handleUpdateEnd_"),
                        e.isSyncRequest || (this.mediaIndex = e.mediaIndex, this.fetchAtBuffer_ = !0);
                        var t = e.mediaIndex;
                        t += e.playlist.mediaSequence - this.playlist_.mediaSequence;
                        var i = S(e.playlist, this.mediaSource_, t + 1);
                        i && this.mediaSource_.endOfStream(),
                        this.state = "READY",
                        this.trigger("progress"),
                        this.paused() || this.fillBuffer_()
                    }
                },
                {
                    key: "recordThroughput_",
                    value: function(e) {
                        var t = this.throughput.rate,
                        i = Date.now() - e.startOfAppend + 1,
                        n = Math.floor(e.byteLength / i * 8 * 1e3);
                        this.throughput.rate += (n - t) / ++this.throughput.count
                    }
                }]),
                t
            } (f.
        default.EventTarget);
            i.
        default = P,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    13 : [function(e, t, i) { (function(e) {
            "use strict";
            function n(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function r(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var a = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            s = "undefined" != typeof window ? window.videojs: "undefined" != typeof e ? e.videojs: null,
            o = n(s),
            u = function() {
                function e(t, i) {
                    var n = this;
                    r(this, e);
                    var a = function() {
                        n.sourceBuffer_ = t.addSourceBuffer(i),
                        n.onUpdateendCallback_ = function() {
                            var e = n.pendingCallback_;
                            n.pendingCallback_ = null,
                            e && e(),
                            n.runCallback_()
                        },
                        n.sourceBuffer_.addEventListener("updateend", n.onUpdateendCallback_),
                        n.runCallback_()
                    };
                    this.callbacks_ = [],
                    this.pendingCallback_ = null,
                    this.timestampOffset_ = 0,
                    this.mediaSource = t,
                    "closed" === t.readyState ? t.addEventListener("sourceopen", a) : a()
                }
                return a(e, [{
                    key: "abort",
                    value: function(e) {
                        var t = this;
                        this.queueCallback_(function() {
                            t.sourceBuffer_.abort()
                        },
                        e)
                    }
                },
                {
                    key: "appendBuffer",
                    value: function(e, t) {
                        var i = this;
                        this.queueCallback_(function() {
                            i.sourceBuffer_.appendBuffer(e)
                        },
                        t)
                    }
                },
                {
                    key: "buffered",
                    value: function() {
                        return this.sourceBuffer_ ? this.sourceBuffer_.buffered: o.
                    default.createTimeRanges()
                    }
                },
                {
                    key: "duration",
                    value: function(e) {
                        var t = this;
                        this.queueCallback_(function() {
                            t.sourceBuffer_.duration = e
                        })
                    }
                },
                {
                    key: "remove",
                    value: function(e, t) {
                        var i = this;
                        this.queueCallback_(function() {
                            i.sourceBuffer_.remove(e, t)
                        })
                    }
                },
                {
                    key: "updating",
                    value: function() {
                        return ! this.sourceBuffer_ || this.sourceBuffer_.updating
                    }
                },
                {
                    key: "timestampOffset",
                    value: function(e) {
                        var t = this;
                        return "undefined" != typeof e && (this.queueCallback_(function() {
                            t.sourceBuffer_.timestampOffset = e
                        }), this.timestampOffset_ = e),
                        this.timestampOffset_
                    }
                },
                {
                    key: "queueCallback_",
                    value: function(e, t) {
                        this.callbacks_.push([e.bind(this), t]),
                        this.runCallback_()
                    }
                },
                {
                    key: "runCallback_",
                    value: function() {
                        var e = void 0;
                        this.sourceBuffer_ && !this.sourceBuffer_.updating && this.callbacks_.length && (e = this.callbacks_.shift(), this.pendingCallback_ = e[1], e[0]())
                    }
                },
                {
                    key: "dispose",
                    value: function() {
                        this.sourceBuffer_.removeEventListener("updateend", this.onUpdateendCallback_),
                        this.sourceBuffer_ && "open" === this.mediaSource.readyState && this.sourceBuffer_.abort()
                    }
                }]),
                e
            } ();
            i.
        default = u,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    14 : [function(e, t, i) {
        "use strict";
        function n(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var r = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value" in n && (n.writable = !0),
                    Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i),
                n && e(t, n),
                t
            }
        } (),
        a = function() {
            function e() {
                n(this, e),
                this.listeners = {}
            }
            return r(e, [{
                key: "on",
                value: function(e, t) {
                    this.listeners[e] || (this.listeners[e] = []),
                    this.listeners[e].push(t)
                }
            },
            {
                key: "off",
                value: function(e, t) {
                    var i = void 0;
                    return !! this.listeners[e] && (i = this.listeners[e].indexOf(t), this.listeners[e].splice(i, 1), i > -1)
                }
            },
            {
                key: "trigger",
                value: function(e) {
                    var t = void 0,
                    i = void 0,
                    n = void 0,
                    r = void 0;
                    if (t = this.listeners[e]) if (2 === arguments.length) for (n = t.length, i = 0; i < n; ++i) t[i].call(this, arguments[1]);
                    else for (r = Array.prototype.slice.call(arguments, 1), n = t.length, i = 0; i < n; ++i) t[i].apply(this, r)
                }
            },
            {
                key: "dispose",
                value: function() {
                    this.listeners = {}
                }
            },
            {
                key: "pipe",
                value: function(e) {
                    this.on("data",
                    function(t) {
                        e.push(t)
                    })
                }
            }]),
            e
        } ();
        i.
    default = a,
        t.exports = i.
    default
    },
    {}],
    15 : [function(e, t, i) { (function(t) {
            "use strict";
            function n(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function r(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            function a(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }),
                t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var s = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            o = function(e, t, i) {
                for (var n = !0; n;) {
                    var r = e,
                    a = t,
                    s = i;
                    n = !1,
                    null === r && (r = Function.prototype);
                    var o = Object.getOwnPropertyDescriptor(r, a);
                    if (void 0 !== o) {
                        if ("value" in o) return o.value;
                        var u = o.get;
                        if (void 0 === u) return;
                        return u.call(s)
                    }
                    var d = Object.getPrototypeOf(r);
                    if (null === d) return;
                    e = d,
                    t = a,
                    i = s,
                    n = !0,
                    o = d = void 0
                }
            },
            u = e(85),
            d = n(u),
            l = e(87),
            f = e(7),
            c = "undefined" != typeof window ? window.videojs: "undefined" != typeof t ? t.videojs: null,
            h = n(c),
            p = "console",
            m = function() {
                window.logit && window[p].log.apply(window[p], arguments)
            },
            y = [{
                name: "VOD",
                run: function(e, t, i, n) {
                    if (i !== 1 / 0) {
                        var r = {
                            time: 0,
                            segmentIndex: 0
                        };
                        return r
                    }
                    return null
                }
            },
            {
                name: "ProgramDateTime",
                run: function(e, t, i, n) {
                    if (e.datetimeToDisplayTime && t.dateTimeObject) {
                        var r = t.dateTimeObject.getTime() / 1e3,
                        a = r + e.datetimeToDisplayTime,
                        s = {
                            time: a,
                            segmentIndex: 0
                        };
                        return s
                    }
                    return null
                }
            },
            {
                name: "Segment",
                run: function(e, t, i, n) {
                    for (var r = t.segments,
                    a = r.length - 1; a >= 0; a--) {
                        var s = r[a];
                        if (s.timeline === n && "undefined" != typeof s.start) {
                            var o = {
                                time: s.start,
                                segmentIndex: a
                            };
                            return o
                        }
                    }
                    return null
                }
            },
            {
                name: "Discontinuity",
                run: function(e, t, i, n) {
                    if (t.discontinuityStarts.length) for (var r = 0; r < t.discontinuityStarts.length; r++) {
                        var a = t.discontinuityStarts[r],
                        s = t.discontinuitySequence + r + 1;
                        if (e.discontinuities[s]) {
                            var o = {
                                time: e.discontinuities[s].time,
                                segmentIndex: a
                            };
                            return o
                        }
                    }
                    return null
                }
            },
            {
                name: "Playlist",
                run: function(e, t, i, n) {
                    if (t.syncInfo) {
                        var r = {
                            time: t.syncInfo.time,
                            segmentIndex: t.syncInfo.mediaSequence - t.mediaSequence
                        };
                        return r
                    }
                    return null
                }
            }];
            i.syncPointStrategies = y;
            var g = function(e) {
                function t() {
                    r(this, t),
                    o(Object.getPrototypeOf(t.prototype), "constructor", this).call(this),
                    this.inspectCache_ = void 0,
                    this.timelines = [],
                    this.discontinuities = [],
                    this.datetimeToDisplayTime = null
                }
                return a(t, e),
                s(t, [{
                    key: "getSyncPoint",
                    value: function(e, t, i) {
                        for (var n = 0; n < y.length; n++) {
                            var r = y[n],
                            a = r.run(this, e, t, i);
                            if (a) return m("syncPoint found via <" + r.name + ">:", a),
                            a
                        }
                        return null
                    }
                },
                {
                    key: "saveExpiredSegmentInfo",
                    value: function(e, t) {
                        for (var i = t.mediaSequence - e.mediaSequence,
                        n = i - 1; n >= 0; n--) {
                            var r = e.segments[n];
                            if ("undefined" != typeof r.start) {
                                t.syncInfo = {
                                    mediaSequence: e.mediaSequence + n,
                                    time: r.start
                                },
                                m("playlist sync:", t.syncInfo),
                                this.trigger("syncinfoupdate");
                                break
                            }
                        }
                    }
                },
                {
                    key: "setDateTimeMapping",
                    value: function(e) {
                        if (!this.datetimeToDisplayTime && e.dateTimeObject) {
                            var t = e.dateTimeObject.getTime() / 1e3;
                            this.datetimeToDisplayTime = -t
                        }
                    }
                },
                {
                    key: "reset",
                    value: function() {
                        this.inspectCache_ = void 0
                    }
                },
                {
                    key: "probeSegmentInfo",
                    value: function(e) {
                        var t = e.playlist.segments[e.mediaIndex],
                        i = void 0;
                        i = t.map ? this.probeMp4Segment_(e) : this.probeTsSegment_(e),
                        i && this.calculateSegmentTimeMapping_(e, i) && this.saveDiscontinuitySyncInfo_(e)
                    }
                },
                {
                    key: "probeMp4Segment_",
                    value: function(e) {
                        var t = e.playlist.segments[e.mediaIndex],
                        i = d.
                    default.timescale(t.map.bytes),
                        n = d.
                    default.startTime(i, e.bytes);
                        return null !== e.timestampOffset && (e.timestampOffset -= n),
                        {
                            start: n,
                            end: n + t.duration
                        }
                    }
                },
                {
                    key: "probeTsSegment_",
                    value: function(e) {
                        var t = (0, l.inspect)(e.bytes, this.inspectCache_),
                        i = void 0,
                        n = void 0;
                        return t ? (t.video && 2 === t.video.length ? (this.inspectCache_ = t.video[1].dts, i = t.video[0].dtsTime, n = t.video[1].dtsTime) : t.audio && 2 === t.audio.length && (this.inspectCache_ = t.audio[1].dts, i = t.audio[0].dtsTime, n = t.audio[1].dtsTime), {
                            start: i,
                            end: n
                        }) : null
                    }
                },
                {
                    key: "calculateSegmentTimeMapping_",
                    value: function(e, t) {
                        var i = e.playlist.segments[e.mediaIndex],
                        n = this.timelines[e.timeline];
                        if (null !== e.timestampOffset) m("tsO:", e.timestampOffset),
                        n = {
                            time: e.timestampOffset,
                            mapping: e.timestampOffset - t.start
                        },
                        this.timelines[e.timeline] = n,
                        i.start = e.timestampOffset,
                        i.end = t.end + n.mapping;
                        else {
                            if (!n) return ! 1;
                            i.start = t.start + n.mapping,
                            i.end = t.end + n.mapping
                        }
                        return this.trigger("syncinfoupdate"),
                        !0
                    }
                },
                {
                    key: "saveDiscontinuitySyncInfo_",
                    value: function(e) {
                        var t = e.playlist,
                        i = t.segments[e.mediaIndex];
                        if (i.discontinuity) this.discontinuities[i.timeline] = {
                            time: i.start,
                            accuracy: 0
                        };
                        else if (t.discontinuityStarts.length) for (var n = 0; n < t.discontinuityStarts.length; n++) {
                            var r = t.discontinuityStarts[n],
                            a = t.discontinuitySequence + n + 1,
                            s = r - e.mediaIndex;
                            s > 0 && (!this.discontinuities[a] || this.discontinuities[a].accuracy > s) && (this.discontinuities[a] = {
                                time: i.end + (0, f.sumDurations)(t, e.mediaIndex + 1, r),
                                accuracy: s
                            })
                        }
                    }
                }]),
                t
            } (h.
        default.EventTarget);
            i.
        default = g
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    16 : [function(e, t, i) { (function(e) {
            "use strict";
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var n = "undefined" != typeof window ? window.videojs: "undefined" != typeof e ? e.videojs: null,
            r = function() {
                var e = function e(t, i) {
                    if (t = (0, n.mergeOptions)({
                        timeout: 45e3
                    },
                    t), e.beforeRequest && "function" == typeof e.beforeRequest) {
                        var r = e.beforeRequest(t);
                        r && (t = r)
                    }
                    var a = (0, n.xhr)(t,
                    function(e, t) { ! e && a.response && (a.responseTime = Date.now(), a.roundTripTime = a.responseTime - a.requestTime, a.bytesReceived = a.response.byteLength || a.response.length, a.bandwidth || (a.bandwidth = Math.floor(a.bytesReceived / a.roundTripTime * 8 * 1e3))),
                        e || a.timedout ? a.timedout = a.timedout || "ETIMEDOUT" === e.code: a.timedout = !1,
                        e || 200 === t.statusCode || 206 === t.statusCode || 0 === t.statusCode || (e = new Error("XHR Failed with a response of: " + (a && (a.response || a.responseText)))),
                        i(e, a)
                    });
                    return a.requestTime = Date.now(),
                    a
                };
                return e
            };
            i.
        default = r,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    17 : [function(e, t, i) {
        "use strict";
        function n(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var r = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value" in n && (n.writable = !0),
                    Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i),
                n && e(t, n),
                t
            }
        } (),
        a = function() {
            var e = [[[], [], [], [], []], [[], [], [], [], []]],
            t = e[0],
            i = e[1],
            n = t[4],
            r = i[4],
            a = void 0,
            s = void 0,
            o = void 0,
            u = [],
            d = [],
            l = void 0,
            f = void 0,
            c = void 0,
            h = void 0,
            p = void 0,
            m = void 0;
            for (a = 0; a < 256; a++) d[(u[a] = a << 1 ^ 283 * (a >> 7)) ^ a] = a;
            for (s = o = 0; ! n[s]; s ^= l || 1, o = d[o] || 1) for (h = o ^ o << 1 ^ o << 2 ^ o << 3 ^ o << 4, h = h >> 8 ^ 255 & h ^ 99, n[s] = h, r[h] = s, c = u[f = u[l = u[s]]], m = 16843009 * c ^ 65537 * f ^ 257 * l ^ 16843008 * s, p = 257 * u[h] ^ 16843008 * h, a = 0; a < 4; a++) t[a][s] = p = p << 24 ^ p >>> 8,
            i[a][h] = m = m << 24 ^ m >>> 8;
            for (a = 0; a < 5; a++) t[a] = t[a].slice(0),
            i[a] = i[a].slice(0);
            return e
        },
        s = null,
        o = function() {
            function e(t) {
                n(this, e),
                s || (s = a()),
                this._tables = [[s[0][0].slice(), s[0][1].slice(), s[0][2].slice(), s[0][3].slice(), s[0][4].slice()], [s[1][0].slice(), s[1][1].slice(), s[1][2].slice(), s[1][3].slice(), s[1][4].slice()]];
                var i = void 0,
                r = void 0,
                o = void 0,
                u = void 0,
                d = void 0,
                l = this._tables[0][4],
                f = this._tables[1],
                c = t.length,
                h = 1;
                if (4 !== c && 6 !== c && 8 !== c) throw new Error("Invalid aes key size");
                for (u = t.slice(0), d = [], this._key = [u, d], i = c; i < 4 * c + 28; i++) o = u[i - 1],
                (i % c === 0 || 8 === c && i % c === 4) && (o = l[o >>> 24] << 24 ^ l[o >> 16 & 255] << 16 ^ l[o >> 8 & 255] << 8 ^ l[255 & o], i % c === 0 && (o = o << 8 ^ o >>> 24 ^ h << 24, h = h << 1 ^ 283 * (h >> 7))),
                u[i] = u[i - c] ^ o;
                for (r = 0; i; r++, i--) o = u[3 & r ? i: i - 4],
                i <= 4 || r < 4 ? d[r] = o: d[r] = f[0][l[o >>> 24]] ^ f[1][l[o >> 16 & 255]] ^ f[2][l[o >> 8 & 255]] ^ f[3][l[255 & o]]
            }
            return r(e, [{
                key: "decrypt",
                value: function(e, t, i, n, r, a) {
                    var s = this._key[1],
                    o = e ^ s[0],
                    u = n ^ s[1],
                    d = i ^ s[2],
                    l = t ^ s[3],
                    f = void 0,
                    c = void 0,
                    h = void 0,
                    p = s.length / 4 - 2,
                    m = void 0,
                    y = 4,
                    g = this._tables[1],
                    v = g[0],
                    _ = g[1],
                    b = g[2],
                    T = g[3],
                    S = g[4];
                    for (m = 0; m < p; m++) f = v[o >>> 24] ^ _[u >> 16 & 255] ^ b[d >> 8 & 255] ^ T[255 & l] ^ s[y],
                    c = v[u >>> 24] ^ _[d >> 16 & 255] ^ b[l >> 8 & 255] ^ T[255 & o] ^ s[y + 1],
                    h = v[d >>> 24] ^ _[l >> 16 & 255] ^ b[o >> 8 & 255] ^ T[255 & u] ^ s[y + 2],
                    l = v[l >>> 24] ^ _[o >> 16 & 255] ^ b[u >> 8 & 255] ^ T[255 & d] ^ s[y + 3],
                    y += 4,
                    o = f,
                    u = c,
                    d = h;
                    for (m = 0; m < 4; m++) r[(3 & -m) + a] = S[o >>> 24] << 24 ^ S[u >> 16 & 255] << 16 ^ S[d >> 8 & 255] << 8 ^ S[255 & l] ^ s[y++],
                    f = o,
                    o = u,
                    u = d,
                    d = l,
                    l = f
                }
            }]),
            e
        } ();
        i.
    default = o,
        t.exports = i.
    default
    },
    {}],
    18 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        function r(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        function a(e, t) {
            if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
            e.prototype = Object.create(t && t.prototype, {
                constructor: {
                    value: e,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }),
            t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var s = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value" in n && (n.writable = !0),
                    Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i),
                n && e(t, n),
                t
            }
        } (),
        o = function(e, t, i) {
            for (var n = !0; n;) {
                var r = e,
                a = t,
                s = i;
                n = !1,
                null === r && (r = Function.prototype);
                var o = Object.getOwnPropertyDescriptor(r, a);
                if (void 0 !== o) {
                    if ("value" in o) return o.value;
                    var u = o.get;
                    if (void 0 === u) return;
                    return u.call(s)
                }
                var d = Object.getPrototypeOf(r);
                if (null === d) return;
                e = d,
                t = a,
                i = s,
                n = !0,
                o = d = void 0
            }
        },
        u = e(21),
        d = n(u),
        l = function(e) {
            function t() {
                r(this, t),
                o(Object.getPrototypeOf(t.prototype), "constructor", this).call(this, d.
            default),
                this.jobs = [],
                this.delay = 1,
                this.timeout_ = null
            }
            return a(t, e),
            s(t, [{
                key: "processJob_",
                value: function() {
                    this.jobs.shift()(),
                    this.jobs.length ? this.timeout_ = setTimeout(this.processJob_.bind(this), this.delay) : this.timeout_ = null
                }
            },
            {
                key: "push",
                value: function(e) {
                    this.jobs.push(e),
                    this.timeout_ || (this.timeout_ = setTimeout(this.processJob_.bind(this), this.delay))
                }
            }]),
            t
        } (d.
    default);
        i.
    default = l,
        t.exports = i.
    default
    },
    {}],
    19 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        function r(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var a = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value" in n && (n.writable = !0),
                    Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i),
                n && e(t, n),
                t
            }
        } (),
        s = e(17),
        o = n(s),
        u = e(18),
        d = n(u),
        l = e(23),
        f = function(e) {
            return e << 24 | (65280 & e) << 8 | (16711680 & e) >> 8 | e >>> 24
        },
        c = function(e, t, i) {
            var n = new Int32Array(e.buffer, e.byteOffset, e.byteLength >> 2),
            r = new o.
        default(Array.prototype.slice.call(t)),
            a = new Uint8Array(e.byteLength),
            s = new Int32Array(a.buffer),
            u = void 0,
            d = void 0,
            l = void 0,
            c = void 0,
            h = void 0,
            p = void 0,
            m = void 0,
            y = void 0,
            g = void 0;
            for (u = i[0], d = i[1], l = i[2], c = i[3], g = 0; g < n.length; g += 4) h = f(n[g]),
            p = f(n[g + 1]),
            m = f(n[g + 2]),
            y = f(n[g + 3]),
            r.decrypt(h, p, m, y, s, g),
            s[g] = f(s[g] ^ u),
            s[g + 1] = f(s[g + 1] ^ d),
            s[g + 2] = f(s[g + 2] ^ l),
            s[g + 3] = f(s[g + 3] ^ c),
            u = h,
            d = p,
            l = m,
            c = y;
            return a
        };
        i.decrypt = c;
        var h = function() {
            function e(t, i, n, a) {
                r(this, e);
                var s = e.STEP,
                o = new Int32Array(t.buffer),
                u = new Uint8Array(t.byteLength),
                c = 0;
                for (this.asyncStream_ = new d.
            default, this.asyncStream_.push(this.decryptChunk_(o.subarray(c, c + s), i, n, u)), c = s; c < o.length; c += s) n = new Uint32Array([f(o[c - 4]), f(o[c - 3]), f(o[c - 2]), f(o[c - 1])]),
                this.asyncStream_.push(this.decryptChunk_(o.subarray(c, c + s), i, n, u));
                this.asyncStream_.push(function() {
                    a(null, (0, l.unpad)(u))
                })
            }
            return a(e, [{
                key: "decryptChunk_",
                value: function(e, t, i, n) {
                    return function() {
                        var r = c(e, t, i);
                        n.set(r, e.byteOffset)
                    }
                }
            }], [{
                key: "STEP",
                get: function() {
                    return 32e3
                }
            }]),
            e
        } ();
        i.Decrypter = h,
        i.
    default = {
            Decrypter: h,
            decrypt: c
        }
    },
    {}],
    20 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var r = e(19),
        a = e(18),
        s = n(a);
        i.
    default = {
            decrypt: r.decrypt,
            Decrypter: r.Decrypter,
            AsyncStream: s.
        default
        },
        t.exports = i.
    default
    },
    {}],
    21 : [function(e, t, i) {
        arguments[4][14][0].apply(i, arguments)
    },
    {}],
    22 : [function(e, t, i) {
        "use strict";
        var n;
        t.exports = function(e) {
            var t = n[e.byteLength % 16 || 0],
            i = new Uint8Array(e.byteLength + t.length);
            return i.set(e),
            i.set(t, e.byteLength),
            i
        },
        n = [[16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16], [15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15, 15], [14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14], [13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13], [12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12], [11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11], [10, 10, 10, 10, 10, 10, 10, 10, 10, 10], [9, 9, 9, 9, 9, 9, 9, 9, 9], [8, 8, 8, 8, 8, 8, 8, 8], [7, 7, 7, 7, 7, 7, 7], [6, 6, 6, 6, 6, 6], [5, 5, 5, 5, 5], [4, 4, 4, 4], [3, 3, 3], [2, 2], [1]]
    },
    {}],
    23 : [function(e, t, i) {
        "use strict";
        i.pad = e(22),
        i.unpad = e(24)
    },
    {}],
    24 : [function(e, t, i) {
        "use strict";
        t.exports = function(e) {
            return e.subarray(0, e.byteLength - e[e.byteLength - 1])
        }
    },
    {}],
    25 : [function(e, t, i) {},
    {}],
    26 : [function(e, t, i) { (function(i) {
            var n = "undefined" != typeof i ? i: "undefined" != typeof window ? window: {},
            r = e(25);
            if ("undefined" != typeof document) t.exports = document;
            else {
                var a = n["__GLOBAL_DOCUMENT_CACHE@4"];
                a || (a = n["__GLOBAL_DOCUMENT_CACHE@4"] = r),
                t.exports = a
            }
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    27 : [function(e, t, i) { (function(e) {
            "undefined" != typeof window ? t.exports = window: "undefined" != typeof e ? t.exports = e: "undefined" != typeof self ? t.exports = self: t.exports = {}
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    28 : [function(e, t, i) {
        function n(e, t) {
            if ("function" != typeof e) throw new TypeError(r);
            return t = a(void 0 === t ? e.length - 1 : +t || 0, 0),
            function() {
                for (var i = arguments,
                n = -1,
                r = a(i.length - t, 0), s = Array(r); ++n < r;) s[n] = i[t + n];
                switch (t) {
                case 0:
                    return e.call(this, s);
                case 1:
                    return e.call(this, i[0], s);
                case 2:
                    return e.call(this, i[0], i[1], s)
                }
                var o = Array(t + 1);
                for (n = -1; ++n < t;) o[n] = i[n];
                return o[t] = s,
                e.apply(this, o)
            }
        }
        var r = "Expected a function",
        a = Math.max;
        t.exports = n
    },
    {}],
    29 : [function(e, t, i) {
        function n(e, t) {
            var i = -1,
            n = e.length;
            for (t || (t = Array(n)); ++i < n;) t[i] = e[i];
            return t
        }
        t.exports = n
    },
    {}],
    30 : [function(e, t, i) {
        function n(e, t) {
            for (var i = -1,
            n = e.length; ++i < n && t(e[i], i, e) !== !1;);
            return e
        }
        t.exports = n
    },
    {}],
    31 : [function(e, t, i) {
        function n(e, t, i) {
            i || (i = {});
            for (var n = -1,
            r = t.length; ++n < r;) {
                var a = t[n];
                i[a] = e[a]
            }
            return i
        }
        t.exports = n
    },
    {}],
    32 : [function(e, t, i) {
        var n = e(39),
        r = n();
        t.exports = r
    },
    {}],
    33 : [function(e, t, i) {
        function n(e, t) {
            return r(e, t, a)
        }
        var r = e(32),
        a = e(60);
        t.exports = n
    },
    {}],
    34 : [function(e, t, i) {
        function n(e, t, i, c, h) {
            if (!u(e)) return e;
            var p = o(t) && (s(t) || l(t)),
            m = p ? void 0 : f(t);
            return r(m || t,
            function(r, s) {
                if (m && (s = r, r = t[s]), d(r)) c || (c = []),
                h || (h = []),
                a(e, t, s, n, i, c, h);
                else {
                    var o = e[s],
                    u = i ? i(o, r, s, e, t) : void 0,
                    l = void 0 === u;
                    l && (u = r),
                    void 0 === u && (!p || s in e) || !l && (u === u ? u === o: o !== o) || (e[s] = u)
                }
            }),
            e
        }
        var r = e(30),
        a = e(35),
        s = e(51),
        o = e(42),
        u = e(54),
        d = e(47),
        l = e(57),
        f = e(59);
        t.exports = n
    },
    {}],
    35 : [function(e, t, i) {
        function n(e, t, i, n, f, c, h) {
            for (var p = c.length,
            m = t[i]; p--;) if (c[p] == m) return void(e[i] = h[p]);
            var y = e[i],
            g = f ? f(y, m, i, e, t) : void 0,
            v = void 0 === g;
            v && (g = m, o(m) && (s(m) || d(m)) ? g = s(y) ? y: o(y) ? r(y) : [] : u(m) || a(m) ? g = a(y) ? l(y) : u(y) ? y: {}: v = !1),
            c.push(m),
            h.push(g),
            v ? e[i] = n(g, m, f, c, h) : (g === g ? g !== y: y === y) && (e[i] = g)
        }
        var r = e(29),
        a = e(50),
        s = e(51),
        o = e(42),
        u = e(55),
        d = e(57),
        l = e(58);
        t.exports = n
    },
    {}],
    36 : [function(e, t, i) {
        function n(e) {
            return function(t) {
                return null == t ? void 0 : r(t)[e]
            }
        }
        var r = e(49);
        t.exports = n
    },
    {}],
    37 : [function(e, t, i) {
        function n(e, t, i) {
            if ("function" != typeof e) return r;
            if (void 0 === t) return e;
            switch (i) {
            case 1:
                return function(i) {
                    return e.call(t, i)
                };
            case 3:
                return function(i, n, r) {
                    return e.call(t, i, n, r)
                };
            case 4:
                return function(i, n, r, a) {
                    return e.call(t, i, n, r, a)
                };
            case 5:
                return function(i, n, r, a, s) {
                    return e.call(t, i, n, r, a, s)
                }
            }
            return function() {
                return e.apply(t, arguments)
            }
        }
        var r = e(63);
        t.exports = n
    },
    {}],
    38 : [function(e, t, i) {
        function n(e) {
            return s(function(t, i) {
                var n = -1,
                s = null == t ? 0 : i.length,
                o = s > 2 ? i[s - 2] : void 0,
                u = s > 2 ? i[2] : void 0,
                d = s > 1 ? i[s - 1] : void 0;
                for ("function" == typeof o ? (o = r(o, d, 5), s -= 2) : (o = "function" == typeof d ? d: void 0, s -= o ? 1 : 0), u && a(i[0], i[1], u) && (o = s < 3 ? void 0 : o, s = 1); ++n < s;) {
                    var l = i[n];
                    l && e(t, l, o)
                }
                return t
            })
        }
        var r = e(37),
        a = e(45),
        s = e(28);
        t.exports = n
    },
    {}],
    39 : [function(e, t, i) {
        function n(e) {
            return function(t, i, n) {
                for (var a = r(t), s = n(t), o = s.length, u = e ? o: -1; e ? u--:++u < o;) {
                    var d = s[u];
                    if (i(a[d], d, a) === !1) break
                }
                return t
            }
        }
        var r = e(49);
        t.exports = n
    },
    {}],
    40 : [function(e, t, i) {
        var n = e(36),
        r = n("length");
        t.exports = r
    },
    {}],
    41 : [function(e, t, i) {
        function n(e, t) {
            var i = null == e ? void 0 : e[t];
            return r(i) ? i: void 0
        }
        var r = e(53);
        t.exports = n
    },
    {}],
    42 : [function(e, t, i) {
        function n(e) {
            return null != e && a(r(e))
        }
        var r = e(40),
        a = e(46);
        t.exports = n
    },
    {}],
    43 : [function(e, t, i) {
        var n = function() {
            try {
                Object({
                    toString: 0
                } + "")
            } catch(e) {
                return function() {
                    return ! 1
                }
            }
            return function(e) {
                return "function" != typeof e.toString && "string" == typeof(e + "")
            }
        } ();
        t.exports = n
    },
    {}],
    44 : [function(e, t, i) {
        function n(e, t) {
            return e = "number" == typeof e || r.test(e) ? +e: -1,
            t = null == t ? a: t,
            e > -1 && e % 1 == 0 && e < t
        }
        var r = /^\d+$/,
        a = 9007199254740991;
        t.exports = n
    },
    {}],
    45 : [function(e, t, i) {
        function n(e, t, i) {
            if (!s(i)) return ! 1;
            var n = typeof t;
            if ("number" == n ? r(i) && a(t, i.length) : "string" == n && t in i) {
                var o = i[t];
                return e === e ? e === o: o !== o
            }
            return ! 1
        }
        var r = e(42),
        a = e(44),
        s = e(54);
        t.exports = n
    },
    {}],
    46 : [function(e, t, i) {
        function n(e) {
            return "number" == typeof e && e > -1 && e % 1 == 0 && e <= r
        }
        var r = 9007199254740991;
        t.exports = n
    },
    {}],
    47 : [function(e, t, i) {
        function n(e) {
            return !! e && "object" == typeof e
        }
        t.exports = n
    },
    {}],
    48 : [function(e, t, i) {
        function n(e) {
            for (var t = d(e), i = t.length, n = i && e.length, l = !!n && o(n) && (a(e) || r(e) || u(e)), c = -1, h = []; ++c < i;) {
                var p = t[c]; (l && s(p, n) || f.call(e, p)) && h.push(p)
            }
            return h
        }
        var r = e(50),
        a = e(51),
        s = e(44),
        o = e(46),
        u = e(56),
        d = e(60),
        l = Object.prototype,
        f = l.hasOwnProperty;
        t.exports = n
    },
    {}],
    49 : [function(e, t, i) {
        function n(e) {
            if (s.unindexedChars && a(e)) {
                for (var t = -1,
                i = e.length,
                n = Object(e); ++t < i;) n[t] = e.charAt(t);
                return n
            }
            return r(e) ? e: Object(e)
        }
        var r = e(54),
        a = e(56),
        s = e(62);
        t.exports = n
    },
    {}],
    50 : [function(e, t, i) {
        function n(e) {
            return a(e) && r(e) && o.call(e, "callee") && !u.call(e, "callee")
        }
        var r = e(42),
        a = e(47),
        s = Object.prototype,
        o = s.hasOwnProperty,
        u = s.propertyIsEnumerable;
        t.exports = n
    },
    {}],
    51 : [function(e, t, i) {
        var n = e(41),
        r = e(46),
        a = e(47),
        s = "[object Array]",
        o = Object.prototype,
        u = o.toString,
        d = n(Array, "isArray"),
        l = d ||
        function(e) {
            return a(e) && r(e.length) && u.call(e) == s
        };
        t.exports = l
    },
    {}],
    52 : [function(e, t, i) {
        function n(e) {
            return r(e) && o.call(e) == a
        }
        var r = e(54),
        a = "[object Function]",
        s = Object.prototype,
        o = s.toString;
        t.exports = n
    },
    {}],
    53 : [function(e, t, i) {
        function n(e) {
            return null != e && (r(e) ? f.test(d.call(e)) : s(e) && (a(e) ? f: o).test(e))
        }
        var r = e(52),
        a = e(43),
        s = e(47),
        o = /^\[object .+?Constructor\]$/,
        u = Object.prototype,
        d = Function.prototype.toString,
        l = u.hasOwnProperty,
        f = RegExp("^" + d.call(l).replace(/[\\^$.*+?()[\]{}|]/g, "\\$&").replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g, "$1.*?") + "$");
        t.exports = n
    },
    {}],
    54 : [function(e, t, i) {
        function n(e) {
            var t = typeof e;
            return !! e && ("object" == t || "function" == t)
        }
        t.exports = n
    },
    {}],
    55 : [function(e, t, i) {
        function n(e) {
            var t;
            if (!o(e) || c.call(e) != d || s(e) || a(e) || !f.call(e, "constructor") && (t = e.constructor, "function" == typeof t && !(t instanceof t))) return ! 1;
            var i;
            return u.ownLast ? (r(e,
            function(e, t, n) {
                return i = f.call(n, t),
                !1
            }), i !== !1) : (r(e,
            function(e, t) {
                i = t
            }), void 0 === i || f.call(e, i))
        }
        var r = e(33),
        a = e(50),
        s = e(43),
        o = e(47),
        u = e(62),
        d = "[object Object]",
        l = Object.prototype,
        f = l.hasOwnProperty,
        c = l.toString;
        t.exports = n
    },
    {}],
    56 : [function(e, t, i) {
        function n(e) {
            return "string" == typeof e || r(e) && o.call(e) == a
        }
        var r = e(47),
        a = "[object String]",
        s = Object.prototype,
        o = s.toString;
        t.exports = n
    },
    {}],
    57 : [function(e, t, i) {
        function n(e) {
            return a(e) && r(e.length) && !!E[C.call(e)]
        }
        var r = e(46),
        a = e(47),
        s = "[object Arguments]",
        o = "[object Array]",
        u = "[object Boolean]",
        d = "[object Date]",
        l = "[object Error]",
        f = "[object Function]",
        c = "[object Map]",
        h = "[object Number]",
        p = "[object Object]",
        m = "[object RegExp]",
        y = "[object Set]",
        g = "[object String]",
        v = "[object WeakMap]",
        _ = "[object ArrayBuffer]",
        b = "[object Float32Array]",
        T = "[object Float64Array]",
        S = "[object Int8Array]",
        w = "[object Int16Array]",
        k = "[object Int32Array]",
        O = "[object Uint8Array]",
        P = "[object Uint8ClampedArray]",
        A = "[object Uint16Array]",
        x = "[object Uint32Array]",
        E = {};
        E[b] = E[T] = E[S] = E[w] = E[k] = E[O] = E[P] = E[A] = E[x] = !0,
        E[s] = E[o] = E[_] = E[u] = E[d] = E[l] = E[f] = E[c] = E[h] = E[p] = E[m] = E[y] = E[g] = E[v] = !1;
        var L = Object.prototype,
        C = L.toString;
        t.exports = n
    },
    {}],
    58 : [function(e, t, i) {
        function n(e) {
            return r(e, a(e))
        }
        var r = e(31),
        a = e(60);
        t.exports = n
    },
    {}],
    59 : [function(e, t, i) {
        var n = e(41),
        r = e(42),
        a = e(54),
        s = e(48),
        o = e(62),
        u = n(Object, "keys"),
        d = u ?
        function(e) {
            var t = null == e ? void 0 : e.constructor;
            return "function" == typeof t && t.prototype === e || ("function" == typeof e ? o.enumPrototypes: r(e)) ? s(e) : a(e) ? u(e) : []
        }: s;
        t.exports = d
    },
    {}],
    60 : [function(e, t, i) {
        function n(e) {
            if (null == e) return [];
            l(e) || (e = Object(e));
            var t = e.length;
            t = t && d(t) && (s(e) || a(e) || f(e)) && t || 0;
            for (var i = e.constructor,
            n = -1,
            r = o(i) && i.prototype || k, h = r === e, p = Array(t), m = t > 0, g = c.enumErrorProps && (e === w || e instanceof Error), v = c.enumPrototypes && o(e); ++n < t;) p[n] = n + "";
            for (var b in e) v && "prototype" == b || g && ("message" == b || "name" == b) || m && u(b, t) || "constructor" == b && (h || !P.call(e, b)) || p.push(b);
            if (c.nonEnumShadows && e !== k) {
                var E = e === O ? T: e === w ? y: A.call(e),
                L = x[E] || x[_];
                for (E == _ && (r = k), t = S.length; t--;) {
                    b = S[t];
                    var C = L[b];
                    h && C || (C ? !P.call(e, b) : e[b] === r[b]) || p.push(b)
                }
            }
            return p
        }
        var r = e(30),
        a = e(50),
        s = e(51),
        o = e(52),
        u = e(44),
        d = e(46),
        l = e(54),
        f = e(56),
        c = e(62),
        h = "[object Array]",
        p = "[object Boolean]",
        m = "[object Date]",
        y = "[object Error]",
        g = "[object Function]",
        v = "[object Number]",
        _ = "[object Object]",
        b = "[object RegExp]",
        T = "[object String]",
        S = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"],
        w = Error.prototype,
        k = Object.prototype,
        O = String.prototype,
        P = k.hasOwnProperty,
        A = k.toString,
        x = {};
        x[h] = x[m] = x[v] = {
            constructor: !0,
            toLocaleString: !0,
            toString: !0,
            valueOf: !0
        },
        x[p] = x[T] = {
            constructor: !0,
            toString: !0,
            valueOf: !0
        },
        x[y] = x[g] = x[b] = {
            constructor: !0,
            toString: !0
        },
        x[_] = {
            constructor: !0
        },
        r(S,
        function(e) {
            for (var t in x) if (P.call(x, t)) {
                var i = x[t];
                i[e] = P.call(i, e)
            }
        }),
        t.exports = n
    },
    {}],
    61 : [function(e, t, i) {
        var n = e(34),
        r = e(38),
        a = r(n);
        t.exports = a
    },
    {}],
    62 : [function(e, t, i) {
        var n = Array.prototype,
        r = Error.prototype,
        a = Object.prototype,
        s = a.propertyIsEnumerable,
        o = n.splice,
        u = {}; !
        function(e) {
            var t = function() {
                this.x = e
            },
            i = {
                0 : e,
                length: e
            },
            n = [];
            t.prototype = {
                valueOf: e,
                y: e
            };
            for (var a in new t) n.push(a);
            u.enumErrorProps = s.call(r, "message") || s.call(r, "name"),
            u.enumPrototypes = s.call(t, "prototype"),
            u.nonEnumShadows = !/valueOf/.test(n),
            u.ownLast = "x" != n[0],
            u.spliceObjects = (o.call(i, 0, 1), !i[0]),
            u.unindexedChars = "x" [0] + Object("x")[0] != "xx"
        } (1, 0),
        t.exports = u
    },
    {}],
    63 : [function(e, t, i) {
        function n(e) {
            return e
        }
        t.exports = n
    },
    {}],
    64 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var r = e(65),
        a = n(r),
        s = e(66),
        o = n(s),
        u = e(67),
        d = n(u);
        i.
    default = {
            LineStream: a.
        default,
            ParseStream: o.
        default,
            Parser: d.
        default
        },
        t.exports = i.
    default
    },
    {}],
    65 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        function r(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        function a(e, t) {
            if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
            e.prototype = Object.create(t && t.prototype, {
                constructor: {
                    value: e,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }),
            t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var s = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value" in n && (n.writable = !0),
                    Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i),
                n && e(t, n),
                t
            }
        } (),
        o = function(e, t, i) {
            for (var n = !0; n;) {
                var r = e,
                a = t,
                s = i;
                n = !1,
                null === r && (r = Function.prototype);
                var o = Object.getOwnPropertyDescriptor(r, a);
                if (void 0 !== o) {
                    if ("value" in o) return o.value;
                    var u = o.get;
                    if (void 0 === u) return;
                    return u.call(s)
                }
                var d = Object.getPrototypeOf(r);
                if (null === d) return;
                e = d,
                t = a,
                i = s,
                n = !0,
                o = d = void 0
            }
        },
        u = e(68),
        d = n(u),
        l = function(e) {
            function t() {
                r(this, t),
                o(Object.getPrototypeOf(t.prototype), "constructor", this).call(this),
                this.buffer = ""
            }
            return a(t, e),
            s(t, [{
                key: "push",
                value: function(e) {
                    var t = void 0;
                    for (this.buffer += e, t = this.buffer.indexOf("\n"); t > -1; t = this.buffer.indexOf("\n")) this.trigger("data", this.buffer.substring(0, t)),
                    this.buffer = this.buffer.substring(t + 1)
                }
            }]),
            t
        } (d.
    default);
        i.
    default = l,
        t.exports = i.
    default
    },
    {}],
    66 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        function r(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        function a(e, t) {
            if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
            e.prototype = Object.create(t && t.prototype, {
                constructor: {
                    value: e,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }),
            t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var s = function() {
            function e(e, t) {
                var i = [],
                n = !0,
                r = !1,
                a = void 0;
                try {
                    for (var s, o = e[Symbol.iterator](); ! (n = (s = o.next()).done) && (i.push(s.value), !t || i.length !== t); n = !0);
                } catch(e) {
                    r = !0,
                    a = e
                } finally {
                    try { ! n && o.
                        return && o.
                        return ()
                    } finally {
                        if (r) throw a
                    }
                }
                return i
            }
            return function(t, i) {
                if (Array.isArray(t)) return t;
                if (Symbol.iterator in Object(t)) return e(t, i);
                throw new TypeError("Invalid attempt to destructure non-iterable instance")
            }
        } (),
        o = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value" in n && (n.writable = !0),
                    Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i),
                n && e(t, n),
                t
            }
        } (),
        u = function(e, t, i) {
            for (var n = !0; n;) {
                var r = e,
                a = t,
                s = i;
                n = !1,
                null === r && (r = Function.prototype);
                var o = Object.getOwnPropertyDescriptor(r, a);
                if (void 0 !== o) {
                    if ("value" in o) return o.value;
                    var u = o.get;
                    if (void 0 === u) return;
                    return u.call(s)
                }
                var d = Object.getPrototypeOf(r);
                if (null === d) return;
                e = d,
                t = a,
                i = s,
                n = !0,
                o = d = void 0
            }
        },
        d = e(68),
        l = n(d),
        f = function() {
            var e = "[^=]*",
            t = '"[^"]*"|[^,]*',
            i = "(?:" + e + ")=(?:" + t + ")";
            return new RegExp("(?:^|,)(" + i + ")")
        },
        c = function(e) {
            for (var t = e.split(f()), i = t.length, n = {},
            r = void 0; i--;)"" !== t[i] && (r = /([^=]*)=(.*)/.exec(t[i]).slice(1), r[0] = r[0].replace(/^\s+|\s+$/g, ""), r[1] = r[1].replace(/^\s+|\s+$/g, ""), r[1] = r[1].replace(/^['"](.*)['"]$/g, "$1"), n[r[0]] = r[1]);
            return n
        },
        h = function(e) {
            function t() {
                r(this, t),
                u(Object.getPrototypeOf(t.prototype), "constructor", this).call(this)
            }
            return a(t, e),
            o(t, [{
                key: "push",
                value: function(e) {
                    var t = void 0,
                    i = void 0;
                    if (e = e.replace(/^[\u0000\s]+|[\u0000\s]+$/g, ""), 0 !== e.length) {
                        if ("#" !== e[0]) return void this.trigger("data", {
                            type: "uri",
                            uri: e
                        });
                        if (0 !== e.indexOf("#EXT")) return void this.trigger("data", {
                            type: "comment",
                            text: e.slice(1)
                        });
                        if (e = e.replace("\r", ""), t = /^#EXTM3U/.exec(e)) return void this.trigger("data", {
                            type: "tag",
                            tagType: "m3u"
                        });
                        if (t = /^#EXTINF:?([0-9\.]*)?,?(.*)?$/.exec(e)) return i = {
                            type: "tag",
                            tagType: "inf"
                        },
                        t[1] && (i.duration = parseFloat(t[1])),
                        t[2] && (i.title = t[2]),
                        void this.trigger("data", i);
                        if (t = /^#EXT-X-TARGETDURATION:?([0-9.]*)?/.exec(e)) return i = {
                            type: "tag",
                            tagType: "targetduration"
                        },
                        t[1] && (i.duration = parseInt(t[1], 10)),
                        void this.trigger("data", i);
                        if (t = /^#ZEN-TOTAL-DURATION:?([0-9.]*)?/.exec(e)) return i = {
                            type: "tag",
                            tagType: "totalduration"
                        },
                        t[1] && (i.duration = parseInt(t[1], 10)),
                        void this.trigger("data", i);
                        if (t = /^#EXT-X-VERSION:?([0-9.]*)?/.exec(e)) return i = {
                            type: "tag",
                            tagType: "version"
                        },
                        t[1] && (i.version = parseInt(t[1], 10)),
                        void this.trigger("data", i);
                        if (t = /^#EXT-X-MEDIA-SEQUENCE:?(\-?[0-9.]*)?/.exec(e)) return i = {
                            type: "tag",
                            tagType: "media-sequence"
                        },
                        t[1] && (i.number = parseInt(t[1], 10)),
                        void this.trigger("data", i);
                        if (t = /^#EXT-X-DISCONTINUITY-SEQUENCE:?(\-?[0-9.]*)?/.exec(e)) return i = {
                            type: "tag",
                            tagType: "discontinuity-sequence"
                        },
                        t[1] && (i.number = parseInt(t[1], 10)),
                        void this.trigger("data", i);
                        if (t = /^#EXT-X-PLAYLIST-TYPE:?(.*)?$/.exec(e)) return i = {
                            type: "tag",
                            tagType: "playlist-type"
                        },
                        t[1] && (i.playlistType = t[1]),
                        void this.trigger("data", i);
                        if (t = /^#EXT-X-BYTERANGE:?([0-9.]*)?@?([0-9.]*)?/.exec(e)) return i = {
                            type: "tag",
                            tagType: "byterange"
                        },
                        t[1] && (i.length = parseInt(t[1], 10)),
                        t[2] && (i.offset = parseInt(t[2], 10)),
                        void this.trigger("data", i);
                        if (t = /^#EXT-X-ALLOW-CACHE:?(YES|NO)?/.exec(e)) return i = {
                            type: "tag",
                            tagType: "allow-cache"
                        },
                        t[1] && (i.allowed = !/NO/.test(t[1])),
                        void this.trigger("data", i);
                        if (t = /^#EXT-X-MAP:?(.*)$/.exec(e)) {
                            if (i = {
                                type: "tag",
                                tagType: "map"
                            },
                            t[1]) {
                                var n = c(t[1]);
                                if (n.URI && (i.uri = n.URI), n.BYTERANGE) {
                                    var r = n.BYTERANGE.split("@"),
                                    a = s(r, 2),
                                    o = a[0],
                                    u = a[1];
                                    i.byterange = {},
                                    o && (i.byterange.length = parseInt(o, 10)),
                                    u && (i.byterange.offset = parseInt(u, 10))
                                }
                            }
                            return void this.trigger("data", i)
                        }
                        if (t = /^#EXT-X-STREAM-INF:?(.*)$/.exec(e)) {
                            if (i = {
                                type: "tag",
                                tagType: "stream-inf"
                            },
                            t[1]) {
                                if (i.attributes = c(t[1]), i.attributes.RESOLUTION) {
                                    var d = i.attributes.RESOLUTION.split("x"),
                                    l = {};
                                    d[0] && (l.width = parseInt(d[0], 10)),
                                    d[1] && (l.height = parseInt(d[1], 10)),
                                    i.attributes.RESOLUTION = l
                                }
                                i.attributes.BANDWIDTH && (i.attributes.BANDWIDTH = parseInt(i.attributes.BANDWIDTH, 10)),
                                i.attributes["PROGRAM-ID"] && (i.attributes["PROGRAM-ID"] = parseInt(i.attributes["PROGRAM-ID"], 10))
                            }
                            return void this.trigger("data", i)
                        }
                        return (t = /^#EXT-X-MEDIA:?(.*)$/.exec(e)) ? (i = {
                            type: "tag",
                            tagType: "media"
                        },
                        t[1] && (i.attributes = c(t[1])), void this.trigger("data", i)) : (t = /^#EXT-X-ENDLIST/.exec(e)) ? void this.trigger("data", {
                            type: "tag",
                            tagType: "endlist"
                        }) : (t = /^#EXT-X-DISCONTINUITY/.exec(e)) ? void this.trigger("data", {
                            type: "tag",
                            tagType: "discontinuity"
                        }) : (t = /^#EXT-X-PROGRAM-DATE-TIME:?(.*)$/.exec(e)) ? (i = {
                            type: "tag",
                            tagType: "program-date-time"
                        },
                        t[1] && (i.dateTimeString = t[1], i.dateTimeObject = new Date(t[1])), void this.trigger("data", i)) : (t = /^#EXT-X-KEY:?(.*)$/.exec(e)) ? (i = {
                            type: "tag",
                            tagType: "key"
                        },
                        t[1] && (i.attributes = c(t[1]), i.attributes.IV && ("0x" === i.attributes.IV.substring(0, 2).toLowerCase() && (i.attributes.IV = i.attributes.IV.substring(2)), i.attributes.IV = i.attributes.IV.match(/.{8}/g), i.attributes.IV[0] = parseInt(i.attributes.IV[0], 16), i.attributes.IV[1] = parseInt(i.attributes.IV[1], 16), i.attributes.IV[2] = parseInt(i.attributes.IV[2], 16), i.attributes.IV[3] = parseInt(i.attributes.IV[3], 16), i.attributes.IV = new Uint32Array(i.attributes.IV))), void this.trigger("data", i)) : (t = /^#EXT-X-CUE-OUT-CONT:?(.*)?$/.exec(e)) ? (i = {
                            type: "tag",
                            tagType: "cue-out-cont"
                        },
                        t[1] ? i.data = t[1] : i.data = "", void this.trigger("data", i)) : (t = /^#EXT-X-CUE-OUT:?(.*)?$/.exec(e)) ? (i = {
                            type: "tag",
                            tagType: "cue-out"
                        },
                        t[1] ? i.data = t[1] : i.data = "", void this.trigger("data", i)) : (t = /^#EXT-X-CUE-IN:?(.*)?$/.exec(e)) ? (i = {
                            type: "tag",
                            tagType: "cue-in"
                        },
                        t[1] ? i.data = t[1] : i.data = "", void this.trigger("data", i)) : void this.trigger("data", {
                            type: "tag",
                            data: e.slice(4)
                        })
                    }
                }
            }]),
            t
        } (l.
    default);
        i.
    default = h,
        t.exports = i.
    default
    },
    {}],
    67 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        function r(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        function a(e, t) {
            if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
            e.prototype = Object.create(t && t.prototype, {
                constructor: {
                    value: e,
                    enumerable: !1,
                    writable: !0,
                    configurable: !0
                }
            }),
            t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var s = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value" in n && (n.writable = !0),
                    Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i),
                n && e(t, n),
                t
            }
        } (),
        o = function(e, t, i) {
            for (var n = !0; n;) {
                var r = e,
                a = t,
                s = i;
                n = !1,
                null === r && (r = Function.prototype);
                var o = Object.getOwnPropertyDescriptor(r, a);
                if (void 0 !== o) {
                    if ("value" in o) return o.value;
                    var u = o.get;
                    if (void 0 === u) return;
                    return u.call(s)
                }
                var d = Object.getPrototypeOf(r);
                if (null === d) return;
                e = d,
                t = a,
                i = s,
                n = !0,
                o = d = void 0
            }
        },
        u = e(68),
        d = n(u),
        l = e(65),
        f = n(l),
        c = e(66),
        h = n(c),
        p = e(61),
        m = n(p),
        y = function(e) {
            function t() {
                r(this, t),
                o(Object.getPrototypeOf(t.prototype), "constructor", this).call(this),
                this.lineStream = new f.
            default,
                this.parseStream = new h.
            default,
                this.lineStream.pipe(this.parseStream);
                var e = this,
                i = [],
                n = {},
                a = void 0,
                s = void 0,
                u = function() {},
                d = {
                    AUDIO: {},
                    VIDEO: {},
                    "CLOSED-CAPTIONS": {},
                    SUBTITLES: {}
                },
                l = 0;
                this.manifest = {
                    allowCache: !0,
                    discontinuityStarts: []
                },
                this.parseStream.on("data",
                function(t) {
                    var r = void 0,
                    o = void 0; ({
                        tag: function() { (({
                                "allow-cache": function() {
                                    this.manifest.allowCache = t.allowed,
                                    "allowed" in t || (this.trigger("info", {
                                        message: "defaulting allowCache to YES"
                                    }), this.manifest.allowCache = !0)
                                },
                                byterange: function e() {
                                    var e = {};
                                    "length" in t && (n.byterange = e, e.length = t.length, "offset" in t || (this.trigger("info", {
                                        message: "defaulting offset to zero"
                                    }), t.offset = 0)),
                                    "offset" in t && (n.byterange = e, e.offset = t.offset)
                                },
                                endlist: function() {
                                    this.manifest.endList = !0
                                },
                                inf: function() {
                                    "mediaSequence" in this.manifest || (this.manifest.mediaSequence = 0, this.trigger("info", {
                                        message: "defaulting media sequence to zero"
                                    })),
                                    "discontinuitySequence" in this.manifest || (this.manifest.discontinuitySequence = 0, this.trigger("info", {
                                        message: "defaulting discontinuity sequence to zero"
                                    })),
                                    t.duration > 0 && (n.duration = t.duration),
                                    0 === t.duration && (n.duration = .01, this.trigger("info", {
                                        message: "updating zero segment duration to a small value"
                                    })),
                                    this.manifest.segments = i
                                },
                                key: function() {
                                    return t.attributes ? "NONE" === t.attributes.METHOD ? void(s = null) : t.attributes.URI ? (t.attributes.METHOD || this.trigger("warn", {
                                        message: "defaulting key method to AES-128"
                                    }), s = {
                                        method: t.attributes.METHOD || "AES-128",
                                        uri: t.attributes.URI
                                    },
                                    void("undefined" != typeof t.attributes.IV && (s.iv = t.attributes.IV))) : void this.trigger("warn", {
                                        message: "ignoring key declaration without URI"
                                    }) : void this.trigger("warn", {
                                        message: "ignoring key declaration without attribute list"
                                    })
                                },
                                "media-sequence": function() {
                                    return isFinite(t.number) ? void(this.manifest.mediaSequence = t.number) : void this.trigger("warn", {
                                        message: "ignoring invalid media sequence: " + t.number
                                    })
                                },
                                "discontinuity-sequence": function() {
                                    return isFinite(t.number) ? (this.manifest.discontinuitySequence = t.number, void(l = t.number)) : void this.trigger("warn", {
                                        message: "ignoring invalid discontinuity sequence: " + t.number
                                    })
                                },
                                "playlist-type": function() {
                                    return /VOD|EVENT/.test(t.playlistType) ? void(this.manifest.playlistType = t.playlistType) : void this.trigger("warn", {
                                        message: "ignoring unknown playlist type: " + t.playlist
                                    })
                                },
                                map: function() {
                                    a = {},
                                    t.uri && (a.uri = t.uri),
                                    t.byterange && (a.byterange = t.byterange)
                                },
                                "stream-inf": function() {
                                    return this.manifest.playlists = i,
                                    this.manifest.mediaGroups = this.manifest.mediaGroups || d,
                                    t.attributes ? (n.attributes || (n.attributes = {}), void(n.attributes = (0, m.
                                default)(n.attributes, t.attributes))) : void this.trigger("warn", {
                                        message: "ignoring empty stream-inf attributes"
                                    })
                                },
                                media: function() {
                                    if (this.manifest.mediaGroups = this.manifest.mediaGroups || d, !(t.attributes && t.attributes.TYPE && t.attributes["GROUP-ID"] && t.attributes.NAME)) return void this.trigger("warn", {
                                        message: "ignoring incomplete or missing media group"
                                    });
                                    var e = this.manifest.mediaGroups[t.attributes.TYPE];
                                    e[t.attributes["GROUP-ID"]] = e[t.attributes["GROUP-ID"]] || {},
                                    r = e[t.attributes["GROUP-ID"]],
                                    o = {
                                    default:
                                        /yes/i.test(t.attributes.DEFAULT)
                                    },
                                    o.
                                default ? o.autoselect = !0 : o.autoselect = /yes/i.test(t.attributes.AUTOSELECT),
                                    t.attributes.LANGUAGE && (o.language = t.attributes.LANGUAGE),
                                    t.attributes.URI && (o.uri = t.attributes.URI),
                                    t.attributes["INSTREAM-ID"] && (o.instreamId = t.attributes["INSTREAM-ID"]),
                                    r[t.attributes.NAME] = o
                                },
                                discontinuity: function() {
                                    l += 1,
                                    n.discontinuity = !0,
                                    this.manifest.discontinuityStarts.push(i.length)
                                },
                                "program-date-time": function() {
                                    this.manifest.dateTimeString = t.dateTimeString,
                                    this.manifest.dateTimeObject = t.dateTimeObject
                                },
                                targetduration: function() {
                                    return ! isFinite(t.duration) || t.duration < 0 ? void this.trigger("warn", {
                                        message: "ignoring invalid target duration: " + t.duration
                                    }) : void(this.manifest.targetDuration = t.duration)
                                },
                                totalduration: function() {
                                    return ! isFinite(t.duration) || t.duration < 0 ? void this.trigger("warn", {
                                        message: "ignoring invalid total duration: " + t.duration
                                    }) : void(this.manifest.totalDuration = t.duration)
                                },
                                "cue-out": function() {
                                    n.cueOut = t.data
                                },
                                "cue-out-cont": function() {
                                    n.cueOutCont = t.data
                                },
                                "cue-in": function() {
                                    n.cueIn = t.data
                                }
                            })[t.tagType] || u).call(e)
                        },
                        uri: function() {
                            n.uri = t.uri,
                            i.push(n),
                            !this.manifest.targetDuration || "duration" in n || (this.trigger("warn", {
                                message: "defaulting segment duration to the target duration"
                            }), n.duration = this.manifest.targetDuration),
                            s && (n.key = s),
                            n.timeline = l,
                            a && (n.map = a),
                            n = {}
                        },
                        comment: function() {}
                    })[t.type].call(e)
                })
            }
            return a(t, e),
            s(t, [{
                key: "push",
                value: function(e) {
                    this.lineStream.push(e)
                }
            },
            {
                key: "end",
                value: function() {
                    this.lineStream.push("\n")
                }
            }]),
            t
        } (d.
    default);
        i.
    default = y,
        t.exports = i.
    default
    },
    {}],
    68 : [function(e, t, i) {
        arguments[4][14][0].apply(i, arguments)
    },
    {}],
    69 : [function(e, t, i) {
        "use strict";
        var n, r = e(89);
        n = function() {
            var e = new Uint8Array,
            t = 0;
            n.prototype.init.call(this),
            this.setTimestamp = function(e) {
                t = e
            },
            this.parseId3TagSize = function(e, t) {
                var i = e[t + 6] << 21 | e[t + 7] << 14 | e[t + 8] << 7 | e[t + 9],
                n = e[t + 5],
                r = (16 & n) >> 4;
                return r ? i + 20 : i + 10
            },
            this.parseAdtsSize = function(e, t) {
                var i = (224 & e[t + 5]) >> 5,
                n = e[t + 4] << 3,
                r = 6144 & e[t + 3];
                return r | n | i
            },
            this.push = function(i) {
                var n, r, a, s, o = 0,
                u = 0;
                for (e.length ? (s = e.length, e = new Uint8Array(i.byteLength + s), e.set(e.subarray(0, s)), e.set(i, s)) : e = i; e.length - u >= 3;) if (e[u] !== "I".charCodeAt(0) || e[u + 1] !== "D".charCodeAt(0) || e[u + 2] !== "3".charCodeAt(0)) if (e[u] & !0 && 240 === (240 & e[u + 1])) {
                    if (e.length - u < 7) break;
                    if (o = this.parseAdtsSize(e, u), o > e.length) break;
                    a = {
                        type: "audio",
                        data: e.subarray(u, u + o),
                        pts: t,
                        dts: t
                    },
                    this.trigger("data", a),
                    u += o
                } else u++;
                else {
                    if (e.length - u < 10) break;
                    if (o = this.parseId3TagSize(e, u), o > e.length) break;
                    r = {
                        type: "timed-metadata",
                        data: e.subarray(u, u + o)
                    },
                    this.trigger("data", r),
                    u += o
                }
                n = e.length - u,
                e = n > 0 ? e.subarray(u) : new Uint8Array
            }
        },
        n.prototype = new r,
        t.exports = n
    },
    {}],
    70 : [function(e, t, i) {
        "use strict";
        var n = [96e3, 88200, 64e3, 48e3, 44100, 32e3, 24e3, 22050, 16e3, 12e3, 11025, 8e3, 7350],
        r = function(e) {
            return e[0] << 21 | e[1] << 14 | e[2] << 7 | e[3]
        },
        a = function(e, t, i) {
            var n, r = "";
            for (n = t; n < i; n++) r += "%" + ("00" + e[n].toString(16)).slice( - 2);
            return r
        },
        s = function(e, t, i) {
            return unescape(a(e, t, i))
        },
        o = function(e, t) {
            var i = e[t + 6] << 21 | e[t + 7] << 14 | e[t + 8] << 7 | e[t + 9],
            n = e[t + 5],
            r = (16 & n) >> 4;
            return r ? i + 20 : i + 10
        },
        u = function(e, t) {
            var i = (224 & e[t + 5]) >> 5,
            n = e[t + 4] << 3,
            r = 6144 & e[t + 3];
            return r | n | i
        },
        d = function(e, t) {
            return e[t] === "I".charCodeAt(0) && e[t + 1] === "D".charCodeAt(0) && e[t + 2] === "3".charCodeAt(0) ? "timed-metadata": e[t] & !0 && 240 === (240 & e[t + 1]) ? "audio": null
        },
        l = function(e) {
            for (var t = 0; t + 5 < e.length;) {
                if (255 === e[t] && 240 === (246 & e[t + 1])) return n[(60 & e[t + 2]) >>> 2];
                t++
            }
            return null
        },
        f = function(e) {
            var t, i, n, a;
            t = 10,
            64 & e[5] && (t += 4, t += r(e.subarray(10, 14)));
            do {
                if (i = r(e.subarray(t + 4, t + 8)), i < 1) return null;
                if (a = String.fromCharCode(e[t], e[t + 1], e[t + 2], e[t + 3]), "PRIV" === a) {
                    n = e.subarray(t + 10, t + i + 10);
                    for (var o = 0; o < n.byteLength; o++) if (0 === n[o]) {
                        var u = s(n, 0, o);
                        if ("com.apple.streaming.transportStreamTimestamp" === u) {
                            var d = n.subarray(o + 1),
                            l = (1 & d[3]) << 30 | d[4] << 22 | d[5] << 14 | d[6] << 6 | d[7] >>> 2;
                            return l *= 4,
                            l += 3 & d[7]
                        }
                        break
                    }
                }
                t += 10, t += i
            } while ( t < e . byteLength );
            return null
        };
        t.exports = {
            parseId3TagSize: o,
            parseAdtsSize: u,
            parseType: d,
            parseSampleRate: l,
            parseAacTimestamp: f
        }
    },
    {}],
    71 : [function(e, t, i) {
        "use strict";
        var n, r = e(89),
        a = [96e3, 88200, 64e3, 48e3, 44100, 32e3, 24e3, 22050, 16e3, 12e3, 11025, 8e3, 7350];
        n = function() {
            var e;
            n.prototype.init.call(this),
            this.push = function(t) {
                var i, n, r, s, o, u, d = 0,
                l = 0;
                if ("audio" === t.type) for (e ? (s = e, e = new Uint8Array(s.byteLength + t.data.byteLength), e.set(s), e.set(t.data, s.byteLength)) : e = t.data; d + 5 < e.length;) if (255 === e[d] && 240 === (246 & e[d + 1])) {
                    if (n = 2 * (1 & ~e[d + 1]), i = (3 & e[d + 3]) << 11 | e[d + 4] << 3 | (224 & e[d + 5]) >> 5, o = 1024 * ((3 & e[d + 6]) + 1), u = 9e4 * o / a[(60 & e[d + 2]) >>> 2], r = d + i, e.byteLength < r) return;
                    if (this.trigger("data", {
                        pts: t.pts + l * u,
                        dts: t.dts + l * u,
                        sampleCount: o,
                        audioobjecttype: (e[d + 2] >>> 6 & 3) + 1,
                        channelcount: (1 & e[d + 2]) << 2 | (192 & e[d + 3]) >>> 6,
                        samplerate: a[(60 & e[d + 2]) >>> 2],
                        samplingfrequencyindex: (60 & e[d + 2]) >>> 2,
                        samplesize: 16,
                        data: e.subarray(d + 7 + n, r)
                    }), e.byteLength === r) return void(e = void 0);
                    l++,
                    e = e.subarray(r)
                } else d++
            },
            this.flush = function() {
                this.trigger("done")
            }
        },
        n.prototype = new r,
        t.exports = n
    },
    {}],
    72 : [function(e, t, i) {
        "use strict";
        var n, r, a, s = e(89),
        o = e(88);
        r = function() {
            var e, t, i = 0;
            r.prototype.init.call(this),
            this.push = function(n) {
                var r;
                for (t ? (r = new Uint8Array(t.byteLength + n.data.byteLength), r.set(t), r.set(n.data, t.byteLength), t = r) : t = n.data; i < t.byteLength - 3; i++) if (1 === t[i + 2]) {
                    e = i + 5;
                    break
                }
                for (; e < t.byteLength;) switch (t[e]) {
                case 0:
                    if (0 !== t[e - 1]) {
                        e += 2;
                        break
                    }
                    if (0 !== t[e - 2]) {
                        e++;
                        break
                    }
                    i + 3 !== e - 2 && this.trigger("data", t.subarray(i + 3, e - 2));
                    do e++;
                    while (1 !== t[e] && e < t.length);
                    i = e - 2,
                    e += 3;
                    break;
                case 1:
                    if (0 !== t[e - 1] || 0 !== t[e - 2]) {
                        e += 3;
                        break
                    }
                    this.trigger("data", t.subarray(i + 3, e - 2)),
                    i = e - 2,
                    e += 3;
                    break;
                default:
                    e += 3
                }
                t = t.subarray(i),
                e -= i,
                i = 0
            },
            this.flush = function() {
                t && t.byteLength > 3 && this.trigger("data", t.subarray(i + 3)),
                t = null,
                i = 0,
                this.trigger("done")
            }
        },
        r.prototype = new s,
        a = {
            100 : !0,
            110 : !0,
            122 : !0,
            244 : !0,
            44 : !0,
            83 : !0,
            86 : !0,
            118 : !0,
            128 : !0,
            138 : !0,
            139 : !0,
            134 : !0
        },
        n = function() {
            var e, t, i, s, u, d, l, f = new r;
            n.prototype.init.call(this),
            e = this,
            this.push = function(e) {
                "video" === e.type && (t = e.trackId, i = e.pts, s = e.dts, f.push(e))
            },
            f.on("data",
            function(n) {
                var r = {
                    trackId: t,
                    pts: i,
                    dts: s,
                    data: n
                };
                switch (31 & n[0]) {
                case 5:
                    r.nalUnitType = "slice_layer_without_partitioning_rbsp_idr";
                    break;
                case 6:
                    r.nalUnitType = "sei_rbsp",
                    r.escapedRBSP = u(n.subarray(1));
                    break;
                case 7:
                    r.nalUnitType = "seq_parameter_set_rbsp",
                    r.escapedRBSP = u(n.subarray(1)),
                    r.config = d(r.escapedRBSP);
                    break;
                case 8:
                    r.nalUnitType = "pic_parameter_set_rbsp";
                    break;
                case 9:
                    r.nalUnitType = "access_unit_delimiter_rbsp"
                }
                e.trigger("data", r)
            }),
            f.on("done",
            function() {
                e.trigger("done")
            }),
            this.flush = function() {
                f.flush()
            },
            l = function(e, t) {
                var i, n, r = 8,
                a = 8;
                for (i = 0; i < e; i++) 0 !== a && (n = t.readExpGolomb(), a = (r + n + 256) % 256),
                r = 0 === a ? r: a
            },
            u = function(e) {
                for (var t, i, n = e.byteLength,
                r = [], a = 1; a < n - 2;) 0 === e[a] && 0 === e[a + 1] && 3 === e[a + 2] ? (r.push(a + 2), a += 2) : a++;
                if (0 === r.length) return e;
                t = n - r.length,
                i = new Uint8Array(t);
                var s = 0;
                for (a = 0; a < t; s++, a++) s === r[0] && (s++, r.shift()),
                i[a] = e[s];
                return i
            },
            d = function(e) {
                var t, i, n, r, s, u, d, f, c, h, p, m, y, g, v = 0,
                _ = 0,
                b = 0,
                T = 0,
                S = 1;
                if (t = new o(e), i = t.readUnsignedByte(), r = t.readUnsignedByte(), n = t.readUnsignedByte(), t.skipUnsignedExpGolomb(), a[i] && (s = t.readUnsignedExpGolomb(), 3 === s && t.skipBits(1), t.skipUnsignedExpGolomb(), t.skipUnsignedExpGolomb(), t.skipBits(1), t.readBoolean())) for (p = 3 !== s ? 8 : 12, g = 0; g < p; g++) t.readBoolean() && (g < 6 ? l(16, t) : l(64, t));
                if (t.skipUnsignedExpGolomb(), u = t.readUnsignedExpGolomb(), 0 === u) t.readUnsignedExpGolomb();
                else if (1 === u) for (t.skipBits(1), t.skipExpGolomb(), t.skipExpGolomb(), d = t.readUnsignedExpGolomb(), g = 0; g < d; g++) t.skipExpGolomb();
                if (t.skipUnsignedExpGolomb(), t.skipBits(1), f = t.readUnsignedExpGolomb(), c = t.readUnsignedExpGolomb(), h = t.readBits(1), 0 === h && t.skipBits(1), t.skipBits(1), t.readBoolean() && (v = t.readUnsignedExpGolomb(), _ = t.readUnsignedExpGolomb(), b = t.readUnsignedExpGolomb(), T = t.readUnsignedExpGolomb()), t.readBoolean() && t.readBoolean()) {
                    switch (y = t.readUnsignedByte()) {
                    case 1:
                        m = [1, 1];
                        break;
                    case 2:
                        m = [12, 11];
                        break;
                    case 3:
                        m = [10, 11];
                        break;
                    case 4:
                        m = [16, 11];
                        break;
                    case 5:
                        m = [40, 33];
                        break;
                    case 6:
                        m = [24, 11];
                        break;
                    case 7:
                        m = [20, 11];
                        break;
                    case 8:
                        m = [32, 11];
                        break;
                    case 9:
                        m = [80, 33];
                        break;
                    case 10:
                        m = [18, 11];
                        break;
                    case 11:
                        m = [15, 11];
                        break;
                    case 12:
                        m = [64, 33];
                        break;
                    case 13:
                        m = [160, 99];
                        break;
                    case 14:
                        m = [4, 3];
                        break;
                    case 15:
                        m = [3, 2];
                        break;
                    case 16:
                        m = [2, 1];
                        break;
                    case 255:
                        m = [t.readUnsignedByte() << 8 | t.readUnsignedByte(), t.readUnsignedByte() << 8 | t.readUnsignedByte()]
                    }
                    m && (S = m[0] / m[1])
                }
                return {
                    profileIdc: i,
                    levelIdc: n,
                    profileCompatibility: r,
                    width: Math.ceil((16 * (f + 1) - 2 * v - 2 * _) * S),
                    height: (2 - h) * (c + 1) * 16 - 2 * b - 2 * T
                }
            }
        },
        n.prototype = new s,
        t.exports = {
            H264Stream: n,
            NalByteStream: r
        }
    },
    {}],
    73 : [function(e, t, i) {
        "use strict";
        var n = e(89),
        r = function(e) {
            this.numberOfTracks = 0,
            this.metadataStream = e.metadataStream,
            this.videoTags = [],
            this.audioTags = [],
            this.videoTrack = null,
            this.audioTrack = null,
            this.pendingCaptions = [],
            this.pendingMetadata = [],
            this.pendingTracks = 0,
            this.processedTracks = 0,
            r.prototype.init.call(this),
            this.push = function(e) {
                return e.text ? this.pendingCaptions.push(e) : e.frames ? this.pendingMetadata.push(e) : ("video" === e.track.type && (this.videoTrack = e.track, this.videoTags = e.tags, this.pendingTracks++), void("audio" === e.track.type && (this.audioTrack = e.track, this.audioTags = e.tags, this.pendingTracks++)))
            }
        };
        r.prototype = new n,
        r.prototype.flush = function(e) {
            var t, i, n, r, a = {
                tags: {},
                captions: [],
                metadata: []
            };
            if (this.pendingTracks < this.numberOfTracks) {
                if ("VideoSegmentStream" !== e && "AudioSegmentStream" !== e) return;
                if (0 === this.pendingTracks && (this.processedTracks++, this.processedTracks < this.numberOfTracks)) return
            }
            if (this.processedTracks += this.pendingTracks, this.pendingTracks = 0, !(this.processedTracks < this.numberOfTracks)) {
                for (this.videoTrack ? r = this.videoTrack.timelineStartInfo.pts: this.audioTrack && (r = this.audioTrack.timelineStartInfo.pts), a.tags.videoTags = this.videoTags, a.tags.audioTags = this.audioTags, n = 0; n < this.pendingCaptions.length; n++) i = this.pendingCaptions[n],
                i.startTime = i.startPts - r,
                i.startTime /= 9e4,
                i.endTime = i.endPts - r,
                i.endTime /= 9e4,
                a.captions.push(i);
                for (n = 0; n < this.pendingMetadata.length; n++) t = this.pendingMetadata[n],
                t.cueTime = t.pts - r,
                t.cueTime /= 9e4,
                a.metadata.push(t);
                a.metadata.dispatchType = this.metadataStream.dispatchType,
                this.videoTrack = null,
                this.audioTrack = null,
                this.videoTags = [],
                this.audioTags = [],
                this.pendingCaptions.length = 0,
                this.pendingMetadata.length = 0,
                this.pendingTracks = 0,
                this.processedTracks = 0,
                this.trigger("data", a),
                this.trigger("done")
            }
        },
        t.exports = r
    },
    {}],
    74 : [function(e, t, i) {
        "use strict";
        var n;
        n = function(e, t) {
            var i, r = 0,
            a = 16384,
            s = function(e, t) {
                var i, n = e.position + t;
                n < e.bytes.byteLength || (i = new Uint8Array(2 * n), i.set(e.bytes.subarray(0, e.position), 0), e.bytes = i, e.view = new DataView(e.bytes.buffer))
            },
            o = n.widthBytes || new Uint8Array("width".length),
            u = n.heightBytes || new Uint8Array("height".length),
            d = n.videocodecidBytes || new Uint8Array("videocodecid".length);
            if (!n.widthBytes) {
                for (i = 0; i < "width".length; i++) o[i] = "width".charCodeAt(i);
                for (i = 0; i < "height".length; i++) u[i] = "height".charCodeAt(i);
                for (i = 0; i < "videocodecid".length; i++) d[i] = "videocodecid".charCodeAt(i);
                n.widthBytes = o,
                n.heightBytes = u,
                n.videocodecidBytes = d
            }
            switch (this.keyFrame = !1, e) {
            case n.VIDEO_TAG:
                this.length = 16,
                a *= 6;
                break;
            case n.AUDIO_TAG:
                this.length = 13,
                this.keyFrame = !0;
                break;
            case n.METADATA_TAG:
                this.length = 29,
                this.keyFrame = !0;
                break;
            default:
                throw new Error("Unknown FLV tag type")
            }
            this.bytes = new Uint8Array(a),
            this.view = new DataView(this.bytes.buffer),
            this.bytes[0] = e,
            this.position = this.length,
            this.keyFrame = t,
            this.pts = 0,
            this.dts = 0,
            this.writeBytes = function(e, t, i) {
                var n, r = t || 0;
                i = i || e.byteLength,
                n = r + i,
                s(this, i),
                this.bytes.set(e.subarray(r, n), this.position),
                this.position += i,
                this.length = Math.max(this.length, this.position)
            },
            this.writeByte = function(e) {
                s(this, 1),
                this.bytes[this.position] = e,
                this.position++,
                this.length = Math.max(this.length, this.position)
            },
            this.writeShort = function(e) {
                s(this, 2),
                this.view.setUint16(this.position, e),
                this.position += 2,
                this.length = Math.max(this.length, this.position)
            },
            this.negIndex = function(e) {
                return this.bytes[this.length - e]
            },
            this.nalUnitSize = function() {
                return 0 === r ? 0 : this.length - (r + 4)
            },
            this.startNalUnit = function() {
                if (r > 0) throw new Error("Attempted to create new NAL wihout closing the old one");
                r = this.length,
                this.length += 4,
                this.position = this.length
            },
            this.endNalUnit = function(e) {
                var t, i;
                this.length === r + 4 ? this.length -= 4 : r > 0 && (t = r + 4, i = this.length - t, this.position = r, this.view.setUint32(this.position, i), this.position = this.length, e && e.push(this.bytes.subarray(t, t + i))),
                r = 0
            },
            this.writeMetaDataDouble = function(e, t) {
                var i;
                if (s(this, 2 + e.length + 9), this.view.setUint16(this.position, e.length), this.position += 2, "width" === e) this.bytes.set(o, this.position),
                this.position += 5;
                else if ("height" === e) this.bytes.set(u, this.position),
                this.position += 6;
                else if ("videocodecid" === e) this.bytes.set(d, this.position),
                this.position += 12;
                else for (i = 0; i < e.length; i++) this.bytes[this.position] = e.charCodeAt(i),
                this.position++;
                this.position++,
                this.view.setFloat64(this.position, t),
                this.position += 8,
                this.length = Math.max(this.length, this.position),
                ++r
            },
            this.writeMetaDataBoolean = function(e, t) {
                var i;
                for (s(this, 2), this.view.setUint16(this.position, e.length), this.position += 2, i = 0; i < e.length; i++) s(this, 1),
                this.bytes[this.position] = e.charCodeAt(i),
                this.position++;
                s(this, 2),
                this.view.setUint8(this.position, 1),
                this.position++,
                this.view.setUint8(this.position, t ? 1 : 0),
                this.position++,
                this.length = Math.max(this.length, this.position),
                ++r
            },
            this.finalize = function() {
                var e, i;
                switch (this.bytes[0]) {
                case n.VIDEO_TAG:
                    this.bytes[11] = 7 | (this.keyFrame || t ? 16 : 32),
                    this.bytes[12] = t ? 0 : 1,
                    e = this.pts - this.dts,
                    this.bytes[13] = (16711680 & e) >>> 16,
                    this.bytes[14] = (65280 & e) >>> 8,
                    this.bytes[15] = (255 & e) >>> 0;
                    break;
                case n.AUDIO_TAG:
                    this.bytes[11] = 175,
                    this.bytes[12] = t ? 0 : 1;
                    break;
                case n.METADATA_TAG:
                    this.position = 11,
                    this.view.setUint8(this.position, 2),
                    this.position++,
                    this.view.setUint16(this.position, 10),
                    this.position += 2,
                    this.bytes.set([111, 110, 77, 101, 116, 97, 68, 97, 116, 97], this.position),
                    this.position += 10,
                    this.bytes[this.position] = 8,
                    this.position++,
                    this.view.setUint32(this.position, r),
                    this.position = this.length,
                    this.bytes.set([0, 0, 9], this.position),
                    this.position += 3,
                    this.length = this.position
                }
                return i = this.length - 11,
                this.bytes[1] = (16711680 & i) >>> 16,
                this.bytes[2] = (65280 & i) >>> 8,
                this.bytes[3] = (255 & i) >>> 0,
                this.bytes[4] = (16711680 & this.dts) >>> 16,
                this.bytes[5] = (65280 & this.dts) >>> 8,
                this.bytes[6] = (255 & this.dts) >>> 0,
                this.bytes[7] = (4278190080 & this.dts) >>> 24,
                this.bytes[8] = 0,
                this.bytes[9] = 0,
                this.bytes[10] = 0,
                s(this, 4),
                this.view.setUint32(this.length, this.length),
                this.length += 4,
                this.position += 4,
                this.bytes = this.bytes.subarray(0, this.length),
                this.frameTime = n.frameTime(this.bytes),
                this
            }
        },
        n.AUDIO_TAG = 8,
        n.VIDEO_TAG = 9,
        n.METADATA_TAG = 18,
        n.isAudioFrame = function(e) {
            return n.AUDIO_TAG === e[0]
        },
        n.isVideoFrame = function(e) {
            return n.VIDEO_TAG === e[0]
        },
        n.isMetaData = function(e) {
            return n.METADATA_TAG === e[0]
        },
        n.isKeyFrame = function(e) {
            return n.isVideoFrame(e) ? 23 === e[11] : !!n.isAudioFrame(e) || !!n.isMetaData(e)
        },
        n.frameTime = function(e) {
            var t = e[4] << 16;
            return t |= e[5] << 8,
            t |= e[6] << 0,
            t |= e[7] << 24
        },
        t.exports = n
    },
    {}],
    75 : [function(e, t, i) {
        t.exports = {
            tag: e(74),
            Transmuxer: e(76)
        }
    },
    {}],
    76 : [function(e, t, i) {
        "use strict";
        var n, r, a, s, o, u, d = e(89),
        l = e(74),
        f = e(78),
        c = e(71),
        h = e(72).H264Stream,
        p = e(73);
        s = function(e, t) {
            "number" == typeof t.pts && (void 0 === e.timelineStartInfo.pts ? e.timelineStartInfo.pts = t.pts: e.timelineStartInfo.pts = Math.min(e.timelineStartInfo.pts, t.pts)),
            "number" == typeof t.dts && (void 0 === e.timelineStartInfo.dts ? e.timelineStartInfo.dts = t.dts: e.timelineStartInfo.dts = Math.min(e.timelineStartInfo.dts, t.dts))
        },
        o = function(e, t) {
            var i = new l(l.METADATA_TAG);
            return i.dts = t,
            i.pts = t,
            i.writeMetaDataDouble("videocodecid", 7),
            i.writeMetaDataDouble("width", e.width),
            i.writeMetaDataDouble("height", e.height),
            i
        },
        u = function(e, t) {
            var i, n = new l(l.VIDEO_TAG, !0);
            for (n.dts = t, n.pts = t, n.writeByte(1), n.writeByte(e.profileIdc), n.writeByte(e.profileCompatibility), n.writeByte(e.levelIdc), n.writeByte(255), n.writeByte(225), n.writeShort(e.sps[0].length), n.writeBytes(e.sps[0]), n.writeByte(e.pps.length), i = 0; i < e.pps.length; ++i) n.writeShort(e.pps[i].length),
            n.writeBytes(e.pps[i]);
            return n
        },
        a = function(e) {
            var t, i = [];
            a.prototype.init.call(this),
            this.push = function(t) {
                s(e, t),
                e && void 0 === e.channelcount && (e.audioobjecttype = t.audioobjecttype, e.channelcount = t.channelcount, e.samplerate = t.samplerate, e.samplingfrequencyindex = t.samplingfrequencyindex, e.samplesize = t.samplesize, e.extraData = e.audioobjecttype << 11 | e.samplingfrequencyindex << 7 | e.channelcount << 3),
                t.pts = Math.round(t.pts / 90),
                t.dts = Math.round(t.dts / 90),
                i.push(t)
            },
            this.flush = function() {
                var n, r, a, s = [];
                if (0 === i.length) return void this.trigger("done", "AudioSegmentStream");
                for (a = -(1 / 0); i.length;) n = i.shift(),
                (e.extraData !== t || n.pts - a >= 1e3) && (r = new l(l.METADATA_TAG), r.pts = n.pts, r.dts = n.dts, r.writeMetaDataDouble("audiocodecid", 10), r.writeMetaDataBoolean("stereo", 2 === e.channelcount), r.writeMetaDataDouble("audiosamplerate", e.samplerate), r.writeMetaDataDouble("audiosamplesize", 16), s.push(r), t = e.extraData, r = new l(l.AUDIO_TAG, !0), r.pts = n.pts, r.dts = n.dts, r.view.setUint16(r.position, e.extraData), r.position += 2, r.length = Math.max(r.length, r.position), s.push(r), a = n.pts),
                r = new l(l.AUDIO_TAG),
                r.pts = n.pts,
                r.dts = n.dts,
                r.writeBytes(n.data),
                s.push(r);
                t = null,
                this.trigger("data", {
                    track: e,
                    tags: s
                }),
                this.trigger("done", "AudioSegmentStream")
            }
        },
        a.prototype = new d,
        r = function(e) {
            var t, i, n = [];
            r.prototype.init.call(this),
            this.finishFrame = function(n, r) {
                r && (t && e && e.newMetadata && (r.keyFrame || 0 === n.length) && (n.push(o(t, r.dts)), n.push(u(e, r.dts)), e.newMetadata = !1), r.endNalUnit(), n.push(r), i = null)
            },
            this.push = function(t) {
                s(e, t),
                t.pts = Math.round(t.pts / 90),
                t.dts = Math.round(t.dts / 90),
                n.push(t)
            },
            this.flush = function() {
                for (var r, a = []; n.length && "access_unit_delimiter_rbsp" !== n[0].nalUnitType;) n.shift();
                if (0 === n.length) return void this.trigger("done", "VideoSegmentStream");
                for (; n.length;) r = n.shift(),
                "seq_parameter_set_rbsp" === r.nalUnitType ? (e.newMetadata = !0, t = r.config, e.width = t.width, e.height = t.height, e.sps = [r.data], e.profileIdc = t.profileIdc, e.levelIdc = t.levelIdc, e.profileCompatibility = t.profileCompatibility, i.endNalUnit()) : "pic_parameter_set_rbsp" === r.nalUnitType ? (e.newMetadata = !0, e.pps = [r.data], i.endNalUnit()) : "access_unit_delimiter_rbsp" === r.nalUnitType ? (i && this.finishFrame(a, i), i = new l(l.VIDEO_TAG), i.pts = r.pts, i.dts = r.dts) : ("slice_layer_without_partitioning_rbsp_idr" === r.nalUnitType && (i.keyFrame = !0), i.endNalUnit()),
                i.startNalUnit(),
                i.writeBytes(r.data);
                i && this.finishFrame(a, i),
                this.trigger("data", {
                    track: e,
                    tags: a
                }),
                this.trigger("done", "VideoSegmentStream")
            }
        },
        r.prototype = new d,
        n = function(e) {
            var t, i, s, o, u, d, m, y, g, v, _, b, T = this;
            n.prototype.init.call(this),
            e = e || {},
            this.metadataStream = new f.MetadataStream,
            e.metadataStream = this.metadataStream,
            t = new f.TransportPacketStream,
            i = new f.TransportParseStream,
            s = new f.ElementaryStream,
            o = new f.TimestampRolloverStream("video"),
            u = new f.TimestampRolloverStream("audio"),
            d = new f.TimestampRolloverStream("timed-metadata"),
            m = new c,
            y = new h,
            b = new p(e),
            t.pipe(i).pipe(s),
            s.pipe(o).pipe(y),
            s.pipe(u).pipe(m),
            s.pipe(d).pipe(this.metadataStream).pipe(b),
            _ = new f.CaptionStream,
            y.pipe(_).pipe(b),
            s.on("data",
            function(e) {
                var t, i, n;
                if ("metadata" === e.type) {
                    for (t = e.tracks.length; t--;)"video" === e.tracks[t].type ? i = e.tracks[t] : "audio" === e.tracks[t].type && (n = e.tracks[t]);
                    i && !g && (b.numberOfTracks++, g = new r(i), y.pipe(g).pipe(b)),
                    n && !v && (b.numberOfTracks++, v = new a(n), m.pipe(v).pipe(b))
                }
            }),
            this.push = function(e) {
                t.push(e)
            },
            this.flush = function() {
                t.flush()
            },
            b.on("data",
            function(e) {
                T.trigger("data", e)
            }),
            b.on("done",
            function() {
                T.trigger("done")
            }),
            this.getFlvHeader = function(e, t, i) {
                var n, r, a, s = new Uint8Array(9),
                o = new DataView(s.buffer);
                return e = e || 0,
                t = void 0 === t || t,
                i = void 0 === i || i,
                o.setUint8(0, 70),
                o.setUint8(1, 76),
                o.setUint8(2, 86),
                o.setUint8(3, 1),
                o.setUint8(4, (t ? 4 : 0) | (i ? 1 : 0)),
                o.setUint32(5, s.byteLength),
                e <= 0 ? (r = new Uint8Array(s.byteLength + 4), r.set(s), r.set([0, 0, 0, 0], s.byteLength), r) : (n = new l(l.METADATA_TAG), n.pts = n.dts = 0, n.writeMetaDataDouble("duration", e), a = n.finalize().length, r = new Uint8Array(s.byteLength + a), r.set(s), r.set(o.byteLength, a), r)
            }
        },
        n.prototype = new d,
        t.exports = n
    },
    {}],
    77 : [function(e, t, i) {
        "use strict";
        var n = 4,
        r = 128,
        a = e(89),
        s = function(e) {
            for (var t = 0,
            i = {
                payloadType: -1,
                payloadSize: 0
            },
            a = 0, s = 0; t < e.byteLength && e[t] !== r;) {
                for (; 255 === e[t];) a += 255,
                t++;
                for (a += e[t++]; 255 === e[t];) s += 255,
                t++;
                if (s += e[t++], !i.payload && a === n) {
                    i.payloadType = a,
                    i.payloadSize = s,
                    i.payload = e.subarray(t, t + s);
                    break
                }
                t += s,
                a = 0,
                s = 0
            }
            return i
        },
        o = function(e) {
            return 181 !== e.payload[0] ? null: 49 !== (e.payload[1] << 8 | e.payload[2]) ? null: "GA94" !== String.fromCharCode(e.payload[3], e.payload[4], e.payload[5], e.payload[6]) ? null: 3 !== e.payload[7] ? null: e.payload.subarray(8, e.payload.length - 1)
        },
        u = function(e, t) {
            var i, n, r, a, s = [];
            if (! (64 & t[0])) return s;
            for (n = 31 & t[0], i = 0; i < n; i++) r = 3 * i,
            a = {
                type: 3 & t[r + 2],
                pts: e
            },
            4 & t[r + 2] && (a.ccData = t[r + 3] << 8 | t[r + 4], s.push(a));
            return s
        },
        d = function() {
            d.prototype.init.call(this),
            this.captionPackets_ = [],
            this.field1_ = new k,
            this.field1_.on("data", this.trigger.bind(this, "data")),
            this.field1_.on("done", this.trigger.bind(this, "done"))
        };
        d.prototype = new a,
        d.prototype.push = function(e) {
            var t, i;
            "sei_rbsp" === e.nalUnitType && (t = s(e.escapedRBSP), t.payloadType === n && (i = o(t), i && (this.captionPackets_ = this.captionPackets_.concat(u(e.pts, i)))))
        },
        d.prototype.flush = function() {
            return this.captionPackets_.length ? (this.captionPackets_.forEach(function(e, t) {
                e.presortIndex = t
            }), this.captionPackets_.sort(function(e, t) {
                return e.pts === t.pts ? e.presortIndex - t.presortIndex: e.pts - t.pts
            }), this.captionPackets_.forEach(this.field1_.push, this.field1_), this.captionPackets_.length = 0, void this.field1_.flush()) : void this.field1_.flush()
        };
        var l = {
            42 : 225,
            92 : 233,
            94 : 237,
            95 : 243,
            96 : 250,
            123 : 231,
            124 : 247,
            125 : 209,
            126 : 241,
            127 : 9608
        },
        f = function(e) {
            return null === e ? "": (e = l[e] || e, String.fromCharCode(e))
        },
        c = 0,
        h = 5152,
        p = 5167,
        m = 5157,
        y = 5158,
        g = 5159,
        v = 5165,
        _ = 5153,
        b = 5164,
        T = 5166,
        S = 14,
        w = function() {
            for (var e = [], t = S + 1; t--;) e.push("");
            return e
        },
        k = function() {
            k.prototype.init.call(this),
            this.mode_ = "popOn",
            this.topRow_ = 0,
            this.startPts_ = 0,
            this.displayed_ = w(),
            this.nonDisplayed_ = w(),
            this.lastControlCode_ = null,
            this.push = function(e) {
                if (0 === e.type) {
                    var t, i, n, r;
                    if (t = 32639 & e.ccData, t === this.lastControlCode_) return void(this.lastControlCode_ = null);
                    switch (4096 === (61440 & t) ? this.lastControlCode_ = t: this.lastControlCode_ = null, t) {
                    case c:
                        break;
                    case h:
                        this.mode_ = "popOn";
                        break;
                    case p:
                        this.flushDisplayed(e.pts),
                        i = this.displayed_,
                        this.displayed_ = this.nonDisplayed_,
                        this.nonDisplayed_ = i,
                        this.startPts_ = e.pts;
                        break;
                    case m:
                        this.topRow_ = S - 1,
                        this.mode_ = "rollUp";
                        break;
                    case y:
                        this.topRow_ = S - 2,
                        this.mode_ = "rollUp";
                        break;
                    case g:
                        this.topRow_ = S - 3,
                        this.mode_ = "rollUp";
                        break;
                    case v:
                        this.flushDisplayed(e.pts),
                        this.shiftRowsUp_(),
                        this.startPts_ = e.pts;
                        break;
                    case _:
                        "popOn" === this.mode_ ? this.nonDisplayed_[S] = this.nonDisplayed_[S].slice(0, -1) : this.displayed_[S] = this.displayed_[S].slice(0, -1);
                        break;
                    case b:
                        this.flushDisplayed(e.pts),
                        this.displayed_ = w();
                        break;
                    case T:
                        this.nonDisplayed_ = w();
                        break;
                    default:
                        if (n = t >>> 8, r = 255 & t, n >= 16 && n <= 23 && r >= 64 && r <= 127 && (16 !== n || r < 96) && (n = 32, r = null), (17 === n || 25 === n) && r >= 48 && r <= 63 && (n = 9834, r = ""), 16 === (240 & n)) return;
                        this[this.mode_](e.pts, n, r)
                    }
                }
            }
        };
        k.prototype = new a,
        k.prototype.flushDisplayed = function(e) {
            var t = this.displayed_.map(function(e) {
                return e.trim()
            }).filter(function(e) {
                return e.length
            }).join("\n");
            t.length && this.trigger("data", {
                startPts: this.startPts_,
                endPts: e,
                text: t
            })
        },
        k.prototype.popOn = function(e, t, i) {
            var n = this.nonDisplayed_[S];
            n += f(t),
            n += f(i),
            this.nonDisplayed_[S] = n
        },
        k.prototype.rollUp = function(e, t, i) {
            var n = this.displayed_[S];
            "" === n && (this.flushDisplayed(e), this.startPts_ = e),
            n += f(t),
            n += f(i),
            this.displayed_[S] = n
        },
        k.prototype.shiftRowsUp_ = function() {
            var e;
            for (e = 0; e < this.topRow_; e++) this.displayed_[e] = "";
            for (e = this.topRow_; e < S; e++) this.displayed_[e] = this.displayed_[e + 1];
            this.displayed_[S] = ""
        },
        t.exports = {
            CaptionStream: d,
            Cea608Stream: k
        }
    },
    {}],
    78 : [function(e, t, i) {
        "use strict";
        var n, r, a, s = e(89),
        o = e(77),
        u = e(81),
        d = e(82).TimestampRolloverStream,
        l = e(81),
        f = 188,
        c = 71;
        n = function() {
            var e = new Uint8Array(f),
            t = 0;
            n.prototype.init.call(this),
            this.push = function(i) {
                var n, r = 0,
                a = f;
                for (t ? (n = new Uint8Array(i.byteLength + t), n.set(e.subarray(0, t)), n.set(i, t), t = 0) : n = i; a < n.byteLength;) n[r] !== c || n[a] !== c ? (r++, a++) : (this.trigger("data", n.subarray(r, a)), r += f, a += f);
                r < n.byteLength && (e.set(n.subarray(r), 0), t = n.byteLength - r)
            },
            this.flush = function() {
                t === f && e[0] === c && (this.trigger("data", e), t = 0),
                this.trigger("done")
            }
        },
        n.prototype = new s,
        r = function() {
            var e, t, i, n;
            r.prototype.init.call(this),
            n = this,
            this.packetsWaitingForPmt = [],
            this.programMapTable = void 0,
            e = function(e, n) {
                var r = 0;
                n.payloadUnitStartIndicator && (r += e[r] + 1),
                "pat" === n.type ? t(e.subarray(r), n) : i(e.subarray(r), n)
            },
            t = function(e, t) {
                t.section_number = e[7],
                t.last_section_number = e[8],
                n.pmtPid = (31 & e[10]) << 8 | e[11],
                t.pmtPid = n.pmtPid
            },
            i = function(e, t) {
                var i, r, a, s;
                if (1 & e[5]) {
                    for (n.programMapTable = {},
                    i = (15 & e[1]) << 8 | e[2], r = 3 + i - 4, a = (15 & e[10]) << 8 | e[11], s = 12 + a; s < r;) n.programMapTable[(31 & e[s + 1]) << 8 | e[s + 2]] = e[s],
                    s += ((15 & e[s + 3]) << 8 | e[s + 4]) + 5;
                    for (t.programMapTable = n.programMapTable; n.packetsWaitingForPmt.length;) n.processPes_.apply(n, n.packetsWaitingForPmt.shift())
                }
            },
            this.push = function(t) {
                var i = {},
                n = 4;
                i.payloadUnitStartIndicator = !!(64 & t[1]),
                i.pid = 31 & t[1],
                i.pid <<= 8,
                i.pid |= t[2],
                (48 & t[3]) >>> 4 > 1 && (n += t[n] + 1),
                0 === i.pid ? (i.type = "pat", e(t.subarray(n), i), this.trigger("data", i)) : i.pid === this.pmtPid ? (i.type = "pmt", e(t.subarray(n), i), this.trigger("data", i)) : void 0 === this.programMapTable ? this.packetsWaitingForPmt.push([t, n, i]) : this.processPes_(t, n, i)
            },
            this.processPes_ = function(e, t, i) {
                i.streamType = this.programMapTable[i.pid],
                i.type = "pes",
                i.data = e.subarray(t),
                this.trigger("data", i)
            }
        },
        r.prototype = new s,
        r.STREAM_TYPES = {
            h264: 27,
            adts: 15
        },
        a = function() {
            var e = this,
            t = {
                data: [],
                size: 0
            },
            i = {
                data: [],
                size: 0
            },
            n = {
                data: [],
                size: 0
            },
            r = function(e, t) {
                var i;
                t.dataAlignmentIndicator = 0 !== (4 & e[6]),
                i = e[7],
                192 & i && (t.pts = (14 & e[9]) << 27 | (255 & e[10]) << 20 | (254 & e[11]) << 12 | (255 & e[12]) << 5 | (254 & e[13]) >>> 3, t.pts *= 4, t.pts += (6 & e[13]) >>> 1, t.dts = t.pts, 64 & i && (t.dts = (14 & e[14]) << 27 | (255 & e[15]) << 20 | (254 & e[16]) << 12 | (255 & e[17]) << 5 | (254 & e[18]) >>> 3, t.dts *= 4, t.dts += (6 & e[18]) >>> 1)),
                t.data = e.subarray(9 + e[8])
            },
            s = function(t, i) {
                var n, a = new Uint8Array(t.size),
                s = {
                    type: i
                },
                o = 0;
                if (t.data.length) {
                    for (s.trackId = t.data[0].pid; t.data.length;) n = t.data.shift(),
                    a.set(n.data, o),
                    o += n.data.byteLength;
                    r(a, s),
                    t.size = 0,
                    e.trigger("data", s)
                }
            };
            a.prototype.init.call(this),
            this.push = function(r) { ({
                    pat: function() {},
                    pes: function() {
                        var e, a;
                        switch (r.streamType) {
                        case u.H264_STREAM_TYPE:
                        case l.H264_STREAM_TYPE:
                            e = t,
                            a = "video";
                            break;
                        case u.ADTS_STREAM_TYPE:
                            e = i,
                            a = "audio";
                            break;
                        case u.METADATA_STREAM_TYPE:
                            e = n,
                            a = "timed-metadata";
                            break;
                        default:
                            return
                        }
                        r.payloadUnitStartIndicator && s(e, a),
                        e.data.push(r),
                        e.size += r.data.byteLength
                    },
                    pmt: function() {
                        var t, i, n = {
                            type: "metadata",
                            tracks: []
                        },
                        a = r.programMapTable;
                        for (t in a) a.hasOwnProperty(t) && (i = {
                            timelineStartInfo: {
                                baseMediaDecodeTime: 0
                            }
                        },
                        i.id = +t, a[t] === l.H264_STREAM_TYPE ? (i.codec = "avc", i.type = "video") : a[t] === l.ADTS_STREAM_TYPE && (i.codec = "adts", i.type = "audio"), n.tracks.push(i));
                        e.trigger("data", n)
                    }
                })[r.type]()
            },
            this.flush = function() {
                s(t, "video"),
                s(i, "audio"),
                s(n, "timed-metadata"),
                this.trigger("done")
            }
        },
        a.prototype = new s;
        var h = {
            PAT_PID: 0,
            MP2T_PACKET_LENGTH: f,
            TransportPacketStream: n,
            TransportParseStream: r,
            ElementaryStream: a,
            TimestampRolloverStream: d,
            CaptionStream: o.CaptionStream,
            Cea608Stream: o.Cea608Stream,
            MetadataStream: e(79)
        };
        for (var p in u) u.hasOwnProperty(p) && (h[p] = u[p]);
        t.exports = h
    },
    {}],
    79 : [function(e, t, i) {
        "use strict";
        var n, r = e(89),
        a = e(81),
        s = function(e, t, i) {
            var n, r = "";
            for (n = t; n < i; n++) r += "%" + ("00" + e[n].toString(16)).slice( - 2);
            return r
        },
        o = function(e, t, i) {
            return decodeURIComponent(s(e, t, i))
        },
        u = function(e, t, i) {
            return unescape(s(e, t, i))
        },
        d = function(e) {
            return e[0] << 21 | e[1] << 14 | e[2] << 7 | e[3]
        },
        l = {
            TXXX: function(e) {
                var t;
                if (3 === e.data[0]) {
                    for (t = 1; t < e.data.length; t++) if (0 === e.data[t]) {
                        e.description = o(e.data, 1, t),
                        e.value = o(e.data, t + 1, e.data.length - 1);
                        break
                    }
                    e.data = e.value
                }
            },
            WXXX: function(e) {
                var t;
                if (3 === e.data[0]) for (t = 1; t < e.data.length; t++) if (0 === e.data[t]) {
                    e.description = o(e.data, 1, t),
                    e.url = o(e.data, t + 1, e.data.length);
                    break
                }
            },
            PRIV: function(e) {
                var t;
                for (t = 0; t < e.data.length; t++) if (0 === e.data[t]) {
                    e.owner = u(e.data, 0, t);
                    break
                }
                e.privateData = e.data.subarray(t + 1),
                e.data = e.privateData
            }
        };
        n = function(e) {
            var t, i = {
                debug: !(!e || !e.debug),
                descriptor: e && e.descriptor
            },
            r = 0,
            s = [],
            o = 0;
            if (n.prototype.init.call(this), this.dispatchType = a.METADATA_STREAM_TYPE.toString(16), i.descriptor) for (t = 0; t < i.descriptor.length; t++) this.dispatchType += ("00" + i.descriptor[t].toString(16)).slice( - 2);
            this.push = function(e) {
                var t, n, a, u, f, c;
                if ("timed-metadata" === e.type) {
                    if (e.dataAlignmentIndicator && (o = 0, s.length = 0), 0 === s.length && (e.data.length < 10 || e.data[0] !== "I".charCodeAt(0) || e.data[1] !== "D".charCodeAt(0) || e.data[2] !== "3".charCodeAt(0))) return void(i.debug && console.log("Skipping unrecognized metadata packet"));
                    if (s.push(e), o += e.data.byteLength, 1 === s.length && (r = d(e.data.subarray(6, 10)), r += 10), !(o < r)) {
                        for (t = {
                            data: new Uint8Array(r),
                            frames: [],
                            pts: s[0].pts,
                            dts: s[0].dts
                        },
                        f = 0; f < r;) t.data.set(s[0].data.subarray(0, r - f), f),
                        f += s[0].data.byteLength,
                        o -= s[0].data.byteLength,
                        s.shift();
                        n = 10,
                        64 & t.data[5] && (n += 4, n += d(t.data.subarray(10, 14)), r -= d(t.data.subarray(16, 20)));
                        do {
                            if (a = d(t.data.subarray(n + 4, n + 8)), a < 1) return console.log("Malformed ID3 frame encountered. Skipping metadata parsing.");
                            if (c = String.fromCharCode(t.data[n], t.data[n + 1], t.data[n + 2], t.data[n + 3]), u = {
                                id: c,
                                data: t.data.subarray(n + 10, n + a + 10)
                            },
                            u.key = u.id, l[u.id] && (l[u.id](u), "com.apple.streaming.transportStreamTimestamp" === u.owner)) {
                                var h = u.data,
                                p = (1 & h[3]) << 30 | h[4] << 22 | h[5] << 14 | h[6] << 6 | h[7] >>> 2;
                                p *= 4,
                                p += 3 & h[7],
                                u.timeStamp = p,
                                void 0 === t.pts && void 0 === t.dts && (t.pts = u.timeStamp, t.dts = u.timeStamp),
                                this.trigger("timestamp", u)
                            }
                            t.frames.push(u), n += 10, n += a
                        } while ( n < r );
                        this.trigger("data", t)
                    }
                }
            }
        },
        n.prototype = new r,
        t.exports = n
    },
    {}],
    80 : [function(e, t, i) {
        "use strict";
        var n = e(81),
        r = function(e) {
            var t = 31 & e[1];
            return t <<= 8,
            t |= e[2]
        },
        a = function(e) {
            return !! (64 & e[1])
        },
        s = function(e) {
            var t = 0;
            return (48 & e[3]) >>> 4 > 1 && (t += e[4] + 1),
            t
        },
        o = function(e, t) {
            var i = r(e);
            return 0 === i ? "pat": i === t ? "pmt": t ? "pes": null
        },
        u = function(e) {
            var t = a(e),
            i = 4 + s(e);
            return t && (i += e[i] + 1),
            (31 & e[i + 10]) << 8 | e[i + 11]
        },
        d = function(e) {
            var t = {},
            i = a(e),
            n = 4 + s(e);
            if (i && (n += e[n] + 1), 1 & e[n + 5]) {
                var r, o, u;
                r = (15 & e[n + 1]) << 8 | e[n + 2],
                o = 3 + r - 4,
                u = (15 & e[n + 10]) << 8 | e[n + 11];
                for (var d = 12 + u; d < o;) {
                    var l = n + d;
                    t[(31 & e[l + 1]) << 8 | e[l + 2]] = e[l],
                    d += ((15 & e[l + 3]) << 8 | e[l + 4]) + 5
                }
                return t
            }
        },
        l = function(e, t) {
            var i = r(e),
            a = t[i];
            switch (a) {
            case n.H264_STREAM_TYPE:
                return "video";
            case n.ADTS_STREAM_TYPE:
                return "audio";
            case n.METADATA_STREAM_TYPE:
                return "timed-metadata";
            default:
                return null
            }
        },
        f = function(e) {
            var t = a(e);
            if (!t) return null;
            var i, n = 4 + s(e),
            r = {};
            return i = e[n + 7],
            192 & i && (r.pts = (14 & e[n + 9]) << 27 | (255 & e[n + 10]) << 20 | (254 & e[n + 11]) << 12 | (255 & e[n + 12]) << 5 | (254 & e[n + 13]) >>> 3, r.pts *= 4, r.pts += (6 & e[n + 13]) >>> 1, r.dts = r.pts, 64 & i && (r.dts = (14 & e[n + 14]) << 27 | (255 & e[n + 15]) << 20 | (254 & e[n + 16]) << 12 | (255 & e[n + 17]) << 5 | (254 & e[n + 18]) >>> 3, r.dts *= 4, r.dts += (6 & e[n + 18]) >>> 1)),
            r
        },
        c = function(e) {
            switch (e) {
            case 5:
                return "slice_layer_without_partitioning_rbsp_idr";
            case 6:
                return "sei_rbsp";
            case 7:
                return "seq_parameter_set_rbsp";
            case 8:
                return "pic_parameter_set_rbsp";
            case 9:
                return "access_unit_delimiter_rbsp";
            default:
                return null
            }
        },
        h = function(e) {
            for (var t, i = 4 + s(e), n = e.subarray(i), r = 0, a = 0, o = !1; a < n.byteLength - 3; a++) if (1 === n[a + 2]) {
                r = a + 5;
                break
            }
            for (; r < n.byteLength;) switch (n[r]) {
            case 0:
                if (0 !== n[r - 1]) {
                    r += 2;
                    break
                }
                if (0 !== n[r - 2]) {
                    r++;
                    break
                }
                a + 3 !== r - 2 && (t = c(31 & n[a + 3]), "slice_layer_without_partitioning_rbsp_idr" === t && (o = !0));
                do r++;
                while (1 !== n[r] && r < n.length);
                a = r - 2,
                r += 3;
                break;
            case 1:
                if (0 !== n[r - 1] || 0 !== n[r - 2]) {
                    r += 3;
                    break
                }
                t = c(31 & n[a + 3]),
                "slice_layer_without_partitioning_rbsp_idr" === t && (o = !0),
                a = r - 2,
                r += 3;
                break;
            default:
                r += 3
            }
            return n = n.subarray(a),
            r -= a,
            a = 0,
            n && n.byteLength > 3 && (t = c(31 & n[a + 3]), "slice_layer_without_partitioning_rbsp_idr" === t && (o = !0)),
            o
        };
        t.exports = {
            parseType: o,
            parsePat: u,
            parsePmt: d,
            parsePayloadUnitStartIndicator: a,
            parsePesType: l,
            parsePesTime: f,
            videoPacketContainsKeyFrame: h
        }
    },
    {}],
    81 : [function(e, t, i) {
        "use strict";
        t.exports = {
            H264_STREAM_TYPE: 27,
            ADTS_STREAM_TYPE: 15,
            METADATA_STREAM_TYPE: 21
        }
    },
    {}],
    82 : [function(e, t, i) {
        "use strict";
        var n = e(89),
        r = 8589934592,
        a = 4294967296,
        s = function(e, t) {
            var i = 1;
            for (e > t && (i = -1); Math.abs(t - e) > a;) e += i * r;
            return e
        },
        o = function(e) {
            var t, i;
            o.prototype.init.call(this),
            this.type_ = e,
            this.push = function(e) {
                e.type === this.type_ && (void 0 === i && (i = e.dts), e.dts = s(e.dts, i), e.pts = s(e.pts, i), t = e.dts, this.trigger("data", e))
            },
            this.flush = function() {
                i = t,
                this.trigger("done")
            }
        };
        o.prototype = new n,
        t.exports = {
            TimestampRolloverStream: o,
            handleRollover: s
        }
    },
    {}],
    83 : [function(e, t, i) {
        t.exports = {
            generator: e(84),
            Transmuxer: e(86).Transmuxer,
            AudioSegmentStream: e(86).AudioSegmentStream,
            VideoSegmentStream: e(86).VideoSegmentStream
        }
    },
    {}],
    84 : [function(e, t, i) {
        "use strict";
        var n, r, a, s, o, u, d, l, f, c, h, p, m, y, g, v, _, b, T, S, w, k, O, P, A, x, E, L, C, I, U, D, M, j, B, R, N = Math.pow(2, 32) - 1; !
        function() {
            var e;
            if (O = {
                avc1: [],
                avcC: [],
                btrt: [],
                dinf: [],
                dref: [],
                esds: [],
                ftyp: [],
                hdlr: [],
                mdat: [],
                mdhd: [],
                mdia: [],
                mfhd: [],
                minf: [],
                moof: [],
                moov: [],
                mp4a: [],
                mvex: [],
                mvhd: [],
                sdtp: [],
                smhd: [],
                stbl: [],
                stco: [],
                stsc: [],
                stsd: [],
                stsz: [],
                stts: [],
                styp: [],
                tfdt: [],
                tfhd: [],
                traf: [],
                trak: [],
                trun: [],
                trex: [],
                tkhd: [],
                vmhd: []
            },
            "undefined" != typeof Uint8Array) {
                for (e in O) O.hasOwnProperty(e) && (O[e] = [e.charCodeAt(0), e.charCodeAt(1), e.charCodeAt(2), e.charCodeAt(3)]);
                P = new Uint8Array(["i".charCodeAt(0), "s".charCodeAt(0), "o".charCodeAt(0), "m".charCodeAt(0)]),
                x = new Uint8Array(["a".charCodeAt(0), "v".charCodeAt(0), "c".charCodeAt(0), "1".charCodeAt(0)]),
                A = new Uint8Array([0, 0, 0, 1]),
                E = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0, 118, 105, 100, 101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 86, 105, 100, 101, 111, 72, 97, 110, 100, 108, 101, 114, 0]),
                L = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0, 115, 111, 117, 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 83, 111, 117, 110, 100, 72, 97, 110, 100, 108, 101, 114, 0]),
                C = {
                    video: E,
                    audio: L
                },
                D = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 12, 117, 114, 108, 32, 0, 0, 0, 1]),
                U = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0]),
                M = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0]),
                j = M,
                B = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]),
                R = M,
                I = new Uint8Array([0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0])
            }
        } (),
        n = function(e) {
            var t, i, n, r = [],
            a = 0;
            for (t = 1; t < arguments.length; t++) r.push(arguments[t]);
            for (t = r.length; t--;) a += r[t].byteLength;
            for (i = new Uint8Array(a + 8), n = new DataView(i.buffer, i.byteOffset, i.byteLength), n.setUint32(0, i.byteLength), i.set(e, 4), t = 0, a = 8; t < r.length; t++) i.set(r[t], a),
            a += r[t].byteLength;
            return i
        },
        r = function() {
            return n(O.dinf, n(O.dref, D))
        },
        a = function(e) {
            return n(O.esds, new Uint8Array([0, 0, 0, 0, 3, 25, 0, 0, 0, 4, 17, 64, 21, 0, 6, 0, 0, 0, 218, 192, 0, 0, 218, 192, 5, 2, e.audioobjecttype << 3 | e.samplingfrequencyindex >>> 1, e.samplingfrequencyindex << 7 | e.channelcount << 3, 6, 1, 2]))
        },
        s = function() {
            return n(O.ftyp, P, A, P, x)
        },
        v = function(e) {
            return n(O.hdlr, C[e])
        },
        o = function(e) {
            return n(O.mdat, e)
        },
        g = function(e) {
            var t = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 3, 0, 1, 95, 144, e.duration >>> 24 & 255, e.duration >>> 16 & 255, e.duration >>> 8 & 255, 255 & e.duration, 85, 196, 0, 0]);
            return e.samplerate && (t[12] = e.samplerate >>> 24 & 255, t[13] = e.samplerate >>> 16 & 255, t[14] = e.samplerate >>> 8 & 255, t[15] = 255 & e.samplerate),
            n(O.mdhd, t)
        },
        y = function(e) {
            return n(O.mdia, g(e), v(e.type), d(e))
        },
        u = function(e) {
            return n(O.mfhd, new Uint8Array([0, 0, 0, 0, (4278190080 & e) >> 24, (16711680 & e) >> 16, (65280 & e) >> 8, 255 & e]))
        },
        d = function(e) {
            return n(O.minf, "video" === e.type ? n(O.vmhd, I) : n(O.smhd, U), r(), b(e))
        },
        l = function(e, t) {
            for (var i = [], r = t.length; r--;) i[r] = S(t[r]);
            return n.apply(null, [O.moof, u(e)].concat(i))
        },
        f = function(e) {
            for (var t = e.length,
            i = []; t--;) i[t] = p(e[t]);
            return n.apply(null, [O.moov, h(4294967295)].concat(i).concat(c(e)))
        },
        c = function(e) {
            for (var t = e.length,
            i = []; t--;) i[t] = w(e[t]);
            return n.apply(null, [O.mvex].concat(i))
        },
        h = function(e) {
            var t = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2, 0, 1, 95, 144, (4278190080 & e) >> 24, (16711680 & e) >> 16, (65280 & e) >> 8, 255 & e, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255]);
            return n(O.mvhd, t)
        },
        _ = function(e) {
            var t, i, r = e.samples || [],
            a = new Uint8Array(4 + r.length);
            for (i = 0; i < r.length; i++) t = r[i].flags,
            a[i + 4] = t.dependsOn << 4 | t.isDependedOn << 2 | t.hasRedundancy;
            return n(O.sdtp, a)
        },
        b = function(e) {
            return n(O.stbl, T(e), n(O.stts, R), n(O.stsc, j), n(O.stsz, B), n(O.stco, M))
        },
        function() {
            var e, t;
            T = function(i) {
                return n(O.stsd, new Uint8Array([0, 0, 0, 0, 0, 0, 0, 1]), "video" === i.type ? e(i) : t(i))
            },
            e = function(e) {
                var t, i = e.sps || [],
                r = e.pps || [],
                a = [],
                s = [];
                for (t = 0; t < i.length; t++) a.push((65280 & i[t].byteLength) >>> 8),
                a.push(255 & i[t].byteLength),
                a = a.concat(Array.prototype.slice.call(i[t]));
                for (t = 0; t < r.length; t++) s.push((65280 & r[t].byteLength) >>> 8),
                s.push(255 & r[t].byteLength),
                s = s.concat(Array.prototype.slice.call(r[t]));
                return n(O.avc1, new Uint8Array([0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (65280 & e.width) >> 8, 255 & e.width, (65280 & e.height) >> 8, 255 & e.height, 0, 72, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 1, 19, 118, 105, 100, 101, 111, 106, 115, 45, 99, 111, 110, 116, 114, 105, 98, 45, 104, 108, 115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 17, 17]), n(O.avcC, new Uint8Array([1, e.profileIdc, e.profileCompatibility, e.levelIdc, 255].concat([i.length]).concat(a).concat([r.length]).concat(s))), n(O.btrt, new Uint8Array([0, 28, 156, 128, 0, 45, 198, 192, 0, 45, 198, 192])))
            },
            t = function(e) {
                return n(O.mp4a, new Uint8Array([0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, (65280 & e.channelcount) >> 8, 255 & e.channelcount, (65280 & e.samplesize) >> 8, 255 & e.samplesize, 0, 0, 0, 0, (65280 & e.samplerate) >> 8, 255 & e.samplerate, 0, 0]), a(e))
            }
        } (),
        m = function(e) {
            var t = new Uint8Array([0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, (4278190080 & e.id) >> 24, (16711680 & e.id) >> 16, (65280 & e.id) >> 8, 255 & e.id, 0, 0, 0, 0, (4278190080 & e.duration) >> 24, (16711680 & e.duration) >> 16, (65280 & e.duration) >> 8, 255 & e.duration, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, (65280 & e.width) >> 8, 255 & e.width, 0, 0, (65280 & e.height) >> 8, 255 & e.height, 0, 0]);
            return n(O.tkhd, t)
        },
        S = function(e) {
            var t, i, r, a, s, o, u;
            return t = n(O.tfhd, new Uint8Array([0, 0, 0, 58, (4278190080 & e.id) >> 24, (16711680 & e.id) >> 16, (65280 & e.id) >> 8, 255 & e.id, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])),
            o = Math.floor(e.baseMediaDecodeTime / (N + 1)),
            u = Math.floor(e.baseMediaDecodeTime % (N + 1)),
            i = n(O.tfdt, new Uint8Array([1, 0, 0, 0, o >>> 24 & 255, o >>> 16 & 255, o >>> 8 & 255, 255 & o, u >>> 24 & 255, u >>> 16 & 255, u >>> 8 & 255, 255 & u])),
            s = 92,
            "audio" === e.type ? (r = k(e, s), n(O.traf, t, i, r)) : (a = _(e), r = k(e, a.length + s), n(O.traf, t, i, r, a))
        },
        p = function(e) {
            return e.duration = e.duration || 4294967295,
            n(O.trak, m(e), y(e))
        },
        w = function(e) {
            var t = new Uint8Array([0, 0, 0, 0, (4278190080 & e.id) >> 24, (16711680 & e.id) >> 16, (65280 & e.id) >> 8, 255 & e.id, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1]);
            return "video" !== e.type && (t[t.length - 1] = 0),
            n(O.trex, t)
        },
        function() {
            var e, t, i;
            i = function(e, t) {
                var i = 0,
                n = 0,
                r = 0,
                a = 0;
                return e.length && (void 0 !== e[0].duration && (i = 1), void 0 !== e[0].size && (n = 2), void 0 !== e[0].flags && (r = 4), void 0 !== e[0].compositionTimeOffset && (a = 8)),
                [0, 0, i | n | r | a, 1, (4278190080 & e.length) >>> 24, (16711680 & e.length) >>> 16, (65280 & e.length) >>> 8, 255 & e.length, (4278190080 & t) >>> 24, (16711680 & t) >>> 16, (65280 & t) >>> 8, 255 & t]
            },
            t = function(e, t) {
                var r, a, s, o;
                for (a = e.samples || [], t += 20 + 16 * a.length, r = i(a, t), o = 0; o < a.length; o++) s = a[o],
                r = r.concat([(4278190080 & s.duration) >>> 24, (16711680 & s.duration) >>> 16, (65280 & s.duration) >>> 8, 255 & s.duration, (4278190080 & s.size) >>> 24, (16711680 & s.size) >>> 16, (65280 & s.size) >>> 8, 255 & s.size, s.flags.isLeading << 2 | s.flags.dependsOn, s.flags.isDependedOn << 6 | s.flags.hasRedundancy << 4 | s.flags.paddingValue << 1 | s.flags.isNonSyncSample, 61440 & s.flags.degradationPriority, 15 & s.flags.degradationPriority, (4278190080 & s.compositionTimeOffset) >>> 24, (16711680 & s.compositionTimeOffset) >>> 16, (65280 & s.compositionTimeOffset) >>> 8, 255 & s.compositionTimeOffset]);
                return n(O.trun, new Uint8Array(r))
            },
            e = function(e, t) {
                var r, a, s, o;
                for (a = e.samples || [], t += 20 + 8 * a.length, r = i(a, t), o = 0; o < a.length; o++) s = a[o],
                r = r.concat([(4278190080 & s.duration) >>> 24, (16711680 & s.duration) >>> 16, (65280 & s.duration) >>> 8, 255 & s.duration, (4278190080 & s.size) >>> 24, (16711680 & s.size) >>> 16, (65280 & s.size) >>> 8, 255 & s.size]);
                return n(O.trun, new Uint8Array(r))
            },
            k = function(i, n) {
                return "audio" === i.type ? e(i, n) : t(i, n)
            }
        } (),
        t.exports = {
            ftyp: s,
            mdat: o,
            moof: l,
            moov: f,
            initSegment: function(e) {
                var t, i = s(),
                n = f(e);
                return t = new Uint8Array(i.byteLength + n.byteLength),
                t.set(i),
                t.set(n, i.byteLength),
                t
            }
        }
    },
    {}],
    85 : [function(e, t, i) {
        "use strict";
        var n, r, a, s;
        n = function(e, t) {
            var i, a, s, o, u, d = [];
            if (!t.length) return null;
            for (i = 0; i < e.byteLength;) a = e[i] << 24,
            a |= e[i + 1] << 16,
            a |= e[i + 2] << 8,
            a |= e[i + 3],
            s = r(e.subarray(i + 4, i + 8)),
            o = a > 1 ? i + a: e.byteLength,
            s === t[0] && (1 === t.length ? d.push(e.subarray(i + 8, o)) : (u = n(e.subarray(i + 8, o), t.slice(1)), u.length && (d = d.concat(u)))),
            i = o;
            return d
        },
        r = function(e) {
            var t = "";
            return t += String.fromCharCode(e[0]),
            t += String.fromCharCode(e[1]),
            t += String.fromCharCode(e[2]),
            t += String.fromCharCode(e[3])
        },
        a = function(e) {
            var t = {},
            i = n(e, ["moov", "trak"]);
            return i.reduce(function(e, t) {
                var i, r, a, s, o;
                return (i = n(t, ["tkhd"])[0]) ? (r = i[0], a = 0 === r ? 12 : 20, s = i[a] << 24 | i[a + 1] << 16 | i[a + 2] << 8 | i[a + 3], (o = n(t, ["mdia", "mdhd"])[0]) ? (r = o[0], a = 0 === r ? 12 : 20, e[s] = o[a] << 24 | o[a + 1] << 16 | o[a + 2] << 8 | o[a + 3], e) : null) : null
            },
            t)
        },
        s = function(e, t) {
            var i, r, a;
            return i = n(t, ["moof", "traf"]),
            r = [].concat.apply([], i.map(function(t) {
                return n(t, ["tfhd"]).map(function(i) {
                    var r, a, s;
                    return r = i[4] << 24 | i[5] << 16 | i[6] << 8 | i[7],
                    a = e[r] || 9e4,
                    s = n(t, ["tfdt"]).map(function(e) {
                        var t, i;
                        return t = e[0],
                        i = e[4] << 24 | e[5] << 16 | e[6] << 8 | e[7],
                        1 === t && (i *= Math.pow(2, 32), i += e[8] << 24 | e[9] << 16 | e[10] << 8 | e[11]),
                        i
                    })[0],
                    s = s || 1 / 0,
                    s / a
                })
            })),
            a = Math.min.apply(null, r),
            isFinite(a) ? a: 0
        },
        t.exports = {
            parseType: r,
            timescale: a,
            startTime: s
        }
    },
    {}],
    86 : [function(e, t, i) {
        "use strict";
        var n, r, a, s, o, u, d, l, f, c, h, p = e(89),
        m = e(84),
        y = e(78),
        g = e(71),
        v = e(72).H264Stream,
        _ = e(69),
        b = ["audioobjecttype", "channelcount", "samplerate", "samplingfrequencyindex", "samplesize"],
        T = ["width", "height", "profileIdc", "levelIdc", "profileCompatibility"];
        o = function() {
            return {
                size: 0,
                flags: {
                    isLeading: 0,
                    dependsOn: 1,
                    isDependedOn: 0,
                    hasRedundancy: 0,
                    degradationPriority: 0
                }
            }
        },
        u = function(e) {
            return e[0] === "I".charCodeAt(0) && e[1] === "D".charCodeAt(0) && e[2] === "3".charCodeAt(0)
        },
        c = function(e, t) {
            var i;
            if (e.length !== t.length) return ! 1;
            for (i = 0; i < e.length; i++) if (e[i] !== t[i]) return ! 1;
            return ! 0
        },
        h = function(e) {
            var t, i, n = 0;
            for (t = 0; t < e.length; t++) i = e[t],
            n += i.data.byteLength;
            return n
        },
        r = function(e) {
            var t = [],
            i = 0,
            n = 0;
            r.prototype.init.call(this),
            this.push = function(i) {
                d(e, i),
                e && b.forEach(function(t) {
                    e[t] = i[t]
                }),
                t.push(i)
            },
            this.setEarliestDts = function(t) {
                n = t - e.timelineStartInfo.baseMediaDecodeTime
            },
            this.flush = function() {
                var n, r, a, s;
                return 0 === t.length ? void this.trigger("done", "AudioSegmentStream") : (n = this.trimAdtsFramesByEarliestDts_(t), e.samples = this.generateSampleTable_(n), a = m.mdat(this.concatenateFrameData_(n)), t = [], f(e), r = m.moof(i, [e]), s = new Uint8Array(r.byteLength + a.byteLength), i++, s.set(r), s.set(a, r.byteLength), l(e), this.trigger("data", {
                    track: e,
                    boxes: s
                }), void this.trigger("done", "AudioSegmentStream"))
            },
            this.trimAdtsFramesByEarliestDts_ = function(t) {
                return e.minSegmentDts >= n ? t: (e.minSegmentDts = 1 / 0, t.filter(function(t) {
                    return t.dts >= n && (e.minSegmentDts = Math.min(e.minSegmentDts, t.dts), e.minSegmentPts = e.minSegmentDts, !0)
                }))
            },
            this.generateSampleTable_ = function(e) {
                var t, i, n = [];
                for (t = 0; t < e.length; t++) i = e[t],
                n.push({
                    size: i.data.byteLength,
                    duration: 1024
                });
                return n
            },
            this.concatenateFrameData_ = function(e) {
                var t, i, n = 0,
                r = new Uint8Array(h(e));
                for (t = 0; t < e.length; t++) i = e[t],
                r.set(i.data, n),
                n += i.data.byteLength;
                return r
            }
        },
        r.prototype = new p,
        n = function(e) {
            var t, i, r = 0,
            a = [];
            n.prototype.init.call(this),
            delete e.minPTS,
            this.gopCache_ = [],
            this.push = function(n) {
                d(e, n),
                "seq_parameter_set_rbsp" !== n.nalUnitType || t || (t = n.config, e.sps = [n.data], T.forEach(function(i) {
                    e[i] = t[i]
                },
                this)),
                "pic_parameter_set_rbsp" !== n.nalUnitType || i || (i = n.data, e.pps = [n.data]),
                a.push(n)
            },
            this.flush = function() {
                for (var t, i, n, s, o, u; a.length && "access_unit_delimiter_rbsp" !== a[0].nalUnitType;) a.shift();
                return 0 === a.length ? (this.resetStream_(), void this.trigger("done", "VideoSegmentStream")) : (t = this.groupNalsIntoFrames_(a), n = this.groupFramesIntoGops_(t), n[0][0].keyFrame || (i = this.getGopForFusion_(a[0], e), i ? (n.unshift(i), n.byteLength += i.byteLength, n.nalCount += i.nalCount, n.pts = i.pts, n.dts = i.dts, n.duration += i.duration) : n = this.extendFirstKeyFrame_(n)), d(e, n), e.samples = this.generateSampleTable_(n), o = m.mdat(this.concatenateNalData_(n)), this.gopCache_.unshift({
                    gop: n.pop(),
                    pps: e.pps,
                    sps: e.sps
                }), this.gopCache_.length = Math.min(6, this.gopCache_.length), a = [], f(e), this.trigger("timelineStartInfo", e.timelineStartInfo), s = m.moof(r, [e]), u = new Uint8Array(s.byteLength + o.byteLength), r++, u.set(s), u.set(o, s.byteLength), this.trigger("data", {
                    track: e,
                    boxes: u
                }), this.resetStream_(), void this.trigger("done", "VideoSegmentStream"))
            },
            this.resetStream_ = function() {
                l(e),
                t = void 0,
                i = void 0
            },
            this.getGopForFusion_ = function(t) {
                var i, n, r, a, s, o = 45e3,
                u = 1e4,
                d = 1 / 0;
                for (s = 0; s < this.gopCache_.length; s++) a = this.gopCache_[s],
                r = a.gop,
                e.pps && c(e.pps[0], a.pps[0]) && e.sps && c(e.sps[0], a.sps[0]) && (r.dts < e.timelineStartInfo.dts || (i = t.dts - r.dts - r.duration, i >= -u && i <= o && (!n || d > i) && (n = a, d = i)));
                return n ? n.gop: null
            },
            this.extendFirstKeyFrame_ = function(e) {
                var t;
                return e[0][0].keyFrame || (t = e.shift(), e.byteLength -= t.byteLength, e.nalCount -= t.nalCount, e[0][0].dts = t.dts, e[0][0].pts = t.pts, e[0][0].duration += t.duration),
                e
            },
            this.groupNalsIntoFrames_ = function(e) {
                var t, i, n = [],
                r = [];
                for (n.byteLength = 0, t = 0; t < e.length; t++) i = e[t],
                "access_unit_delimiter_rbsp" === i.nalUnitType ? (n.length && (n.duration = i.dts - n.dts, r.push(n)), n = [i], n.byteLength = i.data.byteLength, n.pts = i.pts, n.dts = i.dts) : ("slice_layer_without_partitioning_rbsp_idr" === i.nalUnitType && (n.keyFrame = !0), n.duration = i.dts - n.dts, n.byteLength += i.data.byteLength, n.push(i));
                return r.length && (!n.duration || n.duration <= 0) && (n.duration = r[r.length - 1].duration),
                r.push(n),
                r
            },
            this.groupFramesIntoGops_ = function(e) {
                var t, i, n = [],
                r = [];
                for (n.byteLength = 0, n.nalCount = 0, n.duration = 0, n.pts = e[0].pts, n.dts = e[0].dts, r.byteLength = 0, r.nalCount = 0, r.duration = 0, r.pts = e[0].pts, r.dts = e[0].dts, t = 0; t < e.length; t++) i = e[t],
                i.keyFrame ? (n.length && (r.push(n), r.byteLength += n.byteLength, r.nalCount += n.nalCount, r.duration += n.duration), n = [i], n.nalCount = i.length, n.byteLength = i.byteLength, n.pts = i.pts, n.dts = i.dts, n.duration = i.duration) : (n.duration += i.duration, n.nalCount += i.length, n.byteLength += i.byteLength, n.push(i));
                return r.length && n.duration <= 0 && (n.duration = r[r.length - 1].duration),
                r.byteLength += n.byteLength,
                r.nalCount += n.nalCount,
                r.duration += n.duration,
                r.push(n),
                r
            },
            this.generateSampleTable_ = function(e, t) {
                var i, n, r, a, s, u = t || 0,
                d = [];
                for (i = 0; i < e.length; i++) for (a = e[i], n = 0; n < a.length; n++) s = a[n],
                r = o(),
                r.dataOffset = u,
                r.compositionTimeOffset = s.pts - s.dts,
                r.duration = s.duration,
                r.size = 4 * s.length,
                r.size += s.byteLength,
                s.keyFrame && (r.flags.dependsOn = 2),
                u += r.size,
                d.push(r);
                return d
            },
            this.concatenateNalData_ = function(e) {
                var t, i, n, r, a, s, o = 0,
                u = e.byteLength,
                d = e.nalCount,
                l = u + 4 * d,
                f = new Uint8Array(l),
                c = new DataView(f.buffer);
                for (t = 0; t < e.length; t++) for (r = e[t], i = 0; i < r.length; i++) for (a = r[i], n = 0; n < a.length; n++) s = a[n],
                c.setUint32(o, s.data.byteLength),
                o += 4,
                f.set(s.data, o),
                o += s.data.byteLength;
                return f
            }
        },
        n.prototype = new p,
        d = function(e, t) {
            "number" == typeof t.pts && (void 0 === e.timelineStartInfo.pts && (e.timelineStartInfo.pts = t.pts), void 0 === e.minSegmentPts ? e.minSegmentPts = t.pts: e.minSegmentPts = Math.min(e.minSegmentPts, t.pts), void 0 === e.maxSegmentPts ? e.maxSegmentPts = t.pts: e.maxSegmentPts = Math.max(e.maxSegmentPts, t.pts)),
            "number" == typeof t.dts && (void 0 === e.timelineStartInfo.dts && (e.timelineStartInfo.dts = t.dts), void 0 === e.minSegmentDts ? e.minSegmentDts = t.dts: e.minSegmentDts = Math.min(e.minSegmentDts, t.dts), void 0 === e.maxSegmentDts ? e.maxSegmentDts = t.dts: e.maxSegmentDts = Math.max(e.maxSegmentDts, t.dts))
        },
        l = function(e) {
            delete e.minSegmentDts,
            delete e.maxSegmentDts,
            delete e.minSegmentPts,
            delete e.maxSegmentPts
        },
        f = function(e) {
            var t, i = 9e4,
            n = e.minSegmentDts - e.timelineStartInfo.dts;
            e.baseMediaDecodeTime = e.timelineStartInfo.baseMediaDecodeTime,
            e.baseMediaDecodeTime += n,
            e.baseMediaDecodeTime = Math.max(0, e.baseMediaDecodeTime),
            "audio" === e.type && (t = e.samplerate / i, e.baseMediaDecodeTime *= t, e.baseMediaDecodeTime = Math.floor(e.baseMediaDecodeTime))
        },
        s = function(e, t) {
            this.numberOfTracks = 0,
            this.metadataStream = t,
            "undefined" != typeof e.remux ? this.remuxTracks = !!e.remux: this.remuxTracks = !0,
            this.pendingTracks = [],
            this.videoTrack = null,
            this.pendingBoxes = [],
            this.pendingCaptions = [],
            this.pendingMetadata = [],
            this.pendingBytes = 0,
            this.emittedTracks = 0,
            s.prototype.init.call(this),
            this.push = function(e) {
                return e.text ? this.pendingCaptions.push(e) : e.frames ? this.pendingMetadata.push(e) : (this.pendingTracks.push(e.track), this.pendingBoxes.push(e.boxes), this.pendingBytes += e.boxes.byteLength, "video" === e.track.type && (this.videoTrack = e.track), void("audio" === e.track.type && (this.audioTrack = e.track)))
            }
        },
        s.prototype = new p,
        s.prototype.flush = function(e) {
            var t, i, n, r, a = 0,
            s = {
                captions: [],
                metadata: [],
                info: {}
            },
            o = 0;
            if (this.pendingTracks.length < this.numberOfTracks) {
                if ("VideoSegmentStream" !== e && "AudioSegmentStream" !== e) return;
                if (this.remuxTracks) return;
                if (0 === this.pendingTracks.length) return this.emittedTracks++,
                void(this.emittedTracks >= this.numberOfTracks && (this.trigger("done"), this.emittedTracks = 0))
            }
            for (this.videoTrack ? (o = this.videoTrack.timelineStartInfo.pts, T.forEach(function(e) {
                s.info[e] = this.videoTrack[e]
            },
            this)) : this.audioTrack && (o = this.audioTrack.timelineStartInfo.pts, b.forEach(function(e) {
                s.info[e] = this.audioTrack[e]
            },
            this)), 1 === this.pendingTracks.length ? s.type = this.pendingTracks[0].type: s.type = "combined", this.emittedTracks += this.pendingTracks.length, n = m.initSegment(this.pendingTracks), s.initSegment = new Uint8Array(n.byteLength), s.initSegment.set(n), s.data = new Uint8Array(this.pendingBytes), r = 0; r < this.pendingBoxes.length; r++) s.data.set(this.pendingBoxes[r], a),
            a += this.pendingBoxes[r].byteLength;
            for (r = 0; r < this.pendingCaptions.length; r++) t = this.pendingCaptions[r],
            t.startTime = t.startPts - o,
            t.startTime /= 9e4,
            t.endTime = t.endPts - o,
            t.endTime /= 9e4,
            s.captions.push(t);
            for (r = 0; r < this.pendingMetadata.length; r++) i = this.pendingMetadata[r],
            i.cueTime = i.pts - o,
            i.cueTime /= 9e4,
            s.metadata.push(i);
            s.metadata.dispatchType = this.metadataStream.dispatchType,
            this.pendingTracks.length = 0,
            this.videoTrack = null,
            this.pendingBoxes.length = 0,
            this.pendingCaptions.length = 0,
            this.pendingBytes = 0,
            this.pendingMetadata.length = 0,
            this.trigger("data", s),
            this.emittedTracks >= this.numberOfTracks && (this.trigger("done"), this.emittedTracks = 0)
        },
        a = function(e) {
            var t, i, o = this,
            d = !0;
            a.prototype.init.call(this),
            e = e || {},
            this.baseMediaDecodeTime = e.baseMediaDecodeTime || 0,
            this.transmuxPipeline_ = {},
            this.setupAacPipeline = function() {
                var t = {};
                this.transmuxPipeline_ = t,
                t.type = "aac",
                t.metadataStream = new y.MetadataStream,
                t.aacStream = new _,
                t.audioTimestampRolloverStream = new y.TimestampRolloverStream("audio"),
                t.timedMetadataTimestampRolloverStream = new y.TimestampRolloverStream("timed-metadata"),
                t.adtsStream = new g,
                t.coalesceStream = new s(e, t.metadataStream),
                t.headOfPipeline = t.aacStream,
                t.aacStream.pipe(t.audioTimestampRolloverStream).pipe(t.adtsStream),
                t.aacStream.pipe(t.timedMetadataTimestampRolloverStream).pipe(t.metadataStream).pipe(t.coalesceStream),
                t.metadataStream.on("timestamp",
                function(e) {
                    t.aacStream.setTimestamp(e.timeStamp)
                }),
                t.aacStream.on("data",
                function(e) {
                    "timed-metadata" !== e.type || t.audioSegmentStream || (i = i || {
                        timelineStartInfo: {
                            baseMediaDecodeTime: o.baseMediaDecodeTime
                        },
                        codec: "adts",
                        type: "audio"
                    },
                    t.coalesceStream.numberOfTracks++, t.audioSegmentStream = new r(i), t.adtsStream.pipe(t.audioSegmentStream).pipe(t.coalesceStream))
                }),
                t.coalesceStream.on("data", this.trigger.bind(this, "data")),
                t.coalesceStream.on("done", this.trigger.bind(this, "done"))
            },
            this.setupTsPipeline = function() {
                var a = {};
                this.transmuxPipeline_ = a,
                a.type = "ts",
                a.metadataStream = new y.MetadataStream,
                a.packetStream = new y.TransportPacketStream,
                a.parseStream = new y.TransportParseStream,
                a.elementaryStream = new y.ElementaryStream,
                a.videoTimestampRolloverStream = new y.TimestampRolloverStream("video"),
                a.audioTimestampRolloverStream = new y.TimestampRolloverStream("audio"),
                a.timedMetadataTimestampRolloverStream = new y.TimestampRolloverStream("timed-metadata"),
                a.adtsStream = new g,
                a.h264Stream = new v,
                a.captionStream = new y.CaptionStream,
                a.coalesceStream = new s(e, a.metadataStream),
                a.headOfPipeline = a.packetStream,
                a.packetStream.pipe(a.parseStream).pipe(a.elementaryStream),
                a.elementaryStream.pipe(a.videoTimestampRolloverStream).pipe(a.h264Stream),
                a.elementaryStream.pipe(a.audioTimestampRolloverStream).pipe(a.adtsStream),
                a.elementaryStream.pipe(a.timedMetadataTimestampRolloverStream).pipe(a.metadataStream).pipe(a.coalesceStream),
                a.h264Stream.pipe(a.captionStream).pipe(a.coalesceStream),
                a.elementaryStream.on("data",
                function(e) {
                    var s;
                    if ("metadata" === e.type) {
                        for (s = e.tracks.length; s--;) t || "video" !== e.tracks[s].type ? i || "audio" !== e.tracks[s].type || (i = e.tracks[s], i.timelineStartInfo.baseMediaDecodeTime = o.baseMediaDecodeTime) : (t = e.tracks[s], t.timelineStartInfo.baseMediaDecodeTime = o.baseMediaDecodeTime);
                        t && !a.videoSegmentStream && (a.coalesceStream.numberOfTracks++, a.videoSegmentStream = new n(t), a.videoSegmentStream.on("timelineStartInfo",
                        function(e) {
                            i && (i.timelineStartInfo = e, a.audioSegmentStream.setEarliestDts(e.dts))
                        }), a.h264Stream.pipe(a.videoSegmentStream).pipe(a.coalesceStream)),
                        i && !a.audioSegmentStream && (a.coalesceStream.numberOfTracks++, a.audioSegmentStream = new r(i), a.adtsStream.pipe(a.audioSegmentStream).pipe(a.coalesceStream))
                    }
                }),
                a.coalesceStream.on("data", this.trigger.bind(this, "data")),
                a.coalesceStream.on("done", this.trigger.bind(this, "done"))
            },
            this.setBaseMediaDecodeTime = function(e) {
                var n = this.transmuxPipeline_;
                this.baseMediaDecodeTime = e,
                i && (i.timelineStartInfo.dts = void 0, i.timelineStartInfo.pts = void 0, l(i), i.timelineStartInfo.baseMediaDecodeTime = e),
                t && (n.videoSegmentStream && (n.videoSegmentStream.gopCache_ = []), t.timelineStartInfo.dts = void 0, t.timelineStartInfo.pts = void 0, l(t), t.timelineStartInfo.baseMediaDecodeTime = e)
            },
            this.push = function(e) {
                if (d) {
                    var t = u(e);
                    t && "aac" !== this.transmuxPipeline_.type ? this.setupAacPipeline() : t || "ts" === this.transmuxPipeline_.type || this.setupTsPipeline(),
                    d = !1
                }
                this.transmuxPipeline_.headOfPipeline.push(e)
            },
            this.flush = function() {
                d = !0,
                this.transmuxPipeline_.headOfPipeline.flush()
            }
        },
        a.prototype = new p,
        t.exports = {
            Transmuxer: a,
            VideoSegmentStream: n,
            AudioSegmentStream: r,
            AUDIO_PROPERTIES: b,
            VIDEO_PROPERTIES: T
        }
    },
    {}],
    87 : [function(e, t, i) {
        "use strict";
        var n = e(81),
        r = e(82).handleRollover,
        a = {};
        a.ts = e(80),
        a.aac = e(70);
        var s = 9e4,
        o = 188,
        u = 71,
        d = function(e) {
            return e[0] === "I".charCodeAt(0) && e[1] === "D".charCodeAt(0) && e[2] === "3".charCodeAt(0)
        },
        l = function(e, t) {
            for (var i, n, r = 0,
            s = o; s < e.byteLength;) if (e[r] !== u || e[s] !== u) r++,
            s++;
            else {
                switch (i = e.subarray(r, s), n = a.ts.parseType(i, t.pid)) {
                case "pat":
                    t.pid || (t.pid = a.ts.parsePat(i));
                    break;
                case "pmt":
                    t.table || (t.table = a.ts.parsePmt(i))
                }
                if (t.pid && t.table) return;
                r += o,
                s += o
            }
        },
        f = function(e, t, i) {
            for (var n, r, s, d, l, f = 0,
            c = o,
            h = !1; c < e.byteLength;) if (e[f] !== u || e[c] !== u) f++,
            c++;
            else {
                switch (n = e.subarray(f, c), r = a.ts.parseType(n, t.pid)) {
                case "pes":
                    s = a.ts.parsePesType(n, t.table),
                    d = a.ts.parsePayloadUnitStartIndicator(n),
                    "audio" === s && d && (l = a.ts.parsePesTime(n), l.type = "audio", i.audio.push(l), h = !0)
                }
                if (h) break;
                f += o,
                c += o
            }
            for (c = e.byteLength, f = c - o, h = !1; f >= 0;) if (e[f] !== u || e[c] !== u) f--,
            c--;
            else {
                switch (n = e.subarray(f, c), r = a.ts.parseType(n, t.pid)) {
                case "pes":
                    s = a.ts.parsePesType(n, t.table),
                    d = a.ts.parsePayloadUnitStartIndicator(n),
                    "audio" === s && d && (l = a.ts.parsePesTime(n), l.type = "audio", i.audio.push(l), h = !0)
                }
                if (h) break;
                f -= o,
                c -= o
            }
        },
        c = function(e, t, i) {
            for (var n, r, s, d, l, f, c, h, p = 0,
            m = o,
            y = !1,
            g = {
                data: [],
                size: 0
            }; m < e.byteLength;) if (e[p] !== u || e[m] !== u) p++,
            m++;
            else {
                switch (n = e.subarray(p, m), r = a.ts.parseType(n, t.pid)) {
                case "pes":
                    if (s = a.ts.parsePesType(n, t.table), d = a.ts.parsePayloadUnitStartIndicator(n), "video" === s && (d && !y && (l = a.ts.parsePesTime(n), l.type = "video", i.video.push(l), y = !0), !i.firstKeyFrame)) {
                        if (d && 0 !== g.size) {
                            for (f = new Uint8Array(g.size), c = 0; g.data.length;) h = g.data.shift(),
                            f.set(h, c),
                            c += h.byteLength;
                            a.ts.videoPacketContainsKeyFrame(f) && (i.firstKeyFrame = a.ts.parsePesTime(f), i.firstKeyFrame.type = "video"),
                            g.size = 0
                        }
                        g.data.push(n),
                        g.size += n.byteLength
                    }
                }
                if (y && i.firstKeyFrame) break;
                p += o,
                m += o
            }
            for (m = e.byteLength, p = m - o, y = !1; p >= 0;) if (e[p] !== u || e[m] !== u) p--,
            m--;
            else {
                switch (n = e.subarray(p, m), r = a.ts.parseType(n, t.pid)) {
                case "pes":
                    s = a.ts.parsePesType(n, t.table),
                    d = a.ts.parsePayloadUnitStartIndicator(n),
                    "video" === s && d && (l = a.ts.parsePesTime(n), l.type = "video", i.video.push(l), y = !0)
                }
                if (y) break;
                p -= o,
                m -= o
            }
        },
        h = function(e, t) {
            if (e.audio && e.audio.length) {
                var i = t;
                "undefined" == typeof i && (i = e.audio[0].dts),
                e.audio.forEach(function(e) {
                    e.dts = r(e.dts, i),
                    e.pts = r(e.pts, i),
                    e.dtsTime = e.dts / s,
                    e.ptsTime = e.pts / s
                })
            }
            if (e.video && e.video.length) {
                var n = t;
                if ("undefined" == typeof n && (n = e.video[0].dts), e.video.forEach(function(e) {
                    e.dts = r(e.dts, n),
                    e.pts = r(e.pts, n),
                    e.dtsTime = e.dts / s,
                    e.ptsTime = e.pts / s
                }), e.firstKeyFrame) {
                    var a = e.firstKeyFrame;
                    a.dts = r(a.dts, n),
                    a.pts = r(a.pts, n),
                    a.dtsTime = a.dts / s,
                    a.ptsTime = a.dts / s
                }
            }
        },
        p = function(e) {
            for (var t, i = !1,
            n = 0,
            r = null,
            o = null,
            u = 0,
            d = 0; e.length - d >= 3;) {
                var l = a.aac.parseType(e, d);
                switch (l) {
                case "timed-metadata":
                    if (e.length - d < 10) {
                        i = !0;
                        break
                    }
                    if (u = a.aac.parseId3TagSize(e, d), u > e.length) {
                        i = !0;
                        break
                    }
                    null === o && (t = e.subarray(d, d + u), o = a.aac.parseAacTimestamp(t)),
                    d += u;
                    break;
                case "audio":
                    if (e.length - d < 7) {
                        i = !0;
                        break
                    }
                    if (u = a.aac.parseAdtsSize(e, d), u > e.length) {
                        i = !0;
                        break
                    }
                    null === r && (t = e.subarray(d, d + u), r = a.aac.parseSampleRate(t)),
                    n++,
                    d += u;
                    break;
                default:
                    d++
                }
                if (i) return null
            }
            if (null === r || null === o) return null;
            var f = s / r,
            c = {
                audio: [{
                    type: "audio",
                    dts: o,
                    pts: o
                },
                {
                    type: "audio",
                    dts: o + 1024 * n * f,
                    pts: o + 1024 * n * f
                }]
            };
            return c
        },
        m = function(e) {
            var t = {
                pid: null,
                table: null
            },
            i = {};
            l(e, t);
            for (var r in t.table) if (t.table.hasOwnProperty(r)) {
                var a = t.table[r];
                switch (a) {
                case n.H264_STREAM_TYPE:
                    i.video = [],
                    c(e, t, i),
                    0 === i.video.length && delete i.video;
                    break;
                case n.ADTS_STREAM_TYPE:
                    i.audio = [],
                    f(e, t, i),
                    0 === i.audio.length && delete i.audio
                }
            }
            return i
        },
        y = function(e, t) {
            var i, n = d(e);
            return i = n ? p(e) : m(e),
            i && (i.audio || i.video) ? (h(i, t), i) : null
        };
        t.exports = {
            inspect: y
        }
    },
    {}],
    88 : [function(e, t, i) {
        "use strict";
        var n;
        n = function(e) {
            var t = e.byteLength,
            i = 0,
            n = 0;
            this.length = function() {
                return 8 * t
            },
            this.bitsAvailable = function() {
                return 8 * t + n
            },
            this.loadWord = function() {
                var r = e.byteLength - t,
                a = new Uint8Array(4),
                s = Math.min(4, t);
                if (0 === s) throw new Error("no bytes available");
                a.set(e.subarray(r, r + s)),
                i = new DataView(a.buffer).getUint32(0),
                n = 8 * s,
                t -= s
            },
            this.skipBits = function(e) {
                var r;
                n > e ? (i <<= e, n -= e) : (e -= n, r = Math.floor(e / 8), e -= 8 * r, t -= r, this.loadWord(), i <<= e, n -= e)
            },
            this.readBits = function(e) {
                var r = Math.min(n, e),
                a = i >>> 32 - r;
                return n -= r,
                n > 0 ? i <<= r: t > 0 && this.loadWord(),
                r = e - r,
                r > 0 ? a << r | this.readBits(r) : a
            },
            this.skipLeadingZeros = function() {
                var e;
                for (e = 0; e < n; ++e) if (0 !== (i & 2147483648 >>> e)) return i <<= e,
                n -= e,
                e;
                return this.loadWord(),
                e + this.skipLeadingZeros()
            },
            this.skipUnsignedExpGolomb = function() {
                this.skipBits(1 + this.skipLeadingZeros())
            },
            this.skipExpGolomb = function() {
                this.skipBits(1 + this.skipLeadingZeros())
            },
            this.readUnsignedExpGolomb = function() {
                var e = this.skipLeadingZeros();
                return this.readBits(e + 1) - 1
            },
            this.readExpGolomb = function() {
                var e = this.readUnsignedExpGolomb();
                return 1 & e ? 1 + e >>> 1 : -1 * (e >>> 1)
            },
            this.readBoolean = function() {
                return 1 === this.readBits(1)
            },
            this.readUnsignedByte = function() {
                return this.readBits(8)
            },
            this.loadWord()
        },
        t.exports = n
    },
    {}],
    89 : [function(e, t, i) {
        "use strict";
        var n = function() {
            this.init = function() {
                var e = {};
                this.on = function(t, i) {
                    e[t] || (e[t] = []),
                    e[t] = e[t].concat(i)
                },
                this.off = function(t, i) {
                    var n;
                    return !! e[t] && (n = e[t].indexOf(i), e[t] = e[t].slice(), e[t].splice(n, 1), n > -1)
                },
                this.trigger = function(t) {
                    var i, n, r, a;
                    if (i = e[t]) if (2 === arguments.length) for (r = i.length, n = 0; n < r; ++n) i[n].call(this, arguments[1]);
                    else {
                        for (a = [], n = arguments.length, n = 1; n < arguments.length; ++n) a.push(arguments[n]);
                        for (r = i.length, n = 0; n < r; ++n) i[n].apply(this, a)
                    }
                },
                this.dispose = function() {
                    e = {}
                }
            }
        };
        n.prototype.pipe = function(e) {
            return this.on("data",
            function(t) {
                e.push(t)
            }),
            this.on("done",
            function(t) {
                e.flush(t)
            }),
            e
        },
        n.prototype.push = function(e) {
            this.trigger("data", e)
        },
        n.prototype.flush = function(e) {
            this.trigger("done", e)
        },
        t.exports = n
    },
    {}],
    90 : [function(e, t, i) { !
        function(e) {
            var n = {
                buildAbsoluteURL: function(e, t) {
                    if (t = t.trim(), /^[a-z]+:/i.test(t)) return t;
                    var i = null,
                    r = null,
                    a = /^([^#]*)(.*)$/.exec(t);
                    a && (r = a[2], t = a[1]);
                    var s = /^([^\?]*)(.*)$/.exec(t);
                    s && (i = s[2], t = s[1]);
                    var o = /^([^#]*)(.*)$/.exec(e);
                    o && (e = o[1]);
                    var u = /^([^\?]*)(.*)$/.exec(e);
                    u && (e = u[1]);
                    var d = /^(([a-z]+:)?\/\/[a-z0-9\.\-_~]+(:[0-9]+)?)?(\/.*)$/i.exec(e);
                    if (!d) throw new Error("Error trying to parse base URL.");
                    var l = d[2] || "",
                    f = d[1] || "",
                    c = d[4],
                    h = null;
                    return h = /^\/\//.test(t) ? l + "//" + n.buildAbsolutePath("", t.substring(2)) : /^\//.test(t) ? f + "/" + n.buildAbsolutePath("", t.substring(1)) : n.buildAbsolutePath(f + c, t),
                    i && (h += i),
                    r && (h += r),
                    h
                },
                buildAbsolutePath: function(e, t) {
                    for (var i, n, r = t,
                    a = "",
                    s = e.replace(/[^\/]*$/, r.replace(/(\/|^)(?:\.?\/+)+/g, "$1")), o = 0; n = s.indexOf("/../", o), n > -1; o = n + i) i = /^\/(?:\.\.\/)*/.exec(s.slice(n))[0].length,
                    a = (a + s.substring(o, n)).replace(new RegExp("(?:\\/+[^\\/]*){0," + (i - 1) / 3 + "}$"), "/");
                    return a + s.substr(o)
                }
            };
            "object" == typeof i && "object" == typeof t ? t.exports = n: "function" == typeof define && define.amd ? define([],
            function() {
                return n
            }) : "object" == typeof i ? i.URLToolkit = n: e.URLToolkit = n
        } (this)
    },
    {}],
    91 : [function(e, t, i) { (function(n) {
            "use strict";
            function r(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var a = e(27),
            s = r(a),
            o = "undefined" != typeof window ? window.videojs: "undefined" != typeof n ? n.videojs: null,
            u = r(o),
            d = function(e) {
                Object.defineProperties(e.frame, {
                    id: {
                        get: function() {
                            return u.
                        default.log.warn("cue.frame.id is deprecated. Use cue.value.key instead."),
                            e.value.key
                        }
                    },
                    value: {
                        get: function() {
                            return u.
                        default.log.warn("cue.frame.value is deprecated. Use cue.value.data instead."),
                            e.value.data
                        }
                    },
                    privateData: {
                        get: function() {
                            return u.
                        default.log.warn("cue.frame.privateData is deprecated. Use cue.value.data instead."),
                            e.value.data
                        }
                    }
                })
            },
            l = function(e) {
                var t = void 0;
                return t = isNaN(e) || Math.abs(e) === 1 / 0 ? Number.MAX_VALUE: e
            },
            f = function(e, t, i) {
                var n = s.
            default.WebKitDataCue || s.
            default.VTTCue;
                if (t && t.forEach(function(e) {
                    this.inbandTextTrack_.addCue(new n(e.startTime + this.timestampOffset, e.endTime + this.timestampOffset, e.text))
                },
                e), i) {
                    var r = l(e.mediaSource_.duration);
                    if (i.forEach(function(e) {
                        var t = e.cueTime + this.timestampOffset;
                        e.frames.forEach(function(e) {
                            var i = new n(t, t, e.value || e.url || e.data || "");
                            i.frame = e,
                            i.value = e,
                            d(i),
                            this.metadataTrack_.addCue(i)
                        },
                        this)
                    },
                    e), e.metadataTrack_ && e.metadataTrack_.cues && e.metadataTrack_.cues.length) {
                        for (var a = e.metadataTrack_.cues,
                        o = [], u = 0; u < a.length; u++) o.push(a[u]);
                        o.sort(function(e, t) {
                            return e.startTime - t.startTime
                        });
                        for (var f = 0; f < o.length - 1; f++) o[f].endTime !== o[f + 1].startTime && (o[f].endTime = o[f + 1].startTime);
                        o[o.length - 1].endTime = r
                    }
                }
            };
            i.
        default = {
                addTextTrackData: f,
                durationOfVideo: l
            },
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    92 : [function(e, t, i) {
        "use strict";
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var n = function(e, t, i) {
            for (var n = e.remoteTextTracks() || [], r = 0; r < n.length; r++) {
                var a = n[r];
                a.kind === t && a.label === i && e.removeRemoteTextTrack(a)
            }
        };
        i.removeExistingTrack = n;
        var r = function(e) {
            n(e, "captions", "cc1"),
            n(e, "metadata", "Timed Metadata")
        };
        i.cleanupTextTracks = r
    },
    {}],
    93 : [function(e, t, i) {
        "use strict";
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var n = function(e) {
            return /mp4a\.\d+.\d+/i.test(e)
        },
        r = function(e) {
            return /avc1\.[\da-f]+/i.test(e)
        },
        a = function(e) {
            var t = {
                type: "",
                parameters: {}
            },
            i = e.trim().split(";");
            return t.type = i.shift().trim(),
            i.forEach(function(e) {
                var i = e.trim().split("=");
                if (i.length > 1) {
                    var n = i[0].replace(/"/g, "").trim(),
                    r = i[1].replace(/"/g, "").trim();
                    t.parameters[n] = r
                }
            }),
            t
        };
        i.
    default = {
            isAudioCodec: n,
            parseContentType: a,
            isVideoCodec: r
        },
        t.exports = i.
    default
    },
    {}],
    94 : [function(e, t, i) {
        "use strict";
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var n = e(92),
        r = function(e, t, i) {
            var r = t.player_;
            i.captions && i.captions.length && !e.inbandTextTrack_ && ((0, n.removeExistingTrack)(r, "captions", "cc1"), e.inbandTextTrack_ = r.addRemoteTextTrack({
                kind: "captions",
                label: "cc1"
            },
            !1).track),
            i.metadata && i.metadata.length && !e.metadataTrack_ && ((0, n.removeExistingTrack)(r, "metadata", "Timed Metadata", !0), e.metadataTrack_ = r.addRemoteTextTrack({
                kind: "metadata",
                label: "Timed Metadata"
            },
            !1).track, e.metadataTrack_.inBandMetadataTrackDispatchType = i.metadata.dispatchType)
        };
        i.
    default = r,
        t.exports = i.
    default
    },
    {}],
    95 : [function(e, t, i) {
        "use strict";
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var n = {
            TIME_BETWEEN_CHUNKS: 4,
            BYTES_PER_CHUNK: 4096
        };
        i.
    default = n,
        t.exports = i.
    default
    },
    {}],
    96 : [function(e, t, i) { (function(n) {
            "use strict";
            function r(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function a(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            function s(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }),
                t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var o = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            u = function(e, t, i) {
                for (var n = !0; n;) {
                    var r = e,
                    a = t,
                    s = i;
                    n = !1,
                    null === r && (r = Function.prototype);
                    var o = Object.getOwnPropertyDescriptor(r, a);
                    if (void 0 !== o) {
                        if ("value" in o) return o.value;
                        var u = o.get;
                        if (void 0 === u) return;
                        return u.call(s)
                    }
                    var d = Object.getPrototypeOf(r);
                    if (null === d) return;
                    e = d,
                    t = a,
                    i = s,
                    n = !0,
                    o = d = void 0
                }
            },
            d = e(26),
            l = r(d),
            f = "undefined" != typeof window ? window.videojs: "undefined" != typeof n ? n.videojs: null,
            c = r(f),
            h = e(97),
            p = r(h),
            m = e(95),
            y = r(m),
            g = e(93),
            v = e(92),
            _ = function(e) {
                function t() {
                    var e = this;
                    a(this, t),
                    u(Object.getPrototypeOf(t.prototype), "constructor", this).call(this),
                    this.sourceBuffers = [],
                    this.readyState = "closed",
                    this.on(["sourceopen", "webkitsourceopen"],
                    function(t) {
                        e.swfObj = l.
                    default.getElementById(t.swfId),
                        e.player_ = (0, c.
                    default)(e.swfObj.parentNode),
                        e.tech_ = e.swfObj.tech,
                        e.readyState = "open",
                        e.tech_.on("seeking",
                        function() {
                            for (var t = e.sourceBuffers.length; t--;) e.sourceBuffers[t].abort()
                        }),
                        e.tech_.hls && e.tech_.hls.on("dispose",
                        function() { (0, v.cleanupTextTracks)(e.player_)
                        }),
                        e.swfObj && e.swfObj.vjs_load()
                    })
                }
                return s(t, e),
                o(t, [{
                    key: "addSeekableRange_",
                    value: function() {}
                },
                {
                    key: "addSourceBuffer",
                    value: function(e) {
                        var t = (0, g.parseContentType)(e),
                        i = void 0;
                        if ("video/mp2t" !== t.type) throw new Error("NotSupportedError (Video.js)");
                        return i = new p.
                    default(this),
                        this.sourceBuffers.push(i),
                        i
                    }
                },
                {
                    key: "endOfStream",
                    value: function(e) {
                        "network" === e ? this.tech_.error(2) : "decode" === e && this.tech_.error(3),
                        "ended" !== this.readyState && (this.readyState = "ended", this.swfObj.vjs_endOfStream())
                    }
                }]),
                t
            } (c.
        default.EventTarget);
            i.
        default = _;
            try {
                Object.defineProperty(_.prototype, "duration", {
                    get: function() {
                        return this.swfObj ? this.swfObj.vjs_getProperty("duration") : NaN
                    },
                    set: function(e) {
                        var t = void 0,
                        i = this.swfObj.vjs_getProperty("duration");
                        if (this.swfObj.vjs_setProperty("duration", e), e < i) for (t = 0; t < this.sourceBuffers.length; t++) this.sourceBuffers[t].remove(e, i);
                        return e
                    }
                })
            } catch(e) {
                _.prototype.duration = NaN
            }
            for (var b in y.
        default) _[b] = y.
        default[b];
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    97 : [function(e, t, i) { (function(n) {
            "use strict";
            function r(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function a(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            function s(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }),
                t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var o = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            u = function(e, t, i) {
                for (var n = !0; n;) {
                    var r = e,
                    a = t,
                    s = i;
                    n = !1,
                    null === r && (r = Function.prototype);
                    var o = Object.getOwnPropertyDescriptor(r, a);
                    if (void 0 !== o) {
                        if ("value" in o) return o.value;
                        var u = o.get;
                        if (void 0 === u) return;
                        return u.call(s)
                    }
                    var d = Object.getPrototypeOf(r);
                    if (null === d) return;
                    e = d,
                    t = a,
                    i = s,
                    n = !0,
                    o = d = void 0
                }
            },
            d = e(27),
            l = r(d),
            f = "undefined" != typeof window ? window.videojs: "undefined" != typeof n ? n.videojs: null,
            c = r(f),
            h = e(75),
            p = r(h),
            m = e(99),
            y = r(m),
            g = e(94),
            v = r(g),
            _ = e(91),
            b = e(95),
            T = r(b),
            S = function(e) {
                l.
            default.setTimeout(e, T.
            default.TIME_BETWEEN_CHUNKS)
            },
            w = function(e, t) { ("number" != typeof t || t < 0) && (t = 0);
                var i = Math.pow(10, t);
                return Math.round(e * i) / i
            },
            k = function(e) {
                function t(e) {
                    var i = this;
                    a(this, t),
                    u(Object.getPrototypeOf(t.prototype), "constructor", this).call(this);
                    var n = void 0;
                    this.chunkSize_ = T.
                default.BYTES_PER_CHUNK,
                    this.buffer_ = [],
                    this.bufferSize_ = 0,
                    this.basePtsOffset_ = NaN,
                    this.mediaSource_ = e,
                    this.updating = !1,
                    this.timestampOffset_ = 0,
                    this.segmentParser_ = new p.
                default.Transmuxer,
                    this.segmentParser_.on("data", this.receiveBuffer_.bind(this)),
                    n = l.
                default.btoa(String.fromCharCode.apply(null, Array.prototype.slice.call(this.segmentParser_.getFlvHeader()))),
                    this.mediaSource_.swfObj.vjs_appendBuffer(n),
                    this.one("updateend",
                    function() {
                        i.mediaSource_.tech_.trigger("loadedmetadata")
                    }),
                    Object.defineProperty(this, "timestampOffset", {
                        get: function() {
                            return this.timestampOffset_
                        },
                        set: function(e) {
                            "number" == typeof e && e >= 0 && (this.timestampOffset_ = e, this.segmentParser_ = new p.
                        default.Transmuxer, this.segmentParser_.on("data", this.receiveBuffer_.bind(this)), this.mediaSource_.swfObj.vjs_discontinuity(), this.basePtsOffset_ = NaN)
                        }
                    }),
                    Object.defineProperty(this, "buffered", {
                        get: function() {
                            if (! (this.mediaSource_ && this.mediaSource_.swfObj && "vjs_getProperty" in this.mediaSource_.swfObj)) return c.
                        default.createTimeRange();
                            var e = this.mediaSource_.swfObj.vjs_getProperty("buffered");
                            return e && e.length && (e[0][0] = w(e[0][0], 3), e[0][1] = w(e[0][1], 3)),
                            c.
                        default.createTimeRanges(e)
                        }
                    }),
                    this.mediaSource_.player_.on("seeked",
                    function() { (0, y.
                    default)(0, 1 / 0, i.metadataTrack_),
                        (0, y.
                    default)(0, 1 / 0, i.inbandTextTrack_)
                    })
                }
                return s(t, e),
                o(t, [{
                    key: "appendBuffer",
                    value: function(e) {
                        var t = this,
                        i = void 0,
                        n = 524288,
                        r = 0;
                        if (this.updating) throw i = new Error("SourceBuffer.append() cannot be called while an update is in progress"),
                        i.name = "InvalidStateError",
                        i.code = 11,
                        i;
                        this.updating = !0,
                        this.mediaSource_.readyState = "open",
                        this.trigger({
                            type: "update"
                        });
                        var a = function i() {
                            t.segmentParser_.push(e.subarray(r, r + n)),
                            r += n,
                            S(r < e.byteLength ? i: t.segmentParser_.flush.bind(t.segmentParser_))
                        };
                        a()
                    }
                },
                {
                    key: "abort",
                    value: function() {
                        this.buffer_ = [],
                        this.bufferSize_ = 0,
                        this.mediaSource_.swfObj.vjs_abort(),
                        this.updating && (this.updating = !1, this.trigger({
                            type: "updateend"
                        }))
                    }
                },
                {
                    key: "remove",
                    value: function(e, t) { (0, y.
                    default)(e, t, this.metadataTrack_),
                        (0, y.
                    default)(e, t, this.inbandTextTrack_),
                        this.trigger({
                            type: "update"
                        }),
                        this.trigger({
                            type: "updateend"
                        })
                    }
                },
                {
                    key: "receiveBuffer_",
                    value: function(e) {
                        var t = this; (0, v.
                    default)(this, this.mediaSource_, e),
                        (0, _.addTextTrackData)(this, e.captions, e.metadata),
                        S(function() {
                            var i = t.convertTagsToData_(e);
                            0 === t.buffer_.length && S(t.processBuffer_.bind(t)),
                            i && (t.buffer_.push(i), t.bufferSize_ += i.byteLength)
                        })
                    }
                },
                {
                    key: "processBuffer_",
                    value: function() {
                        var e = T.
                    default.BYTES_PER_CHUNK;
                        if (!this.buffer_.length) return void(this.updating !== !1 && (this.updating = !1, this.trigger({
                            type: "updateend"
                        })));
                        var t = this.buffer_[0].subarray(0, e);
                        t.byteLength < e || this.buffer_[0].byteLength === e ? this.buffer_.shift() : this.buffer_[0] = this.buffer_[0].subarray(e),
                        this.bufferSize_ -= t.byteLength;
                        for (var i = "",
                        n = t.byteLength,
                        r = 0; r < n; r++) i += String.fromCharCode(t[r]);
                        var a = l.
                    default.btoa(i);
                        this.mediaSource_.swfObj.CallFunction('<invoke name="vjs_appendBuffer"returntype="javascript"><arguments><string>' + a + "</string></arguments></invoke>"),
                        0 !== this.bufferSize_ ? S(this.processBuffer_.bind(this)) : (this.updating = !1, this.trigger({
                            type: "updateend"
                        }))
                    }
                },
                {
                    key: "convertTagsToData_",
                    value: function(e) {
                        var t = 0,
                        i = this.mediaSource_.tech_,
                        n = 0,
                        r = void 0,
                        a = void 0,
                        s = void 0,
                        o = [],
                        u = this.getOrderedTags_(e);
                        for (isNaN(this.basePtsOffset_) && u.length && (this.basePtsOffset_ = u[0].pts), i.seeking() && (n = Math.max(n, i.currentTime() - this.timestampOffset)), n *= 1e3, n += this.basePtsOffset_, r = 0; r < u.length; r++) u[r].pts >= n && o.push(u[r]);
                        if (0 !== o.length) {
                            for (r = 0; r < o.length; r++) t += o[r].bytes.byteLength;
                            for (s = new Uint8Array(t), r = 0, a = 0; r < o.length; r++) s.set(o[r].bytes, a),
                            a += o[r].bytes.byteLength;
                            return s
                        }
                    }
                },
                {
                    key: "getOrderedTags_",
                    value: function(e) {
                        for (var t = e.tags.videoTags,
                        i = e.tags.audioTags,
                        n = void 0,
                        r = []; t.length || i.length;) n = t.length ? i.length && i[0].dts < t[0].dts ? i.shift() : t.shift() : i.shift(),
                        r.push(n.finalize());
                        return r
                    }
                }]),
                t
            } (c.
        default.EventTarget);
            i.
        default = k,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    98 : [function(e, t, i) { (function(n) {
            "use strict";
            function r(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function a(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            function s(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }),
                t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var o = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            u = function(e, t, i) {
                for (var n = !0; n;) {
                    var r = e,
                    a = t,
                    s = i;
                    n = !1,
                    null === r && (r = Function.prototype);
                    var o = Object.getOwnPropertyDescriptor(r, a);
                    if (void 0 !== o) {
                        if ("value" in o) return o.value;
                        var u = o.get;
                        if (void 0 === u) return;
                        return u.call(s)
                    }
                    var d = Object.getPrototypeOf(r);
                    if (null === d) return;
                    e = d,
                    t = a,
                    i = s,
                    n = !0,
                    o = d = void 0
                }
            },
            d = e(27),
            l = r(d),
            f = e(26),
            c = r(f),
            h = "undefined" != typeof window ? window.videojs: "undefined" != typeof n ? n.videojs: null,
            p = r(h),
            m = e(102),
            y = r(m),
            g = e(91),
            v = e(93),
            _ = e(92),
            b = function(e) {
                return e.map(function(e) {
                    return e.replace(/avc1\.(\d+)\.(\d+)/i,
                    function(e, t, i) {
                        var n = ("00" + Number(t).toString(16)).slice( - 2),
                        r = ("00" + Number(i).toString(16)).slice( - 2);
                        return "avc1." + n + "00" + r
                    })
                })
            },
            T = function(e) {
                function t() {
                    var e = this;
                    a(this, t),
                    u(Object.getPrototypeOf(t.prototype), "constructor", this).call(this);
                    var i = void 0;
                    this.nativeMediaSource_ = new l.
                default.MediaSource;
                    for (i in this.nativeMediaSource_) i in t.prototype || "function" != typeof this.nativeMediaSource_[i] || (this[i] = this.nativeMediaSource_[i].bind(this.nativeMediaSource_));
                    this.duration_ = NaN,
                    Object.defineProperty(this, "duration", {
                        get: function() {
                            return this.duration_ === 1 / 0 ? this.duration_: this.nativeMediaSource_.duration
                        },
                        set: function(e) {
                            if (this.duration_ = e, e !== 1 / 0) return void(this.nativeMediaSource_.duration = e)
                        }
                    }),
                    Object.defineProperty(this, "seekable", {
                        get: function() {
                            return this.duration_ === 1 / 0 ? p.
                        default.createTimeRanges([[0, this.nativeMediaSource_.duration]]) : this.nativeMediaSource_.seekable
                        }
                    }),
                    Object.defineProperty(this, "readyState", {
                        get: function() {
                            return this.nativeMediaSource_.readyState
                        }
                    }),
                    Object.defineProperty(this, "activeSourceBuffers", {
                        get: function() {
                            return this.activeSourceBuffers_
                        }
                    }),
                    this.sourceBuffers = [],
                    this.activeSourceBuffers_ = [],
                    this.updateActiveSourceBuffers_ = function() {
                        e.activeSourceBuffers_.length = 0;
                        for (var t = !1,
                        i = !0,
                        n = 0; n < e.player_.audioTracks().length; n++) {
                            var r = e.player_.audioTracks()[n];
                            if (r.enabled && "main" !== r.kind) {
                                t = !0,
                                i = !1;
                                break
                            }
                        }
                        e.sourceBuffers.forEach(function(n) {
                            if (n.appendAudioInitSegment_ = !0, n.videoCodec_ && n.audioCodec_) n.audioDisabled_ = t;
                            else if (n.videoCodec_ && !n.audioCodec_) n.audioDisabled_ = !0,
                            i = !1;
                            else if (!n.videoCodec_ && n.audioCodec_ && (n.audioDisabled_ = i, i)) return;
                            e.activeSourceBuffers_.push(n)
                        })
                    },
                    this.onPlayerMediachange_ = function() {
                        e.sourceBuffers.forEach(function(e) {
                            e.appendAudioInitSegment_ = !0
                        })
                    },
                    ["sourceopen", "sourceclose", "sourceended"].forEach(function(e) {
                        this.nativeMediaSource_.addEventListener(e, this.trigger.bind(this))
                    },
                    this),
                    this.on("sourceopen",
                    function(t) {
                        var i = c.
                    default.querySelector('[src="' + e.url_ + '"]');
                        i && (e.player_ = (0, p.
                    default)(i.parentNode), e.player_.audioTracks && e.player_.audioTracks() && (e.player_.audioTracks().on("change", e.updateActiveSourceBuffers_), e.player_.audioTracks().on("addtrack", e.updateActiveSourceBuffers_), e.player_.audioTracks().on("removetrack", e.updateActiveSourceBuffers_)), e.player_.on("mediachange", e.onPlayerMediachange_))
                    }),
                    this.on("sourceended",
                    function(t) {
                        for (var i = (0, g.durationOfVideo)(e.duration), n = 0; n < e.sourceBuffers.length; n++) {
                            var r = e.sourceBuffers[n],
                            a = r.metadataTrack_ && r.metadataTrack_.cues;
                            a && a.length && (a[a.length - 1].endTime = i)
                        }
                    }),
                    this.on("sourceclose",
                    function(e) {
                        this.sourceBuffers.forEach(function(e) {
                            e.transmuxer_ && e.transmuxer_.terminate()
                        }),
                        this.sourceBuffers.length = 0,
                        this.player_ && ((0, _.cleanupTextTracks)(this.player_), this.player_.audioTracks && this.player_.audioTracks() && (this.player_.audioTracks().off("change", this.updateActiveSourceBuffers_), this.player_.audioTracks().off("addtrack", this.updateActiveSourceBuffers_), this.player_.audioTracks().off("removetrack", this.updateActiveSourceBuffers_)), this.player_.el_ && this.player_.off("mediachange", this.onPlayerMediachange_))
                    })
                }
                return s(t, e),
                o(t, [{
                    key: "addSeekableRange_",
                    value: function(e, t) {
                        var i = void 0;
                        if (this.duration !== 1 / 0) throw i = new Error("MediaSource.addSeekableRange() can only be invoked when the duration is Infinity"),
                        i.name = "InvalidStateError",
                        i.code = 11,
                        i; (t > this.nativeMediaSource_.duration || isNaN(this.nativeMediaSource_.duration)) && (this.nativeMediaSource_.duration = t)
                    }
                },
                {
                    key: "addSourceBuffer",
                    value: function(e) {
                        var t = void 0,
                        i = (0, v.parseContentType)(e);
                        if (/^(video|audio)\/mp2t$/i.test(i.type)) {
                            var n = [];
                            i.parameters && i.parameters.codecs && (n = i.parameters.codecs.split(","), n = b(n), n = n.filter(function(e) {
                                return (0, v.isAudioCodec)(e) || (0, v.isVideoCodec)(e)
                            })),
                            0 === n.length && (n = ["avc1.4d400d", "mp4a.40.2"]),
                            t = new y.
                        default(this, n),
                            0 !== this.sourceBuffers.length && (this.sourceBuffers[0].createRealSourceBuffers_(), t.createRealSourceBuffers_(), this.sourceBuffers[0].audioDisabled_ = !0)
                        } else t = this.nativeMediaSource_.addSourceBuffer(e);
                        return this.sourceBuffers.push(t),
                        t
                    }
                }]),
                t
            } (p.
        default.EventTarget);
            i.
        default = T,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    99 : [function(e, t, i) {
        "use strict";
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var n = function(e, t, i) {
            var n = void 0,
            r = void 0;
            if (i && i.cues) for (n = i.cues.length; n--;) r = i.cues[n],
            r.startTime <= t && r.endTime >= e && i.removeCue(r)
        };
        i.
    default = n,
        t.exports = i.
    default
    },
    {}],
    100 : [function(e, t, i) {
        "use strict";
        function n(e) {
            return e && e.__esModule ? e: {
            default:
                e
            }
        }
        function r(e, t) {
            if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        Object.defineProperty(i, "__esModule", {
            value: !0
        });
        var a = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value" in n && (n.writable = !0),
                    Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i),
                n && e(t, n),
                t
            }
        } (),
        s = e(27),
        o = n(s),
        u = e(83),
        d = n(u),
        l = function(e) {
            e.on("data",
            function(e) {
                var t = e.initSegment;
                e.initSegment = {
                    data: t.buffer,
                    byteOffset: t.byteOffset,
                    byteLength: t.byteLength
                };
                var i = e.data;
                e.data = i.buffer,
                o.
            default.postMessage({
                    action:
                    "data",
                    segment: e,
                    byteOffset: i.byteOffset,
                    byteLength: i.byteLength
                },
                [e.data])
            }),
            e.captionStream && e.captionStream.on("data",
            function(e) {
                o.
            default.postMessage({
                    action:
                    "caption",
                    data: e
                })
            }),
            e.on("done",
            function(e) {
                o.
            default.postMessage({
                    action:
                    "done"
                })
            })
        },
        f = function() {
            function e(t) {
                r(this, e),
                this.options = t || {},
                this.init()
            }
            return a(e, [{
                key: "init",
                value: function() {
                    this.transmuxer && this.transmuxer.dispose(),
                    this.transmuxer = new d.
                default.Transmuxer(this.options),
                    l(this.transmuxer)
                }
            },
            {
                key: "push",
                value: function(e) {
                    var t = new Uint8Array(e.data, e.byteOffset, e.byteLength);
                    this.transmuxer.push(t)
                }
            },
            {
                key: "reset",
                value: function() {
                    this.init()
                }
            },
            {
                key: "setTimestampOffset",
                value: function(e) {
                    var t = e.timestampOffset || 0;
                    this.transmuxer.setBaseMediaDecodeTime(Math.round(9e4 * t))
                }
            },
            {
                key: "flush",
                value: function(e) {
                    this.transmuxer.flush()
                }
            }]),
            e
        } (),
        c = function(e) {
            e.onmessage = function(e) {
                return "init" === e.data.action && e.data.options ? void(this.messageHandlers = new f(e.data.options)) : (this.messageHandlers || (this.messageHandlers = new f), void(e.data && e.data.action && "init" !== e.data.action && this.messageHandlers[e.data.action] && this.messageHandlers[e.data.action](e.data)))
            }
        };
        i.
    default = function(e) {
            return new c(e)
        },
        t.exports = i.
    default
    },
    {}],
    101 : [function(e, t, i) { (function(t) {
            "use strict";
            function n(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var r = e(27),
            a = n(r),
            s = e(96),
            o = n(s),
            u = e(98),
            d = n(u),
            l = "undefined" != typeof window ? window.videojs: "undefined" != typeof t ? t.videojs: null,
            f = n(l),
            c = 0,
            h = {
                mode: "auto"
            };
            f.
        default.mediaSources = {};
            var p = function(e, t) {
                var i = f.
            default.mediaSources[e];
                if (!i) throw new Error("Media Source not found (Video.js)");
                i.trigger({
                    type: "sourceopen",
                    swfId: t
                })
            },
            m = function() {
                return !! a.
            default.MediaSource && !!a.
            default.MediaSource.isTypeSupported && a.
            default.MediaSource.isTypeSupported('video/mp4;codecs="avc1.4d400d,mp4a.40.2"')
            },
            y = function(e) {
                var t = f.
            default.mergeOptions(h, e);
                return this.MediaSource = {
                    open: p,
                    supportsNativeMediaSources: m
                },
                "html5" === t.mode || "auto" === t.mode && m() ? new d.
            default:
                new o.
            default
            };
            i.MediaSource = y,
            y.open = p,
            y.supportsNativeMediaSources = m;
            var g = {
                createObjectURL: function(e) {
                    var t = "blob:vjs-media-source/",
                    i = void 0;
                    return e instanceof d.
                default ? (i = a.
                default.URL.createObjectURL(e.nativeMediaSource_), e.url_ = i, i) : e instanceof o.
                default ? (i = t + c, c++, f.
                default.mediaSources[i] = e, i) : (i = a.
                default.URL.createObjectURL(e), e.url_ = i, i)
                }
            };
            i.URL = g,
            f.
        default.MediaSource = y,
            f.
        default.URL = g
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    102 : [function(e, t, i) { (function(n) {
            "use strict";
            function r(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function a(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            function s(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }),
                t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            Object.defineProperty(i, "__esModule", {
                value: !0
            });
            var o = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            u = function(e, t, i) {
                for (var n = !0; n;) {
                    var r = e,
                    a = t,
                    s = i;
                    n = !1,
                    null === r && (r = Function.prototype);
                    var o = Object.getOwnPropertyDescriptor(r, a);
                    if (void 0 !== o) {
                        if ("value" in o) return o.value;
                        var u = o.get;
                        if (void 0 === u) return;
                        return u.call(s)
                    }
                    var d = Object.getPrototypeOf(r);
                    if (null === d) return;
                    e = d,
                    t = a,
                    i = s,
                    n = !0,
                    o = d = void 0
                }
            },
            d = "undefined" != typeof window ? window.videojs: "undefined" != typeof n ? n.videojs: null,
            l = r(d),
            f = e(94),
            c = r(f),
            h = e(99),
            p = r(h),
            m = e(91),
            y = e(103),
            g = r(y),
            v = e(100),
            _ = r(v),
            b = e(93),
            T = function(e) {
                function t(e, i) {
                    var n = this;
                    a(this, t),
                    u(Object.getPrototypeOf(t.prototype), "constructor", this).call(this, l.
                default.EventTarget),
                    this.timestampOffset_ = 0,
                    this.pendingBuffers_ = [],
                    this.bufferUpdating_ = !1,
                    this.mediaSource_ = e,
                    this.codecs_ = i,
                    this.audioCodec_ = null,
                    this.videoCodec_ = null,
                    this.audioDisabled_ = !1,
                    this.appendAudioInitSegment_ = !0;
                    var r = {
                        remux: !1
                    };
                    this.codecs_.forEach(function(e) { (0, b.isAudioCodec)(e) ? n.audioCodec_ = e: (0, b.isVideoCodec)(e) && (n.videoCodec_ = e)
                    }),
                    this.transmuxer_ = (0, g.
                default)(_.
                default),
                    this.transmuxer_.postMessage({
                        action: "init",
                        options: r
                    }),
                    this.transmuxer_.onmessage = function(e) {
                        return "data" === e.data.action ? n.data_(e) : "done" === e.data.action ? n.done_(e) : void 0
                    },
                    Object.defineProperty(this, "timestampOffset", {
                        get: function() {
                            return this.timestampOffset_
                        },
                        set: function(e) {
                            "number" == typeof e && e >= 0 && (this.timestampOffset_ = e, this.appendAudioInitSegment_ = !0, this.transmuxer_.postMessage({
                                action: "setTimestampOffset",
                                timestampOffset: e
                            }))
                        }
                    }),
                    Object.defineProperty(this, "appendWindowStart", {
                        get: function() {
                            return (this.videoBuffer_ || this.audioBuffer_).appendWindowStart
                        },
                        set: function(e) {
                            this.videoBuffer_ && (this.videoBuffer_.appendWindowStart = e),
                            this.audioBuffer_ && (this.audioBuffer_.appendWindowStart = e)
                        }
                    }),
                    Object.defineProperty(this, "updating", {
                        get: function() {
                            return !! (this.bufferUpdating_ || !this.audioDisabled_ && this.audioBuffer_ && this.audioBuffer_.updating || this.videoBuffer_ && this.videoBuffer_.updating)
                        }
                    }),
                    Object.defineProperty(this, "buffered", {
                        get: function() {
                            var e = null,
                            t = null,
                            i = 0,
                            n = [],
                            r = [];
                            if (!this.videoBuffer_ && !this.audioBuffer_) return l.
                        default.createTimeRange();
                            if (!this.videoBuffer_) return this.audioBuffer_.buffered;
                            if (!this.audioBuffer_) return this.videoBuffer_.buffered;
                            if (this.audioDisabled_) return this.videoBuffer_.buffered;
                            if (0 === this.videoBuffer_.buffered.length && 0 === this.audioBuffer_.buffered.length) return l.
                        default.createTimeRange();
                            for (var a = this.videoBuffer_.buffered,
                            s = this.audioBuffer_.buffered,
                            o = a.length; o--;) n.push({
                                time: a.start(o),
                                type: "start"
                            }),
                            n.push({
                                time: a.end(o),
                                type: "end"
                            });
                            for (o = s.length; o--;) n.push({
                                time: s.start(o),
                                type: "start"
                            }),
                            n.push({
                                time: s.end(o),
                                type: "end"
                            });
                            for (n.sort(function(e, t) {
                                return e.time - t.time
                            }), o = 0; o < n.length; o++)"start" === n[o].type ? (i++, 2 === i && (e = n[o].time)) : "end" === n[o].type && (i--, 1 === i && (t = n[o].time)),
                            null !== e && null !== t && (r.push([e, t]), e = null, t = null);
                            return l.
                        default.createTimeRanges(r)
                        }
                    })
                }
                return s(t, e),
                o(t, [{
                    key: "data_",
                    value: function(e) {
                        var t = e.data.segment;
                        t.data = new Uint8Array(t.data, e.data.byteOffset, e.data.byteLength),
                        t.initSegment = new Uint8Array(t.initSegment.data, t.initSegment.byteOffset, t.initSegment.byteLength),
                        (0, c.
                    default)(this, this.mediaSource_, t),
                        this.pendingBuffers_.push(t)
                    }
                },
                {
                    key: "done_",
                    value: function(e) {
                        this.processPendingSegments_()
                    }
                },
                {
                    key: "createRealSourceBuffers_",
                    value: function() {
                        var e = this,
                        t = ["audio", "video"];
                        t.forEach(function(i) {
                            if (e[i + "Codec_"] && !e[i + "Buffer_"]) {
                                var n = null;
                                e.mediaSource_[i + "Buffer_"] ? n = e.mediaSource_[i + "Buffer_"] : (n = e.mediaSource_.nativeMediaSource_.addSourceBuffer(i + '/mp4;codecs="' + e[i + "Codec_"] + '"'), e.mediaSource_[i + "Buffer_"] = n),
                                e[i + "Buffer_"] = n,
                                ["update", "updatestart", "updateend"].forEach(function(r) {
                                    n.addEventListener(r,
                                    function() {
                                        if ("audio" !== i || !e.audioDisabled_) {
                                            var n = t.every(function(t) {
                                                return ! ("audio" !== t || !e.audioDisabled_) || (i === t || !e[t + "Buffer_"] || !e[t + "Buffer_"].updating)
                                            });
                                            return n ? e.trigger(r) : void 0
                                        }
                                    })
                                })
                            }
                        })
                    }
                },
                {
                    key: "appendBuffer",
                    value: function(e) {
                        this.bufferUpdating_ = !0,
                        this.transmuxer_.postMessage({
                            action: "push",
                            data: e.buffer,
                            byteOffset: e.byteOffset,
                            byteLength: e.byteLength
                        },
                        [e.buffer]),
                        this.transmuxer_.postMessage({
                            action: "flush"
                        })
                    }
                },
                {
                    key: "remove",
                    value: function(e, t) {
                        this.videoBuffer_ && this.videoBuffer_.remove(e, t),
                        this.audioBuffer_ && this.audioBuffer_.remove(e, t),
                        (0, p.
                    default)(e, t, this.metadataTrack_),
                        (0, p.
                    default)(e, t, this.inbandTextTrack_)
                    }
                },
                {
                    key: "processPendingSegments_",
                    value: function() {
                        var e = {
                            video: {
                                segments: [],
                                bytes: 0
                            },
                            audio: {
                                segments: [],
                                bytes: 0
                            },
                            captions: [],
                            metadata: []
                        };
                        e = this.pendingBuffers_.reduce(function(e, t) {
                            var i = t.type,
                            n = t.data,
                            r = t.initSegment;
                            return e[i].segments.push(n),
                            e[i].bytes += n.byteLength,
                            e[i].initSegment = r,
                            t.captions && (e.captions = e.captions.concat(t.captions)),
                            t.info && (e[i].info = t.info),
                            t.metadata && (e.metadata = e.metadata.concat(t.metadata)),
                            e
                        },
                        e),
                        this.videoBuffer_ || this.audioBuffer_ || (0 === e.video.bytes && (this.videoCodec_ = null), 0 === e.audio.bytes && (this.audioCodec_ = null), this.createRealSourceBuffers_()),
                        e.audio.info && this.mediaSource_.trigger({
                            type: "audioinfo",
                            info: e.audio.info
                        }),
                        e.video.info && this.mediaSource_.trigger({
                            type: "videoinfo",
                            info: e.video.info
                        }),
                        this.appendAudioInitSegment_ && (!this.audioDisabled_ && this.audioBuffer_ && (e.audio.segments.unshift(e.audio.initSegment), e.audio.bytes += e.audio.initSegment.byteLength), this.appendAudioInitSegment_ = !1),
                        this.videoBuffer_ && (e.video.segments.unshift(e.video.initSegment), e.video.bytes += e.video.initSegment.byteLength, this.concatAndAppendSegments_(e.video, this.videoBuffer_), (0, m.addTextTrackData)(this, e.captions, e.metadata)),
                        !this.audioDisabled_ && this.audioBuffer_ && this.concatAndAppendSegments_(e.audio, this.audioBuffer_),
                        this.pendingBuffers_.length = 0,
                        this.bufferUpdating_ = !1
                    }
                },
                {
                    key: "concatAndAppendSegments_",
                    value: function(e, t) {
                        var i = 0,
                        n = void 0;
                        if (e.bytes) {
                            n = new Uint8Array(e.bytes),
                            e.segments.forEach(function(e) {
                                n.set(e, i),
                                i += e.byteLength
                            });
                            try {
                                t.appendBuffer(n)
                            } catch(e) {
                                this.mediaSource_.player_ && this.mediaSource_.player_.error({
                                    code: -3,
                                    type: "APPEND_BUFFER_ERR"
                                })
                            }
                        }
                    }
                },
                {
                    key: "abort",
                    value: function() {
                        this.videoBuffer_ && this.videoBuffer_.abort(),
                        this.audioBuffer_ && this.audioBuffer_.abort(),
                        this.transmuxer_ && this.transmuxer_.postMessage({
                            action: "reset"
                        }),
                        this.pendingBuffers_.length = 0,
                        this.bufferUpdating_ = !1
                    }
                }]),
                t
            } (l.
        default.EventTarget);
            i.
        default = T,
            t.exports = i.
        default
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}],
    103 : [function(e, t, i) {
        var n = arguments[3],
        r = arguments[4],
        a = arguments[5],
        s = JSON.stringify;
        t.exports = function(e) {
            for (var t, i = Object.keys(a), o = 0, u = i.length; o < u; o++) {
                var d = i[o];
                if (a[d].exports === e) {
                    t = d;
                    break
                }
            }
            if (!t) {
                t = Math.floor(Math.pow(16, 8) * Math.random()).toString(16);
                for (var l = {},
                o = 0,
                u = i.length; o < u; o++) {
                    var d = i[o];
                    l[d] = d
                }
                r[t] = [Function(["require", "module", "exports"], "(" + e + ")(self)"), l]
            }
            var f = Math.floor(Math.pow(16, 8) * Math.random()).toString(16),
            c = {};
            c[t] = t,
            r[f] = [Function(["require"], "require(" + s(t) + ")(self)"), c];
            var h = "(" + n + ")({" + Object.keys(r).map(function(e) {
                return s(e) + ":[" + r[e][0] + "," + s(r[e][1]) + "]"
            }).join(",") + "},{},[" + s(f) + "])",
            p = window.URL || window.webkitURL || window.mozURL || window.msURL;
            return new Worker(p.createObjectURL(new Blob([h], {
                type: "text/javascript"
            })))
        }
    },
    {}],
    104 : [function(e, t, i) { (function(i) {
            "use strict";
            function n(e) {
                return e && e.__esModule ? e: {
                default:
                    e
                }
            }
            function r(e, t) {
                if (! (e instanceof t)) throw new TypeError("Cannot call a class as a function")
            }
            function a(e, t) {
                if ("function" != typeof t && null !== t) throw new TypeError("Super expression must either be null or a function, not " + typeof t);
                e.prototype = Object.create(t && t.prototype, {
                    constructor: {
                        value: e,
                        enumerable: !1,
                        writable: !0,
                        configurable: !0
                    }
                }),
                t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
            }
            var s = function() {
                function e(e, t) {
                    for (var i = 0; i < t.length; i++) {
                        var n = t[i];
                        n.enumerable = n.enumerable || !1,
                        n.configurable = !0,
                        "value" in n && (n.writable = !0),
                        Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, i, n) {
                    return i && e(t.prototype, i),
                    n && e(t, n),
                    t
                }
            } (),
            o = function(e, t, i) {
                for (var n = !0; n;) {
                    var r = e,
                    a = t,
                    s = i;
                    n = !1,
                    null === r && (r = Function.prototype);
                    var o = Object.getOwnPropertyDescriptor(r, a);
                    if (void 0 !== o) {
                        if ("value" in o) return o.value;
                        var u = o.get;
                        if (void 0 === u) return;
                        return u.call(s)
                    }
                    var d = Object.getPrototypeOf(r);
                    if (null === d) return;
                    e = d,
                    t = a,
                    i = s,
                    n = !0,
                    o = d = void 0
                }
            },
            u = e(26),
            d = n(u),
            l = e(6),
            f = n(l),
            c = e(7),
            h = n(c),
            p = e(16),
            m = n(p),
            y = e(20),
            g = e(2),
            v = n(g),
            _ = e(101),
            b = e(64),
            T = n(b),
            S = "undefined" != typeof window ? window.videojs: "undefined" != typeof i ? i.videojs: null,
            w = n(S),
            k = e(4),
            O = e(3),
            P = n(O),
            A = e(10),
            x = n(A),
            E = e(27),
            L = n(E),
            C = e(5),
            I = n(C),
            U = e(9),
            D = n(U),
            M = {
                PlaylistLoader: f.
            default,
                Playlist: h.
            default,
                Decrypter: y.Decrypter,
                AsyncStream: y.AsyncStream,
                decrypt: y.decrypt,
                utils: v.
            default,
                xhr: (0, m.
            default)()
            };
            Object.defineProperty(M, "GOAL_BUFFER_LENGTH", {
                get: function() {
                    return w.
                default.log.warn("using Hls.GOAL_BUFFER_LENGTH is UNSAFE be sure you know what you are doing"),
                    P.
                default.GOAL_BUFFER_LENGTH
                },
                set: function(e) {
                    return w.
                default.log.warn("using Hls.GOAL_BUFFER_LENGTH is UNSAFE be sure you know what you are doing"),
                    "number" != typeof e || e <= 0 ? void w.
                default.log.warn("value passed to Hls.GOAL_BUFFER_LENGTH must be a number and greater than 0"):
                    void(P.
                default.GOAL_BUFFER_LENGTH = e)
                }
            });
            var j = 1.2,
            B = function(e, t) {
                var i = void 0;
                return e ? (i = L.
            default.getComputedStyle(e), i ? i[t] : "") : ""
            };
            M.STANDARD_PLAYLIST_SELECTOR = function() {
                var e = void 0,
                t = this.playlists.master.playlists.slice(),
                i = [],
                n = +new Date,
                r = void 0,
                a = void 0,
                s = void 0,
                o = void 0,
                u = void 0,
                d = void 0,
                l = void 0,
                f = void 0;
                for (t.sort(M.comparePlaylistBandwidth), t = t.filter(function(e) {
                    return "undefined" == typeof e.excludeUntil || n >= e.excludeUntil
                }), r = t.length; r--;) a = t[r],
                a.attributes && a.attributes.BANDWIDTH && (e = a.attributes.BANDWIDTH * j, e < this.systemBandwidth && (i.push(a), s || (s = a)));
                for (r = i.length, i.sort(M.comparePlaylistResolution), a = null, l = parseInt(B(this.tech_.el(), "width"), 10), f = parseInt(B(this.tech_.el(), "height"), 10); r--;) if (a = i[r], a.attributes && a.attributes.RESOLUTION && a.attributes.RESOLUTION.width && a.attributes.RESOLUTION.height) {
                    var c = a.attributes.RESOLUTION;
                    if (c.width === l && c.height === f) {
                        o = null,
                        d = a;
                        break
                    }
                    if (c.width < l && c.height < f) break; (!o || c.width < u.width && c.height < u.height) && (o = a, u = o.attributes.RESOLUTION)
                }
                return o || d || s || t[0]
            },
            M.canPlaySource = function() {
                return w.
            default.log.warn("HLS is no longer a tech. Please remove it from your player's techOrder.")
            },
            M.supportsNativeHls = function() {
                var e = d.
            default.createElement("video");
                if (!w.
            default.getComponent("Html5").isSupported()) return ! 1;
                var t = ["application/vnd.apple.mpegurl", "audio/mpegurl", "audio/x-mpegurl", "application/x-mpegurl", "video/x-mpegurl", "video/mpegurl", "application/mpegurl"];
                return t.some(function(t) {
                    return /maybe|probably/i.test(e.canPlayType(t))
                })
            } (),
            M.isSupported = function() {
                return w.
            default.log.warn("HLS is no longer a tech. Please remove it from your player's techOrder.")
            };
            var R = L.
        default.navigator && L.
        default.navigator.userAgent || "";
            M.supportsAudioInfoChange_ = function() {
                if (w.
            default.browser.IS_FIREFOX) {
                    var e = /Firefox\/([\d.]+)/i.exec(R),
                    t = parseInt(e[1], 10);
                    return t >= 49
                }
                return ! 0
            };
            var N = w.
        default.getComponent("Component"),
            F = function(e) {
                function t(e, i, n) {
                    var a = this;
                    if (r(this, t), o(Object.getPrototypeOf(t.prototype), "constructor", this).call(this, i), i.options_ && i.options_.playerId) {
                        var s = (0, w.
                    default)(i.options_.playerId);
                        s.hasOwnProperty("hls") || Object.defineProperty(s, "hls", {
                            get: function() {
                                return w.
                            default.log.warn("player.hls is deprecated. Use player.tech_.hls instead."),
                                a
                            }
                        })
                    }
                    this.tech_ = i,
                    this.source_ = e,
                    this.stats = {},
                    this.ignoreNextSeekingEvent_ = !1,
                    this.options_ = w.
                default.mergeOptions(w.
                default.options.hls || {},
                    n.hls),
                    this.setOptions_(),
                    this.on(d.
                default, ["fullscreenchange", "webkitfullscreenchange", "mozfullscreenchange", "MSFullscreenChange"],
                    function(e) {
                        var t = d.
                    default.fullscreenElement || d.
                    default.webkitFullscreenElement || d.
                    default.mozFullScreenElement || d.
                    default.msFullscreenElement;
                        t && t.contains(a.tech_.el()) && a.masterPlaylistController_.fastQualityChange_()
                    }),
                    this.on(this.tech_, "seeking",
                    function() {
                        return this.ignoreNextSeekingEvent_ ? void(this.ignoreNextSeekingEvent_ = !1) : void this.setCurrentTime(this.tech_.currentTime())
                    }),
                    this.on(this.tech_, "error",
                    function() {
                        this.masterPlaylistController_ && this.masterPlaylistController_.pauseLoading()
                    }),
                    this.audioTrackChange_ = function() {
                        a.masterPlaylistController_.setupAudio()
                    },
                    this.on(this.tech_, "play", this.play)
                }
                return a(t, e),
                s(t, [{
                    key: "setOptions_",
                    value: function() {
                        var e = this;
                        this.options_.withCredentials = this.options_.withCredentials || !1,
                        "number" != typeof this.options_.bandwidth && (this.options_.bandwidth = 4194304),
                        ["withCredentials", "bandwidth"].forEach(function(t) {
                            "undefined" != typeof e.source_[t] && (e.options_[t] = e.source_[t])
                        }),
                        this.bandwidth = this.options_.bandwidth
                    }
                },
                {
                    key: "src",
                    value: function(e) {
                        var t = this;
                        e && (this.setOptions_(), this.options_.url = this.source_.src, this.options_.tech = this.tech_, this.options_.externHls = M, this.masterPlaylistController_ = new k.MasterPlaylistController(this.options_), this.playbackWatcher_ = new I.
                    default(w.
                    default.mergeOptions(this.options_, {
                            seekable: function() {
                                return t.seekable()
                            }
                        })), this.masterPlaylistController_.selectPlaylist = this.selectPlaylist ? this.selectPlaylist.bind(this) : M.STANDARD_PLAYLIST_SELECTOR.bind(this), this.playlists = this.masterPlaylistController_.masterPlaylistLoader_, this.mediaSource = this.masterPlaylistController_.mediaSource, Object.defineProperties(this, {
                            selectPlaylist: {
                                get: function() {
                                    return this.masterPlaylistController_.selectPlaylist
                                },
                                set: function(e) {
                                    this.masterPlaylistController_.selectPlaylist = e.bind(this)
                                }
                            },
                            throughput: {
                                get: function() {
                                    return this.masterPlaylistController_.mainSegmentLoader_.throughput.rate
                                },
                                set: function(e) {
                                    this.masterPlaylistController_.mainSegmentLoader_.throughput.rate = e,
                                    this.masterPlaylistController_.mainSegmentLoader_.throughput.count = 1
                                }
                            },
                            bandwidth: {
                                get: function() {
                                    return this.masterPlaylistController_.mainSegmentLoader_.bandwidth
                                },
                                set: function(e) {
                                    this.masterPlaylistController_.mainSegmentLoader_.bandwidth = e,
                                    this.masterPlaylistController_.mainSegmentLoader_.throughput = {
                                        rate: 0,
                                        count: 0
                                    }
                                }
                            },
                            systemBandwidth: {
                                get: function() {
                                    var e = 1 / (this.bandwidth || 1),
                                    t = void 0;
                                    t = this.throughput > 0 ? 1 / this.throughput: 0;
                                    var i = Math.floor(1 / (e + t));
                                    return i
                                },
                                set: function() {
                                    w.
                                default.log.error('The "systemBandwidth" property is read-only')
                                }
                            }
                        }), Object.defineProperties(this.stats, {
                            bandwidth: {
                                get: function() {
                                    return t.bandwidth || 0
                                },
                                enumerable: !0
                            },
                            mediaRequests: {
                                get: function() {
                                    return t.masterPlaylistController_.mediaRequests_() || 0
                                },
                                enumerable: !0
                            },
                            mediaTransferDuration: {
                                get: function() {
                                    return t.masterPlaylistController_.mediaTransferDuration_() || 0
                                },
                                enumerable: !0
                            },
                            mediaBytesTransferred: {
                                get: function() {
                                    return t.masterPlaylistController_.mediaBytesTransferred_() || 0
                                },
                                enumerable: !0
                            },
                            mediaSecondsLoaded: {
                                get: function() {
                                    return t.masterPlaylistController_.mediaSecondsLoaded_() || 0
                                },
                                enumerable: !0
                            }
                        }), this.tech_.one("canplay", this.masterPlaylistController_.setupFirstPlay.bind(this.masterPlaylistController_)), this.masterPlaylistController_.on("sourceopen",
                        function() {
                            t.tech_.audioTracks().addEventListener("change", t.audioTrackChange_)
                        }), this.masterPlaylistController_.on("selectedinitialmedia",
                        function() { (0, x.
                        default)(t)
                        }), this.masterPlaylistController_.on("audioupdate",
                        function() {
                            t.tech_.clearTracks("audio"),
                            t.masterPlaylistController_.activeAudioGroup().forEach(function(e) {
                                t.tech_.audioTracks().addTrack(e)
                            })
                        }), this.on(this.masterPlaylistController_, "progress",
                        function() {
                            this.tech_.trigger("progress")
                        }), this.on(this.masterPlaylistController_, "firstplay",
                        function() {
                            this.ignoreNextSeekingEvent_ = !0
                        }), this.tech_.el() && this.tech_.src(w.
                    default.URL.createObjectURL(this.masterPlaylistController_.mediaSource)))
                    }
                },
                {
                    key: "activeAudioGroup_",
                    value: function() {
                        return this.masterPlaylistController_.activeAudioGroup()
                    }
                },
                {
                    key: "play",
                    value: function() {
                        this.masterPlaylistController_.play()
                    }
                },
                {
                    key: "setCurrentTime",
                    value: function(e) {
                        this.masterPlaylistController_.setCurrentTime(e)
                    }
                },
                {
                    key: "duration",
                    value: function() {
                        return this.masterPlaylistController_.duration()
                    }
                },
                {
                    key: "seekable",
                    value: function() {
                        return this.masterPlaylistController_.seekable()
                    }
                },
                {
                    key: "dispose",
                    value: function() {
                        this.playbackWatcher_ && this.playbackWatcher_.dispose(),
                        this.masterPlaylistController_ && this.masterPlaylistController_.dispose(),
                        this.tech_.audioTracks().removeEventListener("change", this.audioTrackChange_),
                        o(Object.getPrototypeOf(t.prototype), "dispose", this).call(this)
                    }
                }]),
                t
            } (N),
            G = function e(t) {
                return {
                    canHandleSource: function(i) {
                        return (!w.
                    default.options.hls || !w.
                    default.options.hls.mode || w.
                    default.options.hls.mode === t) && e.canPlayType(i.type)
                    },
                    handleSource: function(e, i, n) {
                        "flash" === t && i.setTimeout(function() {
                            i.trigger("loadstart")
                        },
                        1);
                        var r = w.
                    default.mergeOptions(n, {
                            hls: {
                                mode: t
                            }
                        });
                        return i.hls = new F(e, i, r),
                        i.hls.xhr = (0, m.
                    default)(),
                        w.
                    default.Hls.xhr.beforeRequest && (i.hls.xhr.beforeRequest = w.
                    default.Hls.xhr.beforeRequest),
                        i.hls.src(e.src),
                        i.hls
                    },
                    canPlayType: function(t) {
                        return e.canPlayType(t) ? "maybe": ""
                    }
                }
            };
            M.comparePlaylistBandwidth = function(e, t) {
                var i = void 0,
                n = void 0;
                return e.attributes && e.attributes.BANDWIDTH && (i = e.attributes.BANDWIDTH),
                i = i || L.
            default.Number.MAX_VALUE,
                t.attributes && t.attributes.BANDWIDTH && (n = t.attributes.BANDWIDTH),
                n = n || L.
            default.Number.MAX_VALUE,
                i - n
            },
            M.comparePlaylistResolution = function(e, t) {
                var i = void 0,
                n = void 0;
                return e.attributes && e.attributes.RESOLUTION && e.attributes.RESOLUTION.width && (i = e.attributes.RESOLUTION.width),
                i = i || L.
            default.Number.MAX_VALUE,
                t.attributes && t.attributes.RESOLUTION && t.attributes.RESOLUTION.width && (n = t.attributes.RESOLUTION.width),
                n = n || L.
            default.Number.MAX_VALUE,
                i === n && e.attributes.BANDWIDTH && t.attributes.BANDWIDTH ? e.attributes.BANDWIDTH - t.attributes.BANDWIDTH: i - n
            },
            G.canPlayType = function(e) {
                var t = /^(audio|video|application)\/(x-|vnd\.apple\.)?mpegurl/i;
                return ! (!w.
            default.options.hls.overrideNative && M.supportsNativeHls) && t.test(e)
            },
            "undefined" != typeof w.
        default.MediaSource && "undefined" != typeof w.
        default.URL || (w.
        default.MediaSource = _.MediaSource, w.
        default.URL = _.URL),
            _.MediaSource.supportsNativeMediaSources() && w.
        default.getComponent("Html5").registerSourceHandler(G("html5"), 0),
            L.
        default.Uint8Array && w.
        default.getComponent("Flash").registerSourceHandler(G("flash")),
            w.
        default.HlsHandler = F,
            w.
        default.HlsSourceHandler = G,
            w.
        default.Hls = M,
            w.
        default.m3u8 = T.
        default,
            w.
        default.registerComponent("Hls", M),
            w.
        default.options.hls = w.
        default.options.hls || {},
            w.
        default.plugin("reloadSourceOnError", D.
        default),
            t.exports = {
                Hls: M,
                HlsHandler: F,
                HlsSourceHandler: G
            }
        }).call(this, "undefined" != typeof global ? global: "undefined" != typeof self ? self: "undefined" != typeof window ? window: {})
    },
    {}]
},
{},
[104]);