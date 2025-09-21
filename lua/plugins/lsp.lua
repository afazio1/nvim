return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- custom hover
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = "single" }
    )

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_keymaps = function(_, bufnr)
      local opts = { buffer = bufnr }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, opts)
      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float(nil, {focusable = false, scope = "line", max_width = 80, border = "single"})
      end, opts)
    end
    
    vim.lsp.config("clangd", {
      capabilities = capabilities,
      on_attach = lsp_keymaps,
      cmd = { "clangd", "--compile-commands-dir=build" },
      root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
    })

    vim.lsp.config("gopls", {
      capabilities = capabilities,
      on_attach = lsp_keymaps,
    })

    vim.lsp.config("pyright", {
      capabilities = capabilities,
      on_attach = lsp_keymaps,
    })

  end,
}
