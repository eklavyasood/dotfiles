return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    alpha.setup(dashboard.config)

    dashboard.section.header.val = {
      [[  ／|_       ]],
    [[ (o o /      ]],
    [[  |.   ~.    ]],
    [[  じしf_,)ノ ]],
    }

    alpha.setup(dashboard.opts)
	end,
}
