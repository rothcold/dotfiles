local result = {}
if vim.g.vscode then
  result = {
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    { "hrsh7th/nvim-cmp", enabled = false },
  }
end

return result