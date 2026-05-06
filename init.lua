vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  }
})
vim.cmd("colorscheme kanagawa")
-- Leader key


-- Run current file
vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%")
  local filetype = vim.bo.filetype

  local cmd = ""

  if filetype == "cpp" then
    cmd = "g++ " .. file .. " -o /tmp/a.out && /tmp/a.out"
  elseif filetype == "c" then
    cmd = "gcc " .. file .. " -o /tmp/a.out && /tmp/a.out"
  elseif filetype == "python" then
    cmd = "python3 " .. file
  elseif filetype == "javascript" then
    cmd = "node " .. file
  elseif filetype == "sh" then
    cmd = "bash " .. file
  else
    print("No runner for filetype: " .. filetype)
    return
  end

  vim.cmd("split | terminal " .. cmd)
end, { desc = "Run current file" })

vim.opt.clipboard = "unnamedplus"

