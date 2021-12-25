local status_ok, which_key = pcall(require, "neoscroll")
if not status_ok then
    return
end

require('neoscroll').setup()

