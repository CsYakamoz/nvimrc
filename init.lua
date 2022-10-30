-- Reference List
-- - LunarVim/Neovim-from-scratch
-- - https://github.com/jdhao/nvim-config
-- - https://github.com/kevinhwang91/dotfiles

require("user.gloabl")
require("user.option")
require("user.abbr")
require("user.autocmd")
require("user.keymap")

require("user.plugin")

local ok, _ = pcall(require, "user.colorscheme.color")
if not ok then
	print("user/colorscheme/color.lua is not exist")
end

require("user.input-method")
require("user.move_tab")
