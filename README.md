# 🥾 boot.nvim
A simple, fast, and customizable ***boot*** screen for [Neovim](https://neovim.io/) 

![boot.nvim](https://github.com/user-attachments/assets/9e08d750-1419-4248-8902-d6c41195c662)

## ✨ Features
- Small and Fast
- Fully Customizable
- Easy to Use

- Modular Themes

## 📦 Installation

Install **boot.nvim** with a package manager of your choice. 

### [lazy.nvim](https://github.com/folke/lazy.nvim)

``` lua
{
    'piperinnshall/boot.nvim',
    opts = {
        -- add options here
    },
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim) 

```lua
use {
    'piperinnshall/boot.nvim',
    config = function()
        require('boot').setup()
    end
}
```

## ⚙️  Configuration

The default options for **boot.nvim** are:

```lua
require('boot').setup({
    directory = 'boot.themes', -- choose the directory that the theme is located in
    theme = { -- define options for a theme
        -- set the name of the currently used theme
        -- has to be the first element of the theme table 
        'neovim', 
        -- an array of theme content 
        content = {
            -- a theme is an array of content tables
            -- each table has its own settings and ascii table 
            {
                ascii = {},                -- Should be an array of strings
                color = 'ffffff',          -- Color as string
                vertical_padding = 0,      -- Number for padding
                alignment = 'center',      -- One of 'left', 'right', 'center'

            },
        },
    },
})
```

## 📝 Themes

currently there are two native themes:

- neovim (default)
- melody

You can choose themes like this: 

```lua  
require('boot').setup({ theme = { 'neovim' } }) 
```

### neovim

![neovim theme](https://github.com/user-attachments/assets/16ce5722-bd7e-4fc9-9e33-22441a60a8c1)

### Custom Theme Location

Custom themes are located by default in `lua/boot/themes/my-custom-theme.lua`. Using the directory flag you can store themes in different locations.
For example, setting `directory = 'config'` means that themes will be located in `lua/config/my-custom-theme.lua`.  

**Warning:** 

Changing the directory flag will make all default themes unusable. 
To use them again ensure the directory flag is deleted from configuration or set the directory flag to `directory = 'boot.themes'`

### Custom Theme Creation

Themes are an array of content tables that contain information that will be drawn onto the screen. Each content table has its own properties.

To better understand how a theme is structured, here is the contents of the default theme `'neovim'`:

```lua
-- Content Table 1
{
    ascii = {
        '     ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗    ',
        '     ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║    ',
        '     ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║    ',
        '     ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║    ',
        '     ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║    ',
        '     ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝    ',
    },
    -- The above ascii table will be displayed in the current neovim buffer in this color
    -- To set multiple colors, create new content tables
    color = 'cba6f7', 
    -- The ascii art will be displayed in the center of the buffer 
    alignment = 'center',
    -- The ascii art will be displayed 10 lines below the top of the buffer
    vertical_padding = 10,
},
-- Content Table 2
{
    ascii = {
        '>> emacs',
    },
    color = '4c4f69',
    alignment = 'center',
    vertical_padding = 0,
},
```

You can create a custom theme in several ways:

#### Create a Theme in a Themes Directory

```lua {filename='my-custom-theme.lua'}
return {
    {
        ascii = {},
        color = 'ffffff',
        vertical_padding = 0,
        alignment = 'center',
    },
}
```

#### Create a Theme in the Plugin Configuration  

```lua 
require('boot').setup({
    theme = {
        'my-custom-theme'
        content = {
            {
                ascii = {},
                color = 'ffffff',
                vertical_padding = 0,
                alignment = 'center',
            },
        }, 
    },
})
```

If content or content options are present in the plugin configuration, the set theme will not be used.

## 🔑 License

Apache License Version 2.0 January 2004 
