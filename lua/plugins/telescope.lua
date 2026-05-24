return {
  "nvim-telescope/telescope.nvim", version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      -- faster fuzzy sorting 
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          -- show available keymaps while inside a picker (default: <C-/>)
          ["<C-h>"] = "which_key",
        },
      },
    },
    pickers = {
      -- configure individual pickers here, for example:
      -- find_files = { hidden = true }
    },
    extensions = {
      -- extensions are configured here but fzf is loaded below in config
      -- because load_extension() must be called after setup()
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    -- activate the fzf sorter for faster fuzzy matching
    require("telescope").load_extension("fzf")
  end,
  keys = {
    -- Finding things
    { "<leader>ff", "<cmd>Telescope find_files<cr>",  desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",   desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",   desc = "Help Tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",    desc = "Recent Files" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Grep String (cursor)" },
    -- Git
    { "<leader>gc", "<cmd>Telescope git_commits<cr>",  desc = "Git Commits" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>",   desc = "Git Status" },
    -- Neovim meta
    { "<leader>fk", "<cmd>Telescope keymaps<cr>",     desc = "Keymaps" },
    { "<leader>fc", "<cmd>Telescope commands<cr>",    desc = "Commands" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>fo", "<cmd>Telescope vim_options<cr>", desc = "Vim Options" },
  },
}
