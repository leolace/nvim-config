local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#191919',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.grey, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.grey },
    x = { fg = colors.violet, bg = colors.grey }
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },
  inactive = {
    a = { fg = colors.white, bg = colors.grey },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.grey },
  },
}

local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return ""
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

local function display_emoji()
  return "🤓"
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', "nvim-lualine/lualine.nvim", opt = true },
  config = function()
    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        background = "#fff"
      },
      sections = {
        lualine_a = { { 'mode' }, { "fileformat" } },
        lualine_b = {
          { display_emoji },
          {
            'filename',
            symbols = {
              modified = " "
            },
          },
        },
        lualine_c = { { "diagnostics" } },
        lualine_x = {
          "branch"
        },
        lualine_y = {
          {
            "diff",
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            padding = 2
          },
          { 'filetype',  padding = { right = 2 } },
          { lsp_progress }
        },
        lualine_z = {
          'location',
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end
}
