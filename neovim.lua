-- Solstice Nightwatch — Neovim theme for Omarchy (aether.nvim base16 engine).
-- Dark companion to Solstice Daylight. Follows Omarchy's stock `beta`-theme
-- contract so `theme-hotreload` can live-swap it: a real plugin spec + a STRING
-- opts.colorscheme resolvable by :colorscheme.
-- Palette: violet-black canvas, purple chrome, rose (#C96A8A) selection/accents;
-- "greens" are rose-purple (not sage) to stay on-family.
--
-- aether only sets Visual at load (from an internal `blue0`, not base02) and does
-- NOT re-clobber it, so we force the rose selection groups synchronously after
-- applying the scheme and on every future ColorScheme event (Omarchy live reload).
return {
	{
		"bjarneo/aether.nvim",
		name = "aether",
		priority = 1000,
		opts = {
			disable_italics = false,
			colors = {
				base00 = "#1A1A2E", -- bg: violet-black canvas
				base01 = "#2D2B44", -- chrome
				base02 = "#363450", -- cursorline (raised surface)
				base03 = "#8A8A9A", -- comments (muted)
				base04 = "#8A8A9A", -- dark fg
				base05 = "#EDEBE7", -- fg (cream ink)
				base06 = "#B4B0C0",
				base07 = "#454263",
				base08 = "#D44D4D", -- red
				base09 = "#C2591E", -- orange
				base0A = "#D4B04B", -- yellow
				base0B = "#9A7A9A", -- green (strings, rose-purple)
				base0C = "#6A9A9A", -- cyan
				base0D = "#5A7DB0", -- blue (functions)
				base0E = "#C96A8A", -- magenta (storage/cursor-word, rose)
				base0F = "#8B7355", -- brown
			},
		},
		config = function(_, opts)
			local rose, onrose = "#C96A8A", "#1A1A2E"
			local function force_selection()
				local hi = vim.api.nvim_set_hl
				hi(0, "Visual", { bg = rose, fg = onrose })
				hi(0, "VisualNOS", { bg = rose, fg = onrose })
				hi(0, "IncSearch", { bg = rose, fg = onrose, bold = true })
				hi(0, "MatchWord", { bg = rose, fg = onrose })
				hi(0, "MatchWordRef", { bg = rose, fg = onrose })
			end
			local grp = vim.api.nvim_create_augroup("solstice_nightwatch_selection", { clear = true })
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "aether",
				group = grp,
				callback = force_selection,
			})
			require("aether").setup(opts)
			vim.cmd.colorscheme("aether")
			force_selection()
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "aether",
		},
	},
}