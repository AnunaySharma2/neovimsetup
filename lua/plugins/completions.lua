return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"github/copilot.vim",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken", -- Optional; required only on MacOS/Linux
		opts = {
			prompts = {
				ExplainCode = {
					prompt = "Explain the selected code in detail.",
					description = "Provides a detailed explanation of the selected code snippet.",
				},
				DebugCode = {
					prompt = "Debug the following code and identify possible issues.",
					description = "Helps debug the selected code snippet.",
				},
			},
			mappings = {
				submit_prompt = {
					normal = "<Leader>cc", -- Trigger chat submission in normal mode
					insert = "<C-Enter>", -- Trigger chat submission in insert mode
				},
				open_chat = {
					normal = "<Leader>ci", -- Open chat window in normal mode
					insert = "<Leader>ci", -- Open chat window in insert mode
				},
				toggle_chat = {
					normal = "<Leader>ct", -- Toggle chat window in normal mode
					insert = "<Leader>ct", -- Toggle chat window in insert mode
				},
			},
			default_model = "claude-3.5-sonnet", -- Use GPT-4 optimized for coding
			default_agent = "copilot", -- Default agent
		},
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
