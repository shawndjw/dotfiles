return {
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        dir_path = function()
          return vim.fn.expand("%:p:h") .. "/assets/"
        end,
        file_name = "%Y-%m-%d-%H-%M-%S",
      },
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
    },
  },
  {
    "3rd/image.nvim",
    opts = {},
    rocks = {
      hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
    },
  },
}
