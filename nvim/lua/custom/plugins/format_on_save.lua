return {
  "elentok/format-on-save.nvim",
  config = function()
    local format_on_save = require("format-on-save")
    local formatters = require("format-on-save.formatters")

    format_on_save.setup({
      exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
      },
      formatter_by_ft = {
        -- in one of the parent directories.
        javascript = {
          formatters.if_file_exists({
            pattern = ".eslintrc.*",
            formatter = formatters.eslint_d_fix
          }),
          formatters.if_file_exists({
            pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
            formatter = formatters.prettierd,
          }),
          formatters.lsp,
        },
      },

      -- Optional: fallback formatter to use when no formatters match the current filetype
      fallback_formatter = {
        formatters.lsp,
      },

      -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
      -- To prevent that set `run_with_sh` to `false`.
      run_with_sh = false,
    })
  end
}
