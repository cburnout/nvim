--[[
-- Most if not all of this is inspired by akinsho/nvim-bufferline
-- Don't read this go look at theirs on github its this but much better
-- I didn't use my fork of it because I couldn't get the moving parts to
-- work as good as I'd like doing that way so im just a vuluture.
-- Thanks akinsho for the good plugin to look at
--]]
-- local buffert = require'plugins.tabline.buffer'
local fn = vim.fn
Buffer = {}

function Buffer:new(buf)
  print(vim.bo)
  buf.modifiable = vim.bo[buf.id].modifiable
  buf.modified = vim.bo[buf.id].modified
  buf.buftype = vim.bo[buf.id].buftype

  buf.extension = fn.fnamemodify(buf.path, ":e")
  -- Set icon
  -- if buffer_is_terminal(buf) then
  --   buf.icon = terminal_icon
  --   buf.filename = fn.fnamemodify(buf.path, ":p:t")
  -- else
  --   if lua_devicons_loaded then
  --     buf.icon, buf.icon_highlight =
  --       webdev_icons.get_icon(buf.path, buf.extension, {default = true})
  --   else
  --     local devicons_loaded = fn.exists("*WebDevIconsGetFileTypeSymbol") > 0
  --     buf.icon = devicons_loaded and fn.WebDevIconsGetFileTypeSymbol(buf.path) or ""
  --   end
  --   -- TODO: allow the format specifier to be configured
  -- end
  buf.filename = (buf.path and #buf.path > 0) and fn.fnamemodify(buf.path, ":p:t") or "[No Name]"

  self.__index = self
  return setmetatable(buf, self)
end

local function is_valid(buf_name)
  if not buf_name or buf_name < 1 then
    return false
  end
  local listed = vim.fn.getbufvar(buf_name, "&buflisted") == 1
  local exists = vim.api.nvim_buf_is_valid(buf_name)
  return listed and exists
end

local function create_local_buffers(bufs)
  local open_bufs = {}
  local i = 0
  for _, buf in ipairs(bufs) do
    if is_valid(buf) then
      i = i + 1
      open_bufs[i] = buf
    end
  end
  return open_bufs
end

local function get_open_buffers()
  local bufs = vim.api.nvim_list_bufs()
  local open_bufs = create_local_buffers(bufs)
  return open_bufs
end

local function generate(is_active_tab, tab)

end

function my_tabline()
  local tabinfo = vim.fn.gettabinfo()
  local current_tab = vim.fn.tabpagenr()
  -- local tabs = vim.fn.tabs()
  local open_bufs = get_open_buffers()
  local s = " "
  local to_process = {}
  local to_return = s
  local sep_full = ""
  local sep_line = ""
  for i, b_id in pairs(open_bufs) do
    print(i, b_id)
    local name = vim.fn.bufname(b_id)
    to_process[i] = {
      Buffer:new {
        path = name,
        id = b_id,
        ordinal = i,
      }
    }
    to_return = to_return .. name .. sep_line .. s
  end
  -- for i, tab in pairs(tabinfo) do
  --   local tab_position
  --   if tab.tabnr < current_tab then
  --     tab_position = -1
  --   elseif tab.tabnr == current_tab then
  --     tab_position = 0
  --   else
  --     tab_position = 1
  --   end
  --   local comp, length = generate()
  --   -- print(name, tab, i)
  --   -- to_process[i] = {
  --   --   Buffer:new {
  --   --     path = name,
  --   --     id = tab,
  --   --     ordinal = i,
  --   --   }
  --   -- }
  --   print(tab_position)
  -- end
  -- print(vim.fn.bufname())
  return to_return
end

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.my_tabline()"
