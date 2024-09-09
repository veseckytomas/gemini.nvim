# Gemini.nvim

![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

`Gemini` is a Neovim plugin that allows you to utilize the Google
Gemini API directly within the editor in response to your inquiries.
This plugin is heavily inspired and code snippets taken from [jackmort/chatgpt.nvim](https://github.com/jackMort/ChatGPT.nvim)

## Installation

- Make sure you have `curl` installed.

- Get an API key from Google, which you can [obtain here](https://makersuite.google.com/app/apikey).

The API key can be provided in the configuration option `api_key_cmd`, provide the path and arguments to
an executable that returns the API key via stdout.

If you are using [packer.nvim](https://github.com/wbthomason/packer.nvim) as
plugin manager:

```lua
-- Packer
use({
  "veseckytomas/gemini.nvim",
    config = function()
      require("gemini").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
})
```

or if you are using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
-- Lazy
{
  "veseckytomas/gemini.nvim",
    event = "VeryLazy",
    config = function()
      require("gemini").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
}
```

### Secrets Management

The `api_key_cmd` configuration option takes a string, which is executed at
startup, and whose output is used as the API key.

The following configuration would use 1Passwords CLI, `op`, to fetch the API key
from the `credential` field of the `Gemini` entry.

```lua
require("chatgpt").setup({
    api_key_cmd = "op read op://private/Gemini/credential --no-newline"
})
```

The following configuration would use GPG to decrypt a local file containing the
API key

```lua
local home = vim.fn.expand("$HOME")
require("chatgpt").setup({
    api_key_cmd = "gpg --decrypt " .. home .. "/secret.txt.gpg"
})
```

Note that the `api_key_cmd` arguments are split by whitespace. If you need
whitespace inside an argument (for example to reference a path with spaces),
you can wrap it in a separate script.

## Usage

Plugin exposes following command:

### `Gemini`

`Gemini` command which opens interactive window
