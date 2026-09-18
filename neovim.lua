-- Solstice Nightwatch — Neovim theme for Omarchy (aether.nvim base16 engine).
-- Dark companion to Solstice Daylight. Follows Omarchy's stock `beta`-theme
-- contract so `theme-hotreload` can live-swap it: a real plugin spec, a STRING
-- opts.colorscheme, and aether.hotreload wired to Omarchy's LazyReload event.
-- Palette: violet-black canvas, purple chrome, rose (#C96A8A) selection +
-- keyword/storage accents. "Greens" are rose-purple (not sage) to stay on-family.
return {
	{
		"bjarneo/aether.nvim",
		name = "aether",
		priority = 1000,
		opts = {
			disable_italics = false,
			colors = {
				base00 = "#1A1A2E", -- bg: violet-black canvas
				base01 = "#2D2B44", -- status / strong surfaces (chrome)
				base02 = "#C96A8A", -- SELECTION background (rose)
				base03 = "#8A8A9A", -- comments / invisibles (muted)
				base04 = "#8A8A9A", -- dark foreground (muted)
				base05 = "#EDEBE7", -- default foreground (cream ink)
				base06 = "#B4B0C0", -- light foreground
				base07 = "#363450", -- light background (raised surface)

				base08 = "#D44D4D", -- red: variables / errors
				base09 = "#C2591E", -- orange: integers / constants
				base0A = "#D4B04B", -- yellow: classes / types
				base0B = "#9A7A9A", -- green: strings (rose-purple)
				base0C = "#6A9A9A", -- cyan: support / regex
				base0D = "#5A7DB0", -- blue: functions / keywords
				base0E = "#C96A8A", -- magenta: storage / cursor-word (rose)
				base0F = "#8B7355", -- brown: deprecated
			},
		},
		config = function(_, opts)
			require("aether").setup(opts)
			vim.cmd.colorscheme("aether")
			require("aether.hotreload").setup()
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "aether",
		},
	},
}