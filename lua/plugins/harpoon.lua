return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end)

    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    -- delete current file
    vim.keymap.set("n", "<leader>dd", function()
      harpoon:list():remove()
    end)

    -- jump keys
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

    -- 🗑️ TRASH MODE (inside menu)
    local function trash_item()
      local list = harpoon:list()
      local idx = list._index or 1
      list:remove_at(idx)
    end

    -- override menu keymap
    vim.keymap.set("n", "<leader>h", function()
      local list = harpoon:list()

      harpoon.ui:toggle_quick_menu(list)

      -- add keybind while menu is open
      vim.schedule(function()
        vim.keymap.set("n", "d", function()
          list:remove_at(list._index or 1)
        end, { buffer = true, silent = true })

        vim.keymap.set("n", "x", function()
          list:remove_at(list._index or 1)
        end, { buffer = true, silent = true })
      end)
    end)
  end,
}
