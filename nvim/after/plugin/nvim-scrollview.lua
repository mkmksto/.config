local status_ok, scrollview = pcall(require, "scrollview")
if not status_ok then
    return
end

scrollview.setup({
    winblend = 45,
    scrollview_auto_mouse = 0,
    scrollview_base = "buffer",
})
