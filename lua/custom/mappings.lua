---@type MappingsTable
local M = {}

-- < Terminal
function ToggleTerminalOrientation()
  require("nvterm.terminal").toggle "horizontal"
end
-- > Terminal

-- < Debugging
function ToggleDebugUI()
  require("dapui").toggle()
end

function ToggleBreakpoint()
  require("dap").toggle_breakpoint()
end

function StartDebugging()
  require("dap").continue()
end

function StepOver()
  require("dap").step_over()
end
-- > Debugging

M.general = {
  n = { -- Normal mode
    ["<leader>w"] = { "<cmd>w<CR>", "Save" },
    ["\\"] = { "<cmd>:vsplit <CR> ", "Vertical split" },
    ["<C-\\>"] = { ToggleTerminalOrientation, "Open horizontal terminal" },
    ["<leader>du"] = { ToggleDebugUI, "Debug UI" },
    ["<leader>db"] = { ToggleBreakpoint, "Breakpoint" },
    ["<leader>ds"] = { StartDebugging, "Start" },
    ["<leader>dn"] = { StepOver, "Step Over"}
  },
  v = { -- View mode
    [">"] = { ">gv", "indent"},
  },
  t = { -- Terminal
    ["<C-\\>"] = { ToggleTerminalOrientation }
  }
}

-- more keybinds!

return M
