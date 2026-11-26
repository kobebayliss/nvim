return {
  "ThePrimeagen/vim-be-good",
  cmd = "VimBeGood",
  config = function()
    -- Match the global j/k swap in init.lua. Most games use normal motions
    -- (so the global maps already apply), but snake binds j/k itself.
    local dirs = require("vim-be-good.games.snakelib.const").KeyDirMap
    dirs.j, dirs.k = dirs.k, dirs.j
  end,
}
