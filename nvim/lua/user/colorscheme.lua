--
--     ██████╗ ██████╗ ██╗      ██████╗ ██████╗          
--    ██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗         
--    ██║     ██║   ██║██║     ██║   ██║██████╔╝         
--    ██║     ██║   ██║██║     ██║   ██║██╔══██╗         
--    ╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║         
--     ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝         
                                                   
--███████╗ ██████╗██╗  ██╗███████╗███╗   ███╗███████╗
--██╔════╝██╔════╝██║  ██║██╔════╝████╗ ████║██╔════╝
--███████╗██║     ███████║█████╗  ██╔████╔██║█████╗  
--╚════██║██║     ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝  
--███████║╚██████╗██║  ██║███████╗██║ ╚═╝ ██║███████╗
--╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
--

-- Set your prefered colorscheme
local colorscheme = "dracula"

-- If your prefered colorscheme is not found then it will continue
-- after notifying it
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
