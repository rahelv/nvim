-- from https://github.com/kylechui/config.nvim
-- TODO: overwritte aliases or find new keys !!
require('nvim-surround').buffer_setup {
    surrounds = {
        -- ["e"] = {
        --   add = function()
        --     local env = require("nvim-surround.config").get_input ("Environment: ")
        --     return { { "\\begin{" .. env .. "}" }, { "\\end{" .. env .. "}" } }
        --   end,
        -- },
        ['Q'] = {
            add = { '``', "''" },
            find = "%b``.-''",
            delete = "^(``)().-('')()$",
        },
        ['q'] = {
            add = { '`', "'" },
            find = "`.-'",
            delete = "^(`)().-(')()$",
        },
        ['d'] = {
            add = { '\\textbf{', '}' },
            -- add = function()
            --   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
            --     return { { "\\mathbf{" }, { "}" } }
            --   end
            --   return { { "\\textbf{" }, { "}" } }
            -- end,
            find = '\\%a-bf%b{}',
            delete = '^(\\%a-bf{)().-(})()$',
        },
        ['i'] = {
            add = { '\\textit{', '}' },
            -- add = function()
            --   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
            --     return { { "\\mathit{" }, { "}" } }
            --   end
            --   return { { "\\textit{" }, { "}" } }
            -- end,
            find = '\\%a-it%b{}',
            delete = '^(\\%a-it{)().-(})()$',
        },
        ['s'] = {
            add = { '\\textsc{', '}' },
            find = '\\textsc%b{}',
            delete = '^(\\textsc{)().-(})()$',
        },
        ['t'] = {
            add = { '\\texttt{', '}' },
            -- add = function()
            --   if vim.fn["vimtex#syntax#in_mathzone"]() == 1 then
            --     return { { "\\mathtt{" }, { "}" } }
            --   end
            --   return { { "\\texttt{" }, { "}" } }
            -- end,
            find = '\\%a-tt%b{}',
            delete = '^(\\%a-tt{)().-(})()$',
        },
        ['$'] = {
            add = { '$', '$' },
            -- find = "%b$.-$",
            -- delete = "^($)().-($)()$",
        },
    },
}

local function add_item()
    local start_pos = vim.fn.searchpairpos('begin{', '', 'end{', 'bnW') -- returns list (lnum, col), lua arrays begin with 1. TODO: add \ before
    local end_pos = vim.fn.searchpairpos('begin{', '', 'end{', 'nW')
    local end_line = vim.fn.getline(end_pos[1])
    local current_line = vim.api.nvim_get_current_line()
    local current_line_nr = vim.api.nvim__buf_stats(0).current_lnum

    if not (current_line_nr < end_pos[1] and current_line_nr > start_pos[1]) then --check if current line is in environment
        return '- '
    end

    if current_line:match '^%s*$' == nil then --if line is not empty (not only contains whitespace chars)
        return '- '
    end

    if string.match(end_line, 'itemize') or string.match(end_line, 'enumerate') then
        return '\\item '
    elseif string.match(end_line, 'description') then
        return '\\item['
    else
        return '- '
    end
end

vim.keymap.set('i', '- ', add_item, { expr = true, buffer = true })
