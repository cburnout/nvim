local fn = vim.fn
local M = {}

M.Buffer = {}

function M.Buffer:new(buf)
  print(vim.bo)
--   buf.modifiable = vim.bo[buf.id].modifiable
--   buf.modified = vim.bo[buf.id].modified
--   buf.buftype = vim.bo[buf.id].buftype
-- 
--   buf.extension = fn.fnamemodify(buf.path, ":e")
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
  -- buf.filename = (buf.path and #buf.path > 0) and fn.fnamemodify(buf.path, ":p:t") or "[No Name]"

  self.__index = self
  return setmetatable(buf, self)
end

return M
