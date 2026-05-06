return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Python
    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })

    -- C++
    vim.lsp.config("clangd", {
      capabilities = capabilities,
    })

    -- enable servers
    vim.lsp.enable({
      "pyright",
      "clangd",
    })
  end,
}
