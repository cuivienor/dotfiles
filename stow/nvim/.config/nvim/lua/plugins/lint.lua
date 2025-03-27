return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- TODO: Move to a utilities place
		local function should_disable_markdown_lint()
			local excluded_base_path = vim.fn.expand("~/.local/share/nvim/gp/chats/")
			local current_file_path = vim.fn.expand("%:p") -- Get full path to current file

			return vim.startswith(current_file_path, excluded_base_path)
		end

		lint.linters_by_ft = {
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
			bash = { "shellcheck" },
			zsh = { "shellcheck" },
		}

		local markdownlint = require("lint").linters.markdownlint
		markdownlint.args = {
			"--disable",
			"MD013",
			"--",
		}

		-- Create autocommand which carries out the actual linting
		-- on the specified events.
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				if should_disable_markdown_lint() then
					lint.linters_by_ft.markdown = {}
				end
				require("lint").try_lint()
			end,
		})
	end,
}
