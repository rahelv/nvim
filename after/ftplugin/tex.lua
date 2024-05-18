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
        ['m'] = {
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

-- local function add_item()
--     print 'inside add item'
--     local end_pos = vim.fn.searchpairpos('\\begin{', '', '\\end{', 'nW') -- returns list (lnum, col), lua arrays begin with 1
--     local lnum = end_pos[1]
--     local col = end_pos[2]
--     print(lnum)
--     print(col)
--     if string.match(vim.fn.getline(lnum), '(itemize|enumerate|description)') then
--         print 'should return item '
--         return '\\item '
--     else
--         print 'in else'
--         return ''
--     end
-- end

local function check_line()
    local current_line = vim.api.nvim_get_current_line()

    if current_line:match '^%s*$' ~= nil then --if line is empty (only contains whitespace chars)
        return '\\item '
    else
        return '- '
    end
end

vim.keymap.set('i', '- ', check_line, { expr = true, buffer = true })
