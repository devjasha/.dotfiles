return {
  {
    "devjasha/noti-vim",
    cmd = {
      "NotiNew",
      "NotiList",
      "NotiSearch",
      "NotiTags",
      "NotiFolders",
      "NotiGitStatus",
      "NotiGitCommit",
      "NotiGitSync",
    },
    keys = {
      { "<leader>on", "<cmd>NotiNew<cr>", desc = "New Note" },
      { "<leader>ol", "<cmd>NotiList<cr>", desc = "List Notes" },
      { "<leader>os", "<cmd>NotiSearch ", desc = "Search Notes" },
      { "<leader>ot", "<cmd>NotiTags<cr>", desc = "Browse Tags" },
      { "<leader>of", "<cmd>NotiFolders<cr>", desc = "Browse Folders" },
      { "<leader>og", "<cmd>NotiGitStatus<cr>", desc = "Git Status" },
      { "<leader>oc", "<cmd>NotiGitCommit ", desc = "Git Commit" },
      { "<leader>op", "<cmd>NotiGitSync<cr>", desc = "Git Sync" },
    },
    init = function()
      -- Add ~/go/bin to PATH for Neovim
      local go_bin = vim.fn.expand("~/go/bin")
      vim.env.PATH = vim.env.PATH .. ":" .. go_bin

      -- Configuration
      vim.g.noti_notes_dir = vim.fn.expand("~/notes")
      vim.g.noti_default_folder = ""
      vim.g.noti_default_tags = {}
      vim.g.noti_git_auto_commit = 0

      -- Disable default mappings (we define them above)
      vim.g.noti_no_default_mappings = 0
    end,
  },
}
