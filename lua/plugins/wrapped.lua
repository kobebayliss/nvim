return {
  "aikhe/wrapped.nvim",
  cmd = { "WrappedNvim" },
  dependencies = {
    "nvzone/volt",
  },
  opts = {
    path = vim.fn.stdpath("config"),
    nvim_root = "",
    border = false,
    size = {
      width = 120,
      height = 40,
    },
    exclude_filetype = {
      ".gitmodules",
    },
    cap = {
      commits = 1000,
      plugins = 100,
      plugins_ever = 200,
      lines = 10000,
    },
    keys = {
      close = "q",
      refresh = "r",
      prev_year = "<",
      next_year = ">",
    },
  },
}
