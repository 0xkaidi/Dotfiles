-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.v",
  callback = function()
    vim.bo.filetype = "verilog"
  end,
})
-- 去除尾空格并转换制表符的自动命令
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.v",
  callback = function()
    -- 保存光标位置
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- 去除行尾空格
    vim.cmd([[%s/\s\+$//e]])

    -- 如果设置 expandtab 则转换制表符为空格
    if vim.bo.expandtab then
      local ts = vim.bo.tabstop
      vim.cmd("retab!")
      -- 对于部分 Verilog 文件需要强制设置缩进值
      if vim.bo.filetype:match("verilog") then
        vim.bo.shiftwidth = ts
      end
    end

    -- 恢复光标位置
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
})
