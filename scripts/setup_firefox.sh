#!/bin/bash

echo "Deleting default Fedora Firefox profile..."
sudo rm -f /usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js

cd $HOME/.mozilla/firefox/*.default-release

echo "Updating Firefox profile..."
echo "user_pref(\"trailhead.firstrun.didSeeAboutWelcome\", true);" >> prefs.js

echo "Disabling telemetry..."
echo "user_pref(\"app.shield.optoutstudies.enabled\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.feeds.telemetry\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.telemetry\", false);" >> prefs.js
echo "user_pref(\"browser.ping-centre.telemetry\", false);" >> prefs.js
echo "user_pref(\"datareporting.healthreport.uploadEnabled\", false);" >> prefs.js

echo "Disabling sponsored content..."
echo "user_pref(\"browser.newtabpage.activity-stream.feeds.section.topstories\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned\", \"amazon\");" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines\", \"\");" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.section.highlights.includePocket\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.showSponsored\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.showSponsoredTopSites\", false);" >> prefs.js
echo "user_pref(\"browser.search.hiddenOneOffs\", \"Google,Amazon.de,Bing,DuckDuckGo,Wikipedia (en)\");" >> prefs.js
echo "user_pref(\"browser.topsites.blockedSponsors\", \"[\\\"amazon\\\",\\\"adidas\\\",\\\"nike\\\",\\\"trivago\\\"]\");" >> prefs.js
echo "user_pref(\"extensions.pocket.enabled\", false);" >> prefs.js
echo "user_pref(\"services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored\", false);" >> prefs.js
echo "user_pref(\"services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites\", false);" >> prefs.js

echo "Setting homepage and pinned shortcuts..."
echo "user_pref(\"browser.newtabpage.pinned\", \"[{\\\"url\\\":\\\"https://github.com\\\",\\\"label\\\":\\\"GitHub\\\"},{\\\"url\\\":\\\"https://youtube.com\\\",\\\"label\\\":\\\"YouTube\\\"},{\\\"url\\\":\\\"https://web.whatsapp.com\\\",\\\"label\\\":\\\"WhatsApp\\\"},{\\\"url\\\":\\\"https://reddit.com\\\",\\\"label\\\":\\\"Reddit\\\"},{\\\"url\\\":\\\"https://outlook.live.com/owa/\\\",\\\"label\\\":\\\"Outlook\\\"}]\");" >> prefs.js
echo "user_pref(\"browser.startup.homepage\", \"about:home\");" >> prefs.js
echo "user_pref(\"browser.startup.page\", 1);" >> prefs.js
echo "user_pref(\"browser.toolbars.bookmarks.visibility\", \"never\");" >> prefs.js

echo "Disabling autofill..."
echo "user_pref(\"extensions.formautofill.creditCards.enabled\", false);" >> prefs.js
echo "user_pref(\"signon.autofillForms\", false);" >> prefs.js
echo "user_pref(\"signon.generation.enabled\", false);" >> prefs.js
echo "user_pref(\"signon.management.page.breach-alerts.enabled\", false);" >> prefs.js
echo "user_pref(\"signon.rememberSignons\", false);" >> prefs.js

echo "Moving cache to RAM..."
echo "user_pref(\"browser.cache.disk.enable\", false);" >> prefs.js
echo "user_pref(\"browser.cache.disk.parent_directory\", \"/run/user/$(id -u)/firefox\");" >> prefs.js
echo "user_pref(\"browser.cache.memory.enable\", true);" >> prefs.js
echo "user_pref(\"browser.sessionstore.interval\", 60000);" >> prefs.js

echo "Enabling DRM content..."
echo "user_pref(\"media.gmp-widevinecdm.abi\", \"x86_64-gcc3\");" >> prefs.js

echo "Disabling Picture in Picture"
echo "user_pref(\"media.videocontrols.picture-in-picture.enabled\", false);" >> prefs.js
