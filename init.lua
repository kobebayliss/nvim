vim.g.mapleader = " "

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup("plugins")

-- options
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

-- transparency (safe + persistent)
local function make_transparent()
  local groups = {
    "Normal",
    "NormalFloat",
    "SignColumn",
    "EndOfBuffer",
    "VertSplit",
    "StatusLine",
    "StatusLineNC",
    "WinSeparator",
  }

  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end
end

make_transparent()

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = make_transparent,
})

-- run file
vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%")
  local ft = vim.bo.filetype
  local cmd = ""

  if ft == "cpp" then
    cmd = "g++ " .. file .. " -o /tmp/a.out && /tmp/a.out"
  elseif ft == "c" then
    cmd = "gcc " .. file .. " -o /tmp/a.out && /tmp/a.out"
  elseif ft == "python" then
    cmd = "python3 " .. file
  elseif ft == "javascript" then
    cmd = "node " .. file
  elseif ft == "sh" then
    cmd = "bash " .. file
  else
    print("No runner: " .. ft)
    return
  end

  vim.cmd("split | terminal " .. cmd)
end)

