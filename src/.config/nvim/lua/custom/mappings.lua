---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader><F3>"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add a breakpoint",
    },
    ["<leader><F4>"] = {
      "<cmd> DapContinue <CR>",
      "DAP Continue",
    }
  }
}

return M
