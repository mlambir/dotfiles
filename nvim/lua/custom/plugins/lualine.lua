local function oil_dir()
  if vim.bo.filetype == "oil" then
    return require("oil").get_current_dir()
  end
  return ""
end
return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  event = "VeryLazy",
  opts = function()
    local opts =  {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename', oil_dir },
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
        local icon = require("lazyvim.config").icons.kinds.Copilot
        local status = require("copilot.api").status.data
        return icon .. (status.message or "")
      end,
      cond = function()
        local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
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
