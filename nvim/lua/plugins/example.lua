-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
--if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- or if using mini.icons/mini.nvim
    dependencies = { "echasnovski/mini.icons" },
    opts = {}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
	    require("nvim-treesitter.configs").setup({
		    ensure_installed = { "elixir", "eex", "heex" },
		    highlight = { enable = true },
		    indent = { enable = true },
	    })
    end,
  },
}
