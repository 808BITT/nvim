return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "telescope-fzf-native.nvim", optional = true },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = "true",
    build = "make",
    lazy = "true",
  },
  { "jvgrootveld/telescope-zoxide", },
  { "crispgm/telescope-heading.nvim", },
  { "nvim-telescope/telescope-file-browser.nvim", },
}

