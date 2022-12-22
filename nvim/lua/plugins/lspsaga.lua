local M = {
    "glepnir/lspsaga.nvim",
    event = "BufReadPre",
}

function M.config()
    require("lspsaga").init_lsp_saga({
        -- custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    })
end

return M
