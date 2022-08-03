local get_hex = require("cokeline/utils").get_hex
local mappings = require("cokeline/mappings")

local blue = "#004b84"
local red = "#ff0000"
local yellow = "#fdd93d"
local white = "#e1e2e2"

local components = {
    space = {
        text = " ",
        truncation = { priority = 1 },
    },
    two_spaces = {
        text = "  ",
        truncation = { priority = 1 },
    },
    separator = {
        text = function(buffer)
            return buffer.index ~= 1 and "▏" or ""
        end,
        truncation = { priority = 1 },
    },
    devicon = {
        text = function(buffer)
            return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
                or buffer.devicon.icon
        end,
        fg = function(buffer)
            return (mappings.is_picking_focus() and yellow)
                or (mappings.is_picking_close() and red)
                or buffer.devicon.color
        end,
        style = function(_)
            return (mappings.is_picking_focus() or mappings.is_picking_close()) and "italic,bold" or nil
        end,
        truncation = { priority = 1 },
    },
    index = {
        text = function(buffer)
            return buffer.index .. ": "
        end,
        truncation = { priority = 1 },
    },
    unique_prefix = {
        text = function(buffer)
            return buffer.unique_prefix
        end,
        fg = blue,
        style = "italic",
        truncation = {
            priority = 3,
            direction = "left",
        },
    },
    filename = {
        text = function(buffer)
            return buffer.filename
        end,
        style = function(buffer)
            return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
                or (buffer.is_focused and "bold")
                or (buffer.diagnostics.errors ~= 0 and "underline")
                or nil
        end,
        truncation = {
            priority = 2,
            direction = "left",
        },
    },

    diagnostics = {
        text = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and "  " .. buffer.diagnostics.errors)
                or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
                or ""
        end,
        fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and red)
                or (buffer.diagnostics.warnings ~= 0 and yellow)
                or nil
        end,
        truncation = { priority = 1 },
    },
    close_or_unsaved = {
        text = function(buffer)
            return buffer.is_modified and "●" or ""
        end,
        fg = function(buffer)
            return buffer.is_modified and white or nil
        end,
        delete_buffer_on_left_click = true,
        truncation = { priority = 1 },
    },
}

require("cokeline").setup({
    show_if_buffers_are_at_least = 2,
    buffers = {
        new_buffers_position = "next",
    },
    rendering = {
        max_buffer_width = 999,
    },
    default_hl = {
        fg = function(buffer)
            return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
        end,
        bg = function(buffer)
            if buffer.is_focused then
                return "#2b2e37"
            end
            return get_hex("ColorColumn", "bg")
        end
    },
    sidebar = {
        filetype = "NvimTree",
        components = {
            {
                text = "",
                fg = yellow,
                bg = get_hex("NvimTreeNormal", "bg"),
                style = "bold",
            },
        },
    },
    components = {
        components.space,
        components.separator,
        components.space,
        components.devicon,
        components.space,
        components.index,
        components.unique_prefix,
        components.filename,
        components.diagnostics,
        components.two_spaces,
        components.close_or_unsaved,
        components.space,
    },
})
