-- [
-- snip_env + autosnippets
-- ]
local ls = require 'luasnip'
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
local fmta = require('luasnip.extras.fmt').fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local autosnippet = ls.extend_decorator.apply(s, { snippetType = "autosnippet" })

-- local function env(name)
--     local x, y = unpack(vim.api.nvim_eval("vimtex#env#is_inside('" .. name .. "')"))
--     return x ~= 0 and y ~= 0
-- end

-- local function add_item()
--     local current_line = vim.api.nvim_get_current_line()
--
--     if current_line:match '^%s*$' == nil then --if line is not empty (not only contains whitespace chars)
--         return '- '
--     end
--
--     if env 'itemize' or env 'enumerate' then
--         return true
--     else
--         return false
--     end
-- end
--
-- local function add_item_in_description()
--     local current_line = vim.api.nvim_get_current_line()
--
--     if current_line:match '^%s*$' == nil then --if line is not empty (not only contains whitespace chars)
--         return '- '
--     end
--
--     if env 'description' then
--         return true
--     else
--         return false
--     end
-- end

-- local function add_item()
--     print 'checking item'
--     if is_cursor_in_environment 'itemize' or is_cursor_in_environment 'enumerate' then
--         print 'in env'
--         return '\\item '
--     elseif is_cursor_in_environment 'description' then
--         print 'in desc'
--         return fmta(
--             [[
--              \item[<>]
--             ]],
--             {
--                 i(1),
--             }
--         )
--     else
--         return '- '
--     end
-- end

return {
    s({ trig = '§', snippetType = 'autosnippet' }, {
        t '\\',
    }),

    s({ trig = '°', snippetType = 'autosnippet' }, {
        t '#',
    }),

    s({ trig = '-->', snippetType = 'autosnippet' }, {
        t '$\\rightarrow$',
    }),

    s(
        { trig = 'tbf', snippetType = 'autosnippet' },
        fmta(
            [[
             \textbf{<>}
            ]],
            {
                i(1),
            }
        )
    ),

    s(
        { trig = 'tit ', snippetType = 'autosnippet' },
        fmta(
            [[
             \textit{<>}
            ]],
            {
                i(1),
            }
        )
    ),

    -- s({ trig = '- ', snippetType = 'autosnippet', condition = add_item }, {
    --     t '\\item ',
    -- }),
    --
    -- s(
    --     { trig = 'tbf', snippetType = 'autosnippet', condition = add_item_in_description },
    --     fmta(
    --         [[
    --          \item[<>]
    --         ]],
    --         {
    --             i(1),
    --         }
    --     )
    -- ),
}
