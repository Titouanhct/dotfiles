require "nvchad.autocmds"

-- Détection automatique des templates Helm
vim.filetype.add({
  pattern = {
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
  },
})
