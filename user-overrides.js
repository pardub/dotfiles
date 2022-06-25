// [SECTION 0400]: SAFE BROWSING (SB)
// 0401: disable SB (Safe Browsing)

//user_pref("browser.safebrowsing.malware.enabled", false);
//user_pref("browser.safebrowsing.phishing.enabled", false);

//* 0402: disable SB checks for downloads (both local lookups + remote)
//user_pref("browser.safebrowsing.downloads.enabled", false);

//* 0403: disable SB checks for downloads (remote)

user_pref("browser.safebrowsing.downloads.remote.enabled", false);

//* 0404: disable SB checks for unwanted software
//user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
//user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);



//*** [SECTION 0600]: BLOCK IMPLICIT OUTBOUND [not explicitly asked for - e.g. clicked on] ***/

user_pref("network.dns.disablePrefetchFromHTTPS", true);

//* 0610: enforce no "Hyperlink Auditing" (click tracking)

user_pref("browser.send_pings", false); // [DEFAULT: false]


//* [SETTING] General>Tabs>Enable Container Tabs>Settings>Select a container for each new tab ***/

user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", true);


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



