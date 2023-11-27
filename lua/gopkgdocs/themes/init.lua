local M = {}


function M.load_spec(base_bg)
    return require("gopkgdocs.themes." .. base_bg)
end

return M
