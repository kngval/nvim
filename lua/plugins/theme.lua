return {

	--   "catppuccin/nvim",
	-- lazy = false,
	-- priority = 1000,
	-- config = function()
	--   require("catppuccin").setup({
	--   })
	--   vim.cmd.colorscheme "catppuccin-mocha"
	-- end

	"EdenEast/nightfox.nvim",
	config = function()
		-- Load the duskfox variant
		require("nightfox").setup({
			options = {
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		})
		vim.cmd("colorscheme duskfox")
	end,
}
