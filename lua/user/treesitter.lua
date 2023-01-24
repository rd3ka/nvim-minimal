local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
    return 
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {"lua","java","cpp","html","css"},
    ignore_install = {""},
    sync_install = false;

    highlight = {
                enable = true,
                disable = {""},
            },
            autopairs = {
                enable = true,
            },
            indent = { enable = true },
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },
})
