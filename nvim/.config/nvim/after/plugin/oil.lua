vim.keymap.set("n", "-", "<cmd>Oil<CR>")

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "oil://*",
  once = true, -- <— runs this callback only once
  callback = function()
    local dir = require("oil").get_current_dir()
    if dir then
      vim.cmd("silent! lcd " .. vim.fn.fnameescape(dir))
    end
  end,
})
