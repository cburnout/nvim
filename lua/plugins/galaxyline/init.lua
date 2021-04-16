local gl = require('galaxyline')
local diagnostic = require('galaxyline.provider_diagnostic')
local condition = require('galaxyline.condition')
local gls = gl.section
local vcs = require('galaxyline.provider_vcs')
local lspclient = require('galaxyline.provider_lsp')
local fileinfo = require('galaxyline.provider_fileinfo')
gl.short_line_list = {'NvimTree', 'vista', 'dbui', 'packer'}

local colors = {
    bg = '#444444',
    yellow = '#DCDCAA',
    dark_yellow = '#D7BA7D',
    cyan = '#4EC9B0',
    mgold = '#CE9812',
    green = '#00ff58',
    light_green = '#B5CEA8',
    string_orange = '#CE9178',
    orange = '#FFAD00',
    purple = '#CF58CF',
    magenta = '#D16D9E',
    grey = '#C5C5CC',
    blue = '#569CD6',
    vivid_blue = '#4FC1FF',
    light_blue = '#9CDCFE',
    red = '#D16969',
    error_red = '#FF5040',
    info_yellow = '#FFCC66'
}

-- auto change color according the vim mode
local mode_color = {
    n = colors.blue,
    i = colors.mgold,
    v = colors.purple,
    [''] = colors.purple,
    V = colors.purple,
    c = colors.magenta,
    no = colors.blue,
    s = colors.orange,
    S = colors.orange,
    [''] = colors.orange,
    ic = colors.yellow,
    R = colors.red,
    Rv = colors.red,
    cv = colors.blue,
    ce = colors.blue,
    r = colors.cyan,
    rm = colors.cyan,
    ['r?'] = colors.cyan,
    ['!'] = colors.blue,
    t = colors.blue
}

local mode_names = {
    n = "  Normal ",
    i = "  Insert ",
    v = "  Visual ",
    [''] = "  V-Block",
    V = "  VISUAL ",
    R = "  Replace",
    c = "  Command"
}

gls.left[1] = {
    ViMode = {
        provider = function()
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. colors['bg'])
            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color[vim.fn.mode()])
            m = vim.fn.mode()
            name = mode_names[m]
            if name == nil then
                name = m
            end
            return name
        end,
        --highlight = {colors.red, colors.bg}
    }
}

gls.left[2] = {
    EndType = {
        provider = function()
            de = diagnostic.get_diagnostic_error()
            de = tonumber(de)
            dw = diagnostic.get_diagnostic_warn()
            dw = tonumber(dw)
            dh = diagnostic.get_diagnostic_hint()
            dh = tonumber(dh)
            di = diagnostic.get_diagnostic_info()
            di = tonumber(di)
            vim.api.nvim_command('hi GalaxyEndType guifg=' .. mode_color[vim.fn.mode()])
            if de == nil then
                return ""
            end
            vim.api.nvim_command('hi GalaxyEndType guibg=' .. colors.error_red)
            return " "
        end,
    }
}

gls.left[3] = {
    DiagnosticError = {provider = 'DiagnosticError', highlight = {colors.bg, colors.error_red}}
}
gls.left[4] = {
    EndTypeTwo = {
        provider = function()
            de = diagnostic.get_diagnostic_error()
            de = tonumber(de)
            dw = diagnostic.get_diagnostic_warn()
            dw = tonumber(dw)
            dh = diagnostic.get_diagnostic_hint()
            dh = tonumber(dh)
            di = diagnostic.get_diagnostic_info()
            di = tonumber(di)
            if dw == nil then
                return ""
            elseif de == nil then
                vim.api.nvim_command('hi GalaxyEndTypeTwo guifg=' .. mode_color[vim.fn.mode()])
            elseif de ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeTwo guifg=' .. colors.error_red)
            end
            vim.api.nvim_command('hi GalaxyEndTypeTwo guibg=' .. colors.orange)
            return " "
        end,
    }
}

gls.left[5] = {DiagnosticWarn = {provider = 'DiagnosticWarn', highlight = {colors.bg, colors.orange}}}
--gls.left[5] = {DiagnosticWarn = {provider = 'DiagnosticWarn', icon = '  ', highlight = {colors.bg, colors.orange}}}

gls.left[6] = {
    EndTypeThree = {
        provider = function()
            de = diagnostic.get_diagnostic_error()
            de = tonumber(de)
            dw = diagnostic.get_diagnostic_warn()
            dw = tonumber(dw)
            dh = diagnostic.get_diagnostic_hint()
            dh = tonumber(dh)
            di = diagnostic.get_diagnostic_info()
            di = tonumber(di)
            if dh == nil then
                return ""
            elseif dw ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeThree guifg=' .. colors.orange)
            elseif dw == nil and de == nil then
                vim.api.nvim_command('hi GalaxyEndTypeThree guifg=' .. mode_color[vim.fn.mode()])
            elseif dw == nil and de ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeThree guifg=' .. colors.error_red)
            end
            vim.api.nvim_command('hi GalaxyEndTypeThree guibg=' .. colors.vivid_blue)
            return " "
        end,
    }
}
gls.left[7] = {
    DiagnosticHint = {provider = 'DiagnosticHint', icon = ' ', highlight = {colors.bg, colors.vivid_blue}}
}

gls.left[8] = {
    EndTypeFour = {
        provider = function()
            de = diagnostic.get_diagnostic_error()
            de = tonumber(de)
            dw = diagnostic.get_diagnostic_warn()
            dw = tonumber(dw)
            dh = diagnostic.get_diagnostic_hint()
            dh = tonumber(dh)
            di = diagnostic.get_diagnostic_info()
            di = tonumber(di)
            if di == nil then
                return ""
            elseif dh ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeFour guifg=' .. colors.vivid_blue)
            elseif dw ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeFour guifg=' .. colors.orange)
            elseif de ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeFour guifg=' .. colors.red)
            else
                vim.api.nvim_command('hi GalaxyEndTypeFour guifg=' .. mode_color[vim.fn.mode()])
            end
            vim.api.nvim_command('hi GalaxyEndTypeFour guibg=' .. colors.light_blue)
            return " "
        end,
    }
}

gls.left[9] = {DiagnosticInfo = {provider = 'DiagnosticInfo', highlight = {colors.bg, colors.info_yellow}}}

gls.left[10] = {
    EndTypeFive = {
        provider = function()
            de = diagnostic.get_diagnostic_error()
            de = tonumber(de)
            dw = diagnostic.get_diagnostic_warn()
            dw = tonumber(dw)
            dh = diagnostic.get_diagnostic_hint()
            dh = tonumber(dh)
            di = diagnostic.get_diagnostic_info()
            di = tonumber(di)
            if di ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeFive guifg=' .. colors.light_blue) 
            elseif dh ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeFive guifg=' .. colors.vivid_blue)
            elseif dw ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeFive guifg=' .. colors.orange)
            elseif de ~= nil then
                vim.api.nvim_command('hi GalaxyEndTypeFive guifg=' .. colors.error_red)
            else 
                vim.api.nvim_command('hi GalaxyEndTypeFive guifg=' .. mode_color[vim.fn.mode()])
            end
            vim.api.nvim_command('hi GalaxyEndTypeFive guibg=' .. colors.bg)
            return " "
        end,
    }
}

-- Right
gls.right[1] = {
    GitBranchLeftCurve = {
        provider = function()
            branch = vcs.get_git_branch()
            if branch == "master" or branch == "main" then
                vim.api.nvim_command('hi GalaxyGitBranchLeftCurve guifg=' .. colors.mgold)
            else
                vim.api.nvim_command('hi GalaxyGitBranchLeftCurve guifg=' .. colors.purple)
            end
            return ""

        end,
        condition = condition.check_git_workspace,
        highlight = {colors.mgold, colors.bg}
    }
}
gls.right[2] = {
    GitIcon = {
        provider = function()
            branch = vcs.get_git_branch()
            if branch == "master" or branch == "main" then
                vim.api.nvim_command('hi GalaxyGitIcon guibg=' .. colors.mgold)
            else
                vim.api.nvim_command('hi GalaxyGitIcon guibg=' .. colors.purple)
            end
            return ' '
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.bg}
    }
}

gls.right[3] = {
    GitBranch = {
        provider = function()
            branch = vcs.get_git_branch()
            if branch == "master" or branch == "main" then
                vim.api.nvim_command('hi GalaxyGitBranch guibg=' .. colors.mgold)
            else
                vim.api.nvim_command('hi GalaxyGitBranch guibg=' .. colors.purple)
            end
            return branch
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.bg}
    }
}

gls.right[4] = {
    GitBranchRightCurve = {
        provider = function()
            branch = vcs.get_git_branch()
            if branch == "master" or branch == "main" then
                vim.api.nvim_command('hi GalaxyGitBranchRightCurve guibg=' .. colors.mgold)
            else
                vim.api.nvim_command('hi GalaxyGitBranchRightCurve guibg=' .. colors.purple)
            end
            vim.api.nvim_command('hi GalaxyGitBranchRightCurve guifg=' .. colors.green)
            return "  "
        end,
        condition = condition.check_git_workspace,
    }
}

gls.right[5] = {
    GitLeftCurve = {
        provider = function()
            return ""
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.green, colors.bg}
    }
}

gls.right[6] = {
    DiffAdd = {
        provider = function() 
            added = vcs.diff_add()
            if added == nil then
                added = "0"
            end
            added = tonumber(added)
            return added .. " "
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.bg, colors.green}
    }
}
gls.right[7] = {
    DiffModified = {
        provider = function() 
            modified = vcs.diff_modified()
            if modified == nil then
                modified = "0"
            end
            modified = tonumber(modified)
            return "  " .. modified .. " "
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.bg, colors.blue}
    }
}
gls.right[8] = {
    DiffRemove = {
        provider = function() 
            remove = vcs.diff_modified()
            if remove == nil then
                remove = "0"
            end
            remove = tonumber(remove)
            return "  " .. remove
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.bg, colors.red}
    }
}

gls.right[9] = {
    GitRightCurve = {
        provider = function()
            return ""
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.red, colors.bg}
    }
}

gls.right[10] = {
    LspLeft = {
        provider = function()
            return ""
        end,
        highlight = {colors.light_blue, colors.bg}
    }
}
gls.right[11] = {
    ShowLspClient = {
        provider = function()
            num = 0
            local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
                return num .. " "
            end

            for _,client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
                    num = num + 1
                end
            end
            return num .. " "
        end,
        highlight = {colors.bg, colors.light_blue}
    }
}

gls.right[12] = {
    BufferType = {
        provider = 'FileTypeName',
        highlight = {colors.bg, colors.light_blue}
    }
}

gls.right[13] = {
    Tabstop = {
        provider = function()
            return "│sw:" .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " ts:" .. vim.api.nvim_buf_get_option(0, "tabstop") .." │"
        end,
        separator = " ",
        separator_highlight = {colors.bg, colors.light_blue},
        highlight = {colors.bg, colors.light_blue}
    }
}

gls.right[14] = {
    LineInfo = {
        provider = function()
            local line = vim.fn.line('.')
            local col = vim.fn.col('.')
            return string.format("%4d :%3d ", line, col)
        end,
        --separator = '  ',
        --separator_highlight = {'NONE', colors.bg},
        highlight = {colors.bg, colors.light_blue}
    }
}

gls.right[15] = {
    Percent = {
        provider = function()
            local lp = fileinfo.current_line_percent()
            if #lp == 4 then
                lp = " " .. lp
            end
            return lp
        end,
--        separator = ' ',
--        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.bg, colors.light_blue}
    }
}

gls.right[16] = {
    LspRight = {
        provider = function()
            return ""
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.light_blue, colors.bg}
    }
}

