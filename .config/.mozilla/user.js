// Disabling telemetry
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("geo.provider.use_geoclue", false);
user_pref("geo.provider.use_gpsd", false);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);

user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.ping-centre.telemetry", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);

// Disabling sponsored content
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned", "amazon");
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines", "");
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.search.hiddenOneOffs", "Google,Amazon.de,Bing,DuckDuckGo,Wikipedia (en)");
user_pref("browser.topsites.blockedSponsors", ["amazon", "adidas", "nike", "trivago"]);
user_pref("extensions.pocket.enabled", false);
user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored", false);
user_pref("services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);

// Setting homepage and pinned shortcuts
user_pref("browser.newtabpage.pinned", [{"url":"https://github.com","label":"GitHub"},{"url":"https://youtube.com","label":"YouTube"},{"url":"https://web.whatsapp.com","label":"WhatsApp"},{"url":"https://reddit.com","label":"Reddit"},{"url":"https://outlook.live.com/owa/","label":"Outlook"}]);
user_pref("browser.startup.homepage", "about:home");
user_pref("browser.startup.page", 1);
user_pref("browser.toolbars.bookmarks.visibility", "never");

// Disabling autofill
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("signon.autofillForms", false);
user_pref("signon.generation.enabled", false);
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("signon.rememberSignons", false);
user_pref("browser.formfill.enable", false);

// Moving cache to RAM
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.disk.parent_directory", "/run/user/$(id -u)/firefox");
user_pref("browser.cache.memory.enable", true);
user_pref("browser.sessionstore.interval", 60000);

// Enabling DRM content
user_pref("media.gmp-widevinecdm.abi", "x86_64-gcc3");

// Disabling Picture in Picture"
user_pref("media.videocontrols.picture-in-picture.enabled", false);

// Disable search suggestions"
user_pref("browser.search.suggest.enabled", false);

// Enable Do Not Track"
user_pref("privacy.donottrackheader.enabled", true);

// Miscellaneous tweaks
user_pref("intl.accept_languages", "en-US, en");
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("browser.discovery.enabled", false);
