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
vim.g.theme = "kanagawa"

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

vim.lsp.config("clangd", {
  cmd = { "clangd", "--compile-commands-dir=build" },
})

vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = make_transparent,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.bo.cindent = true
    vim.bo.smartindent = false
    vim.bo.indentexpr = ""
  end,
})

vim.keymap.set({ "n", "v", "o" }, "j", "k", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "k", "j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>n", "<C-w>w", {
    desc = "Cycle windows",
})
vim.opt.cindent = true
vim.opt.smartindent = false
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.number = true

-- run file (cross-platform)
vim.keymap.set("n", "<leader>r", function()
  local file = vim.fn.expand("%:p")
  local ft = vim.bo.filetype
  local cmd = ""

  -- cross-platform output path
  local is_windows = vim.loop.os_uname().sysname:match("Windows")
  local outdir = vim.fn.stdpath("data")

  local exe = is_windows and (outdir .. "\\a.exe") or (outdir .. "/a.out")
  if ft == "cpp" then
    local root = vim.fs.dirname(vim.fs.find("CMakeLists.txt", { upward = true })[1])
    local project = vim.fn.fnamemodify(root, ":t")
    cmd = "cd " .. root .. " && cmake --build build >/dev/null && ./build/" .. project
    
  elseif ft == "c" then
    cmd = 'gcc "' .. file .. '" -o "' .. exe .. '" && "' .. exe .. '"'

  elseif ft == "python" then
    cmd = "python3 \"" .. file .. "\""

  elseif ft == "javascript" then
    cmd = "node \"" .. file .. "\""

  elseif ft == "sh" then
    cmd = "bash \"" .. file .. "\""

  else
    print("No runner: " .. ft)
    return
  end

  vim.cmd("split | terminal " .. cmd)
end)
