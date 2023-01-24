local fn = vim.fn

-- Auto installation of packer plugin manager
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim")
    vim.cmd([[packadd packer.nvim]])
end

-- protected call for error handling
local status_ok, packer = pcall(require,"packer")
if not status_ok then
    return
end

-- popup window 
packer.init( {
    display = {
        open_fn = function()
                return require("packer.util").float({ border = "rounded" })
            end,
        },
        git = {
                clone_timeout = 300,
        },
})

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    --colorscheme
    use "navarasu/onedark.nvim"
    --editor experience
    use "windwp/nvim-autopairs"
    use "nvim-treesitter/nvim-treesitter" --treesitter 
    use "RRethy/vim-illuminate" --highlight the same word
    use "lewis6991/impatient.nvim" --lazy load
    use "akinsho/toggleterm.nvim" --get a floating terminal
    use { "nvim-tree/nvim-tree.lua", 
        requires = {
            "nvim-tree/nvim-web-devicons"
        }
    }                              --file explorer
    use "nvim-lualine/lualine.nvim" --fancier statusline
end)
