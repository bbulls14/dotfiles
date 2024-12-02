return {
	-- Auto save and restore session
	-- github.com/rmagatti/auto-session
	{
		"git@github.com:rmagatti/auto-session.git",
		lazy = false,
		---enables autocomplete for opts
		---@module "auto-sessin"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		},
	}
}
