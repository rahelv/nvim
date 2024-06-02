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

local function env(name)
    local x, y = unpack(vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')"))
    return x ~= 0 and y ~= 0
end

local function add_item()
    local current_line = vim.api.nvim_get_current_line()

    if current_line:match '^%s*$' == nil then --if line is not empty (not only contains whitespace chars)
        return '- '
    end

    if env 'itemize' or env 'enumerate' then
        return '\\item '
    elseif env 'description' then
        return '\\item['
    else
        return '- '
    end
end

vim.keymap.set('i', '- ', add_item, { expr = true, buffer = true })
