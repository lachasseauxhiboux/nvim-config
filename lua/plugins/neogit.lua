local neogit = require('neogit')

neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
  -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
  auto_refresh = true,
  -- Value used for `--sort` option for `git branch` command
  -- By default, branches will be sorted by commit date descending
  -- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
  -- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
  sort_branches = "-committerdate",
  disable_builtin_notifications = false,
  -- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example
  -- below will use the native fzf sorter instead.
  telescope_sorter = function()
    return require("telescope").extensions.fzf.native_fzf_sorter()
  end,
  use_magit_keybindings = false,
  -- Change the default way of opening neogit
  kind = "tab",
  -- The time after which an output console is shown for slow running commands
  console_timeout = 2000,
  -- Automatically show console if a command takes more than console_timeout milliseconds
  auto_show_console = true,
  -- Persist the values of switches/options within and across sessions
  remember_settings = true,
  -- Scope persisted settings on a per-project basis
  use_per_project_settings = true,
  -- Array-like table of settings to never persist. Uses format "Filetype--cli-value"
  --   ie: `{ "NeogitCommitPopup--author", "NeogitCommitPopup--no-verify" }`
  ignored_settings = {},
  -- Change the default way of opening the commit popup
  commit_popup = {
    kind = "split",
  },
  -- Change the default way of opening the preview buffer
  preview_buffer = {
    kind = "split",
  },
  -- Change the default way of opening popups
  popup = {
    kind = "split",
  },
  -- This line enables the 'pull request' popup
  pull = {
      -- The popup will be shown in 'rebase' mode by default
      -- If you want to always show the popup in 'merge' mode, set this to 'pull.mode'
      mode = 'rebase.mode'
  },
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  -- Each Integration is auto-detected through plugin presence. Disabled by setting to `false`
  integrations = {
    -- If enabled, use telescope for menu selection rather than vim.ui.select.
    -- Allows multi-select and some things that vim.ui.select doesn't.

    github = {
            -- The name of the remote you want to create PRs on (defaults to 'origin')
            remote = 'origin'
        }
  },
  -- Setting any section to `false` will make the section not render at all
  sections = {
    untracked = {
      folded = false
    },
    unstaged = {
      folded = false
    },
    staged = {
      folded = false
    },
    stashes = {
      folded = true
    },
    unpulled = {
      folded = true
    },
    unmerged = {
      folded = false
    },
    recent = {
      folded = true
    },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      -- ["<leader>bp"] = "BranchPopup",
      -- Removes the default mapping of "s"
      ["s"] = "",
      ...
    },
    -- Modify fuzzy-finder buffer mappings
    finder = {
      -- Binds <cr> to trigger select action
      ["<cr>"] = "select",
      ...
    }
  }
}
