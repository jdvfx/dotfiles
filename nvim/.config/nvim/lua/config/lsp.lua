local nvim_lsp = require("lspconfig")

require'lspconfig'.pyright.setup{
  on_attach = function()
    print("TOT")
    --vim.keymap.set("n","K", vim.lsp.buf.hover, {buffer=0})

  end,
}


