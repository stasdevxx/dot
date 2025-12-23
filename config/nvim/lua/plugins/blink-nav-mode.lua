return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}

      -- Ctrl+j / Ctrl+k: navigate the completion menu when it is visible; otherwise fallback.
      opts.keymap["<C-j>"] = { "select_next", "fallback" }
      opts.keymap["<C-k>"] = { "select_prev", "fallback" }
      
      -- Ctrl+y: accept selected item
      opts.keymap["<C-y>"] = { "select_and_accept" }

      -- Ctrl+e: close the menu
      opts.keymap["<C-e>"] = { "hide", "fallback" }
    end,
  },
}
