-- herdr-nvim: comment code and send the comments to an agent in the Herdr app.
-- The plugin is only on the runtimepath in the nvim the Herdr sidebar starts, so
-- this is a no-op everywhere else. Its default prefix <leader>a clashes with
-- CodeCompanion (<leader>ac, <leader>ai in ai.lua).
--   <leader>cc  comment line / selection    <leader>cl  list comments
--   <leader>cs  paste comments to agent     <leader>cS  send (submit) to agent
--   <leader>ci  reference line / selection at the agent's cursor
local ok, herdr = pcall(require, "herdr-nvim")
if ok then
	herdr.setup({ prefix = "<leader>c" })
end
