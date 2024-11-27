-- catppuccin
-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
--   priority = 1000,
--   config = function ()
--     require("catppuccin").setup({
--       flavour = "mocha",
--       background = {
--         light = "latte",
--         dark = "mocha",
--       },
--       vim.cmd.colorscheme "catppuccin"
--     })
--   end
-- }

-- kanagawa
-- return {
-- 	"rebelot/kanagawa.nvim",
--   config = function()
--     complie = false
--     theme = "dragon"
--     vim.cmd.colorscheme "kanagawa"
--   end
-- }

-- oxocarbon
return {
  "EdenEast/nightfox.nvim";
  colorscheme = 'carbonfox';
  -- "nyoom-engineering/oxocarbon.nvim"
  -- Add in any other configuration; 
  --   event = foo, 
  --   config = bar
  --   end,
}
