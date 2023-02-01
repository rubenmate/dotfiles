-- [[ Colorscheme ]]
return {
  'navarasu/onedark.nvim', -- Theme inspired by Atom
  config = function()
    require('onedark').setup {
      style = 'dark',
    }
    require('onedark').load()
  end,
}
