-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
      { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
    },
  },
  {
    "mbbill/undotree",
    lazy = false,
    config = false,
    keys = {
      { "<leader>hu", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        eslint = {
          settings = {
            useFlatConfig = true, -- set if using flat config
            experimental = {
              useFlatConfig = nil, -- option not in the latest eslint-lsp
            },
          },
        },
        rust_analyzer = {
          mason = false,
          -- cmd = { vim.fn.expand("~/.rustup/toolchains/nightly-x87_64-unknown-linux-gnu/bin/rust-analyzer") },
          cmd = { vim.fn.expand("~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer") },
          settings = {
            ["rust-analyzer"] = {
              imports = {
                granularity = {
                  group = "module",
                },
                prefix = "self",
              },
              cargo = {
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
}
