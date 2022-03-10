local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

-- Keymaps
-- Keymap is gc and gcc, gc works waiting for input (number and direction)
-- gcc works comment that line or block of code
comment.setup {
	---Add a space b/w comment and the line
	---@type boolean
	padding = true,

	---Whether the cursor should stay at its position
	---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
	---@type boolean
	sticky = true,

	---Lines to be ignored while comment/uncomment.
	---Could be a regex string or a function that returns a regex string.
	---Example: Use '^$' to ignore empty lines
	---@type string|fun():string
	ignore = nil,

	---LHS of toggle mappings in NORMAL + VISUAL mode
	---@type table
	toggler = {
		---Line-comment toggle keymap
		line = "gcc",
		---Block-comment toggle keymap
		block = "gbc",
	},

	---LHS of operator-pending mappings in NORMAL + VISUAL mode
	---@type table
	opleader = {
		---Line-comment keymap
		line = "gc",
		---Block-comment keymap
		block = "gb",
	},

	---LHS of extra mappings
	---@type table
	extra = {
		---Add comment on the line above
		above = "gcO",
		---Add comment on the line below
		below = "gco",
		---Add comment at the end of line
		eol = "gcA",
		---Not here, but Neogen keymap for documenting somethins is gcd
	},

	---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
	---@type table
	mappings = {
		---Operator-pending mapping
		---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
		---Includes:
		--  `gcc`               -> line-comment the current line
		--  `gbc`               -> block-comment the current line
		--  `gc[count]{motion}` -> line-comment the region contained in {motion}
		--  `gb[count]{motion}` -> block-comment the region contained in {motion}
		basic = true,

		---Extra mapping
		---Includes `gco`, `gcO`, `gcA`
		extra = true,

		---Extended mapping
		---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
		extended = false,
	},

	---Pre-hook, called before commenting the line
	pre_hook = function(ctx)
		local U = require "Comment.utils"

		local location = nil
		if ctx.ctype == U.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring {
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		}
	end,

	---Post-hook, called after commenting is done
	post_hook = nil,
}

-- This is an example to add different comments for some specific filetype
local comment_ft = require "Comment.ft"
comment_ft.set("lua", { "--%s", "--[[%s]]" })
