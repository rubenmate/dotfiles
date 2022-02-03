local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	return
end

-- :LuaCacheClear:
-- Remove the loaded cache and delete the cache file. A new cache file will be created the next time you load Neovim.
-- :LuaCacheLog:
-- View log of impatient.
-- :LuaCacheProfile:
-- View profiling data.
impatient.enable_profile()
