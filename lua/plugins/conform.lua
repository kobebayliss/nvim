return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = false,
    },
    formatters_by_ft = {
      python = { "black" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
  },
}
