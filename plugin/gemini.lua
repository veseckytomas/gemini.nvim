vim.api.nvim_create_user_command("Gemini", function()
  require("gemini").openChat()
end, {})
