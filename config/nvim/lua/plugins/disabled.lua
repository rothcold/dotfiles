local result = {}
if vim.g.vscode then
  result = {
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
  }
end

return result
