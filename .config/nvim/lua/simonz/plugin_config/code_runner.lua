return {
	"CRAG666/code_runner.nvim",
	dependencies = { "preservim/vimux" },
	opts = {
		mode = "vimux",
		filetype = {
			java = {
				"cd $dir &&",
				"javac $fileName &&",
				"java $fileNameWithoutExt",
			},
			python = {
				"echo \"if [ -d '.venv' ]; then",
				"poetry run python3 $dir/$fileName;",
				'else python3 $dir/$fileName; fi" | bash',
			},
			typescript = {
				"deno run",
			},
			rust = {
				"cargo run",
			},
			c = function(...)
				c_base = {
					"cd $dir &&",
					"gcc $fileName -o",
					"/tmp/$fileNameWithoutExt",
				}
				local c_exec = {
					"&& /tmp/$fileNameWithoutExt &&",
					"rm /tmp/$fileNameWithoutExt",
				}
				vim.ui.input({ prompt = "Add more args:" }, function(input)
					c_base[4] = input
					vim.print(vim.tbl_extend("force", c_base, c_exec))
					require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
				end)
			end,
		},
	},
}
