require("nvchad.configs.lspconfig").defaults()

vim.lsp.config.clangd = {
  cmd = {
    'clangd',
    '--clang-tidy',
    '--background-index',
    '--offset-encoding=utf-8',
  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}
-- Configuration YAML / Kubernetes
vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      validate = true,
      completion = true,
      hover = true,
      schemaStore = {
        enable = true,
      },
    },
  },
})

-- Configuration Helm
vim.lsp.config("helm_ls", {
  settings = {
    ["helm-ls"] = {
      yamlls = {
        enabled = true,
      },
    },
  },
})

local servers = { "html", "cssls", "clangd", "pyright", "ts_ls", "yamlls", "helm_ls" }
vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
