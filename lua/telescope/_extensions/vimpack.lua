local telescope = require("telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local previewers = require("telescope.previewers")

local function get_plugins()
    local plugins = {}
    for _, item in pairs(vim.pack.get() or {}) do
        local spec = item.spec or {}
        if spec.name then
            table.insert(plugins, {
                name = spec.name,
                path = item.path or "",
                url  = spec.src or spec[1] or "",
            })
        end
    end
    return plugins
end

local function open_url(bufnr)
    local sel = action_state.get_selected_entry()
    actions.close(bufnr)
    if sel and sel.value.url ~= "" then
        vim.ui.open(sel.value.url)
    else
        vim.notify("No URL found for this plugin.", vim.log.levels.WARN)
    end
end

local function update_selected(bufnr)
    local multi = action_state.get_current_picker(bufnr):get_multi_selection()
    if #multi > 0 then
        vim.pack.update(vim.tbl_map(function(e) return e.value.name end, multi))
    else
        local sel = action_state.get_selected_entry()
        if sel then vim.pack.update({ sel.value.name }, { force = true }) end
    end
end

local function update_all(bufnr)
    actions.close(bufnr)
    vim.pack.update()
end

local function make_previewer()
    return previewers.new_buffer_previewer({
        title = "README",
        define_preview = function(self, entry)
            local path = entry.value.path
            if path == "" then
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, { "No path available." })
                return
            end

            local readme
            for _, name in ipairs({ "README.md", "readme.md", "README.txt" }) do
                local candidate = path .. "/" .. name
                if vim.fn.filereadable(candidate) == 1 then
                    readme = candidate
                    break
                end
            end

            if readme then
                conf.buffer_previewer_maker(readme, self.state.bufnr, {
                    bufname       = self.state.bufname,
                    winid         = self.state.winid,
                    filetype_hook = function(_, bufnr)
                        vim.bo[bufnr].filetype = "markdown"
                        local ok, render_md = pcall(require, "render-markdown.core.ui")
                        if ok then render_md.update(bufnr, self.state.winid, "Telescope", true) end
                        return true
                    end,
                })
            else
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, { "No README found." })
            end
        end,
    })
end

local function vimpack(opts)
    pickers.new({}, {
        prompt_title    = "Vimpack Plugins",
        initial_mode    = "normal",
        finder          = finders.new_table({
            results = get_plugins(),
            entry_maker = function(p)
                return { value = p, display = p.name, ordinal = p.name }
            end,
        }),
        sorter          = conf.generic_sorter(opts),
        previewer       = make_previewer(),
        attach_mappings = function(bufnr, map)
            actions.select_default:replace(function() open_url(bufnr) end)
            map("n", "u", function() update_selected(bufnr) end)
            map("i", "<C-u>", function() update_selected(bufnr) end)
            map("n", "U", function() update_all(bufnr) end)
            return true
        end,
    }):find()
end

return require("telescope").register_extension({
    exports = {
        vimpack = vimpack,
    },
})
