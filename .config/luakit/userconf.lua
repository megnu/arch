--- userconf.lua
local settings = require "settings"
local engines = settings.window.search_engines
engines.aur          = "https://aur.archlinux.org/packages.php?O=0&K=%s&do_Search=Go"
engines.aw           = "https://wiki.archlinux.org/index.php?title=Special:Search&search=%s"
engines.pkg          = "https://www.archlinux.org/packages/?q=%s"
engines.wiki         = "https://en.wikipedia.org/w/index.php?title=Special:Search&search=%s"
engines.emo          = "https://emojipedia.org/search/?q=%s&utm_source=opensearch"
engines.gh           = "https://github.com/search?q=%s&ref=opensearch"
local modes = require "modes"
local style = stylesheet{ source = "#p { color: black; }" }
do
    local mod1binds = {}
    for i=1,10 do
        table.insert(mod1binds, {
            ("<Control-%d>"):format(i % 10), "Jump to tab at index "..i..".", function (w) w.tabs:switch(i) end
        })
    end
    modes.add_binds("normal", mod1binds)
end
modes.add_binds("normal", {{
    "<Control-c>",
    "Copy selected text.",
    function ()
        luakit.selection.clipboard = luakit.selection.primary
    end
}})
modes.add_binds("insert", {
    { "<Shift-Insert>", "Paste current selection into the page", function (w)
        local value = luakit.selection.primary
        if (not value) or #value == 0 then
            return
        end

        -- Stolen from lib/open_editor.lua
        value = value:gsub("^%s*(.-)%s*$", "%1")
        value = string.format("%q", value):sub(2, -2)
        value = value:gsub("\\\n", "\\n")

        -- http://stackoverflow.com/questions/11076975/insert-text-into-textarea-at-cursor-position-javascript
        w.view:eval_js(string.format([=[
            var elem = document.activeElement;
            var value = "%s";
            if (elem.selectionStart || elem.selectionStart == '0') {
                var startPos = elem.selectionStart;
                var endPos = elem.selectionEnd;
                elem.value = elem.value.substring(0, startPos)
                    + value
                    + elem.value.substring(endPos, elem.value.length);
                elem.selectionStart = startPos + value.length;
                elem.selectionEnd = startPos + value.length;
            } else {
                elem.value += value;
            }
        ]=], value), { no_return = true })
    end },
})