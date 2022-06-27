// [SECTION 0400]: SAFE BROWSING (SB)
// 0401: disable SB (Safe Browsing)

//user_pref("browser.safebrowsing.malware.enabled", false);
//user_pref("browser.safebrowsing.phishing.enabled", false);

//* 0402: Enable SB checks for downloads (both local lookups + remote)
//user_pref("browser.safebrowsing.downloads.enabled", false);

//* 0403: disable SB checks for downloads (remote)

user_pref("browser.safebrowsing.downloads.remote.enabled", true);

//* 0404: disable SB checks for unwanted software
//user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
//user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);



//*** [SECTION 0600]: BLOCK IMPLICIT OUTBOUND [not explicitly asked for - e.g. clicked on] ***/

user_pref("network.dns.disablePrefetchFromHTTPS", true);

//* 0610: enforce no "Hyperlink Auditing" (click tracking)

user_pref("browser.send_pings", false); // [DEFAULT: false]


//* [SETTING] General>Tabs>Enable Container Tabs>Settings>Select a container for each new tab ***/

//user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", true);


//*** [SECTION 2000]: PLUGINS / MEDIA / WEBRTC ***/
//* 2001: disable WebRTC (Web Real-Time Communication)
user_pref("media.peerconnection.enabled", false);

//* 2004: force exclusion of private IPs from ICE candidates [FF51+]
user_pref("media.peerconnection.ice.no_host", true);

//* 2020: disable GMP (Gecko Media Plugins)
user_pref("media.gmp-provider.enabled", false);

//* 2022: disable all DRM content (EME: Encryption Media Extension)
user_pref("media.eme.enabled", false);
user_pref("browser.eme.ui.enabled", false);



/*** [SECTION 2000]: PLUGINS / MEDIA / WEBRTC ***/

//* 2021: disable widevine CDM (Content Decryption Module)
//* [NOTE] This is covered by the EME master switch (2022) ***/
user_pref("media.gmp-widevinecdm.enabled", false);

//* 2030: disable autoplay of HTML5 media [FF63+]
user_pref("media.autoplay.default", 5);
user_pref("media.autoplay.blocking_policy", 2);

//*** [SECTION 2600]: MISCELLANEOUS ***/

//* 2615: disable websites overriding Firefox's keyboard shortcuts [FF58+]
// * 0 (default) or 1=allow, 2=block
// * [SETTING] to add site exceptions: Ctrl+I>Permissions>Override Keyboard Shortcuts ***/
user_pref("permissions.default.shortcuts", 2);

//*** [SECTION 5000]: OPTIONAL OPSEC
//* 5003: disable saving passwords
user_pref("signon.rememberSignons", false);

//* 5010: disable location bar suggestion types
// * [SETTING] Privacy & Security>Address Bar>When using the address bar, suggest ***/

// disabling picture in picture
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);

// Disabling Pocket extension
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.showHome", false);

//* UPDATES ***/
user_pref("app.update.auto", false);

// Restore session
// https://github.com/arkenfox/user.js/issues/1080
user_pref("browser.startup.page", 3);
user_pref("privacy.clearOnShutdown.history", false);

//*** [SECTION 0100]: STARTUP ***/
//user_pref("browser.startup.page", 1);

//* 0103: set HOME+NEWWINDOW page
user_pref("browser.startup.homepage", "https://search.dr460nf1r3.org/");

//* 0104: set NEWTAB page

//user_pref("browser.newtabpage.enabled", true);
//user_pref("browser.newtab.preload", true);

//* 1004: set the minimum interval between session save operations
// [UNBREAK=(default value)] interval in seconds at which session data is stored (restore session after browser crash) - '9999999' essentially disables session store to reduce disk writes - previous opened tabs will still be restored on startup (see also: 'browser.startup.page')
user_pref("browser.sessionstore.interval", 9999999);


/* UPDATES ***/
// [NON-WINDOWS] disable auto app updates
user_pref("app.update.auto", false);

// Minimize tab size 
user_pref("browser.tabs.tabMinWidth", 38);

/**
 * [SET] the following preferences adjusts the smooth scrolling feature of
 * Firefox when using a mouse wheel or keyboard keys to scroll
 */
user_pref("general.smoothScroll.lines.durationMaxMS", 400);         // smooth the start/end of line scrolling operations in ms (up/down arrow/page keys)
user_pref("general.smoothScroll.lines.durationMinMS", 200);         // smooth the start/end of line scrolling operations in ms (up/down arrow/page keys)
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 600);    // smooth the start/end of scrolling operations in ms
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 300);    // smooth the start/end of scrolling operations in ms
user_pref("general.smoothScroll.other.durationMaxMS", 400);         // smooth the start/end of other scrolling operations in ms
user_pref("general.smoothScroll.other.durationMinMS", 200);         // smooth the start/end of other scrolling operations in ms
user_pref("general.smoothScroll.pages.durationMaxMS", 400);         // smooth the start/end of page scrolling operations in ms (PgUp/PgDn keys)
user_pref("general.smoothScroll.pages.durationMinMS", 200);         // smooth the start/end of page scrolling operations in ms (PgUp/PgDn keys)
user_pref("mousewheel.acceleration.factor", 10);                    // sets acceleration factor if mouse wheel.acceleration.start > -1
user_pref("mousewheel.acceleration.start", 0);                      // when to apply mouse wheel.acceleration.factor (after how many scroll clicks of mouse wheel) - value must be greater than -1
user_pref("mousewheel.default.delta_multiplier_x", 85);             // sets the x-axis step size
user_pref("mousewheel.default.delta_multiplier_y", 85);             // sets the y-axis step size
user_pref("mousewheel.default.delta_multiplier_z", 85);             // sets the z-axis step size
user_pref("mousewheel.min_line_scroll_amount", 10);                 // if the CSS line height is smaller than this value in pixels, each scroll click will scroll this amount
