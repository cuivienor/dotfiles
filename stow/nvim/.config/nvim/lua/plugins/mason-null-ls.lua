return {
	"jay-babu/mason-null-ls.nvim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = nil,
			automatic_installation = true,
		})
	end,
}
