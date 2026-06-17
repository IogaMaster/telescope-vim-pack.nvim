local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
    error("Telescope is not installed!")
end
telescope.load_extension("vimpack")
