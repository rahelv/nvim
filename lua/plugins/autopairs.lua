-- automatically create closing brackets when entering opening brackets
return {
    'windwp/nvim-autopairs',
    event = 'InsertEnter', --plugin only gets loaded when entering insert-mode
    config = true,
    --TODO: add <> to pairs and $$ for latex
}
