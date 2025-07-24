require('config.lazy')

vim.api.nvim_create_autocmd({"BufEnter", "InsertLeave", "BufWritePost"}, {
   callback = function()
      local lint_status, lint = pcall(require, "lint")
      if lint_status then
         lint.try_lint()
      end
   end
})