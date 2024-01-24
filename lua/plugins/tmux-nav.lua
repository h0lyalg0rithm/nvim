return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd><C-B>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-B>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-B>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-B>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-B>TmuxNavigatePrevious<cr>" },
  }
}
