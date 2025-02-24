require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "openrouter",
    },
    inline = {
      adapter = "openrouter",
    },
  },
  adapters = {
    openrouter = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "https://openrouter.ai/api",
          api_key = "OPENROUTER_API_KEY",
          chat_url = "/v1/chat/completions",
        },
        schema = {
          model = {
            default = "anthropic/claude-3.5-sonnet",
          },
        },
      })
    end,
  }
})
