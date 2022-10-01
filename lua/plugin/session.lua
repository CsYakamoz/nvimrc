require("session_manager").setup({
	-- Define what to do when Neovim is started without arguments.
	-- Possible values: Disabled, CurrentDir, LastSession
	autoload_mode = require("session_manager.config").AutoloadMode.Disabled,

	-- Automatically save last session on exit and on session switch.
	autosave_last_session = false,
})
