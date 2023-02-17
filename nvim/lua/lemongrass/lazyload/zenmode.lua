local status, zen_mode = pcall(require, "zen-mode")
if not status then
    return
end

zen_mode.setup({
    window = {
        width = 125,
        backdrop = 0.5,
    },
})
