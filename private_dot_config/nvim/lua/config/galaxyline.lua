local cl = require 'colors'
local condition = require 'galaxyline.condition'
local devicons = require 'nvim-web-devicons'
local fileinfo = require 'galaxyline.provider_fileinfo'
local gl = require 'galaxyline'
local nonicons = require "nvim-nonicons"
local utils = require 'utils'

local gls = gl.section
local u = utils.u

local mode_map = {
    ['n'] = {'NORMAL', cl.nord14},
    ['i'] = {'INSERT', cl.nord9},
    ['R'] = {'REPLACE', cl.nord11},
    ['v'] = {'VISUAL', cl.nord13},
    ['V'] = {'V-LINE', cl.nord13},
    ['c'] = {'COMMAND', cl.nord12},
    ['s'] = {'SELECT', cl.nord13},
    ['S'] = {'S-LINE', cl.nord13},
    ['t'] = {'TERMINAL', cl.nord7},
    [''] = {'V-BLOCK', cl.nord13},
    [''] = {'S-BLOCK', cl.nord13},
    ['Rv'] = {'VIRTUAL'},
    ['rm'] = {'--MORE'},
}

local icons = {
    locker = '',
    unsaved = '',
    dos = u 'e70f',
    unix = u 'f17c',
    mac = u 'f179',
    lsp_warn = '',
    lsp_error = '',
}

local sep = {
    left_filled = '',
    right_filled = '',
    left = '',
    right = '',
}

local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end
local function mode_hl() return mode_map[vim.fn.mode()][2] or cl.none end

local function highlight(group, fg, bg, gui)
    local cmd = string.format('highlight %s guifg=%s guibg=%s', group, fg, bg)
    if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
    vim.cmd(cmd)
end

gl.short_line_list = {'NvimTree', 'minimap', 'vista', 'dbui'}

gls.left = {
    {
	ViMode = {
            provider = function()
                local modehl = mode_hl()
                highlight('GalaxyViMode', cl.nord2, modehl, 'bold')
                highlight('GalaxyViModeInv', modehl, cl.nord2, 'bold')
                return string.format('  %s ', mode_label())
            end,
            separator = sep.left_filled,
            separator_highlight = 'GalaxyViModeInv',
        }	
    },
    {
	FileIcon = {
            provider = function()
                local fname, ext = vim.fn.expand '%:t', vim.fn.expand '%:e'
                local icon, iconhl = devicons.get_icon(fname, ext)
                if icon == nil then return '' end
                local fg = vim.fn.synIDattr(vim.fn.hlID(iconhl), 'fg')
                highlight('GalaxyFileIcon', fg, cl.nord2)
                return ' ' .. icon .. ' '
            end,
            condition = condition.buffer_not_empty,
        }
    },
    {
	FileName = {
            provider = {'FileName','FileSize'}, 
	    highlight = {cl.nord4, cl.nord2},
            separator = sep.left,
            separator_highlight = 'GalaxyViModeInv',
        }
    },
    {
	GitIcon = {
	    provider = function() return '  ' end,
	    condition = condition.check_git_workspace,
	    separator = '',
	    separator_highlight = {'NONE', cl.nord2},
	    highlight = {cl.nord12,cl.nord2, 'bold'},
	}
    },
    {
	GitBranch = {
	    provider = 'GitBranch',
	    condition = condition.check_git_workspace,
	    highlight = {cl.nord12, cl.nord2, 'bold'},
	},
    },
    {
	DiffAdd = {
	    provider = 'DiffAdd',
	    condition = condition.hide_in_width,
	    icon = '',
	    highlight = {cl.nord14, cl.nord2},
	},
    },
    {
	DiffModified = {
	    provider = 'DiffModified',
	    condition = condition.hide_in_width,
	    icon = ' 柳',
	    highlight = {cl.nord12, cl.nord2},
	},
    },
    {
	DiffRemove = {
	    provider = 'DiffRemove',
	    condition = condition.hide_in_width,
	    icon = '  ',
	    highlight = {cl.nord11, cl.nord2},
	}
    }
}

gls.right = {
    {
	LspStatus = {
            provider = function()
                local connected =
		    not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
                if connected then
                    return ' ' .. '' .. ' '
                else
                    return ''
                end
            end,
            highlight = {cl.nord14, cl.nord2},
            separator = sep.right,
            separator_highlight = 'GalaxyViModeInv',
        }
    }, 
    {
        DiagnosticWarn = {
            provider = function()
                local n = vim.lsp.diagnostic.get_count(0, 'Warning')
                if n == 0 then return '' end
                return string.format(' %s %d ', icons.lsp_warn, n)
            end,
            highlight = {'yellow', cl.nord2},
        },
    },
    {
        DiagnosticError = {
            provider = function()
                local n = vim.lsp.diagnostic.get_count(0, 'Error')
                if n == 0 then return '' end
                return string.format(' %s %d ', icons.lsp_error, n)
            end,
            highlight = {'red', cl.nord2},
        }
    }, 
    {
        FileType = {
            provider = function()
                if not condition.buffer_not_empty then return '' end
                local icon = icons[vim.bo.fileformat] or ''
                return string.format(' %s %s ', icon, vim.bo.filetype)
            end,
            condition = condition.buffer_not_empty,
            highlight = {cl.nord4, cl.nord2},
            separator = sep.right,
            separator_highlight = 'GalaxyViModeInv',
	}
    }, 
    {
	PositionInfo = {
            provider = {
                function()
                    return string.format(
			'%s:%s', vim.fn.line('.'), vim.fn.col('.')
                    )
                end,
	    },
            highlight = 'GalaxyViMode',
            condition = condition.buffer_not_empty,
            separator = sep.right_filled,
            separator_highlight = 'GalaxyViModeInv',
        } 
    },
    {
	PercentInfo = {
            provider = fileinfo.current_line_percent,
            highlight = 'GalaxyViMode',
            condition = condition.buffer_not_empty,
            separator = sep.right,
            separator_highlight = 'GalaxyViMode',
	}

    }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = sep.left_filled,
    separator_highlight = {cl.nord15, cl.nord2},
    highlight = {cl.nord4, cl.nord15}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = sep.right_filled,
    separator_highlight = {cl.nord15, cl.nord2},
    highlight = {cl.nord4, cl.nord15}
  }
}
