local function fg(name)
  local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name })
  local fgc = hl and hl.foreground
  return fgc and { fg = string.format("#%06x", fgc) } or nil
end

local function oil_dir()
  if vim.bo.filetype == "oil" then
    return require("oil").get_current_dir()
  end
  return ""
end

local COPILOT_ICON = " "

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  event = "VeryLazy",
  opts = function()
    local opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename', oil_dir, require('arrow.statusline').text_for_statusline_with_icons },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
    local colors = {
      [""] = fg("Special"),
      ["Normal"] = fg("Special"),
      ["Warning"] = fg("DiagnosticError"),
      ["InProgress"] = fg("DiagnosticWarn"),
    }
    table.insert(opts.sections.lualine_x, 2, {
      function()
        local status = require("copilot.api").status.data
        return COPILOT_ICON .. (status.message or "")
      end,
      cond = function()
        local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
        return ok and #clients > 0
      end,
      color = function()
        if not package.loaded["copilot"] then
          return
        end
        local status = require("copilot.api").status.data
        return colors[status.status] or colors[""]
      end,
    })
    return opts
  end,
}
