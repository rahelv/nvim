-- automatically create closing brackets when entering opening brackets 
return {
    'windwp/nvim-autopairs',
    event = "InsertEnter", --plugin only gets loaded when entering insert-mode
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
}
