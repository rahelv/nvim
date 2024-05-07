-- Source: http://lua-users.org/wiki/MakingLuaLikePhp
-- Credit: http://richard.warburton.it/
local function explode(div, str)
    if div == '' then
        return false
    end
    local pos, arr = 0, {}
    for st, sp in
        function()
            return string.find(str, div, pos, true)
        end
    do
        table.insert(arr, string.sub(str, pos, st - 1))
        pos = sp + 1
    end
    table.insert(arr, string.sub(str, pos))
    return arr
end

local function getRandomAsciiArt()
    math.randomseed(os.time())
    -- 1-5, number has to be nr of pictures in ascii folder
    local ascii_art = require('themes.ascii.art_' .. math.random(5))
    return explode('\n', ascii_art)
end

local settings = {
    -- every line should be same width without escaped \
    header = {
        type = 'text',
        oldfiles_directory = false,
        align = 'center',
        fold_section = false,
        title = 'Header',
        margin = 2,
        content = getRandomAsciiArt(),
        highlight = 'Statement',
        default_color = '',
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = 'mapping',
        oldfiles_directory = false,
        align = 'center',
        fold_section = false,
        title = 'Basic Commands',
        margin = 2,
        content = {
            { ' Find File', 'Telescope find_files', '<leader>ff' },
            { '󰍉 Find Word', 'Telescope live_grep', '<leader>lg' },
            { ' Recent Files', 'Telescope oldfiles', '<leader>of' },
            { ' Colorschemes', 'Telescope colorscheme', '<leader>cs' },
        },
        highlight = 'String',
        default_color = '',
        oldfiles_amount = 0,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },
    mappings = {
        execute_command = '<CR>',
        open_file = 'o',
        open_file_split = '<c-o>',
        open_section = '<TAB>',
        open_help = '?',
    },
    colors = {
        background = '#1f2227',
        folded_section = '#56b6c2',
    },
    parts = { 'header', 'body' },
}
return settings
