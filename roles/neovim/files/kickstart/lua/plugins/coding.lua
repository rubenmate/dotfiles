return {
  {
    'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
    branch = 'jsx', -- branch for jsx comments https://github.com/numToStr/Comment.nvim
    config = function ()
      require('Comment').setup({
        pre_hook = function(ctx)
            return require('Comment.jsx').calculate(ctx)
        end,
      })
    end
  },
}
