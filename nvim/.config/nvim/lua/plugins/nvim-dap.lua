return {
  -- 安装 nvim-dap
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      -- 基础配置可以留空，metals 会自动配置
    end,
  },
}
