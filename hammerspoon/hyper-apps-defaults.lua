function chrome_active_tab_with_name(name)
    return function()
        hs.osascript.javascript([[
            // below is javascript code
            var chrome = Application('Google Chrome');
            chrome.activate();
            var wins = chrome.windows;

            // loop tabs to find a web page with a title of <name>
            function main() {
                for (var i = 0; i < wins.length; i++) {
                    var win = wins.at(i);
                    var tabs = win.tabs;
                    for (var j = 0; j < tabs.length; j++) {
                    var tab = tabs.at(j);
                    tab.title(); j;
                    if (tab.title().indexOf(']] .. name .. [[') > -1) {
                            win.activeTabIndex = j + 1;
                            return;
                        }
                    }
                }
            }
            main();
            // end of javascript
        ]])
    end
end


-- Default keybindings for launching apps in Hyper Mode
--
-- To launch _your_ most commonly-used apps via Hyper Mode, create a copy of
-- this file, save it as `hyper-apps.lua`, and edit the table below to configure
-- your preferred shortcuts.
return {
  { 'a', 'Spotify' },             -- "A" for "Spotify Music"
  { 'b', 'Google Chrome' },     -- "B" for "Browser"
  { 'c', chrome_active_tab_with_name('Vast - Calendar') },             -- "C" for "Calendar"
  { 'd', 'Microsoft OneNote' }, -- "D" for "Do!" ... or "Done!"
  { 'e', 'CLion' },              -- "E" for "Editor"
  { 'f', 'Finder' },            -- "F" for "Finder"
  { 'g', chrome_active_tab_with_name('ronnie.lazar@vastdata.com ') },       -- "G" for "Gmail"
  { 's', 'Slack' },             -- "S" for "Slack"
  { 't', 'iTerm' },             -- "T" for "Terminal"
  { 'w', 'WhatsApp' },          -- "W" for "WhatsApp"
}
