vim.pack.add({'https://github.com/MeanderingProgrammer/render-markdown.nvim'})

require('render-markdown').setup({
  checkbox = {
    custom = {
      todo = { raw = '[>]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
      declined = { raw = '[-]', rendered = '󰜺 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
    },
  },
})
