-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
function no_paste(reg)
  return function(lines)
    -- Do nothing! We can't paste with OSC52
  end
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = no_paste("+"), -- Pasting disabled
    ["*"] = no_paste("*"), -- Pasting disabled
  },
}
opts = function(_, opts)
  local icon = LazyVim.config.icons.kinds.TabNine
  table.insert(opts.sections.lualine_x, 2, LazyVim.lualine.cmp_source("cmp_tabnine", icon))
end
vim.g.autoformat = false
