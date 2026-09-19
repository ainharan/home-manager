{ pkgs, ... }:

{
  xdg.configFile."opencode/config.json".text = builtins.toJSON {
    provider = {
      litellm = {
        name = "LiteLLM Proxy";
        npm = "@ai-sdk/openai";
        options = {
          baseURL = "http://127.0.0.1:4000/v1";
          apiKey = builtins.getEnv "LITELLM_MASTER_KEY";
        };
        models = {
          "gemini-flash" = {
            name = "Gemini Flash";
          };
          "claude-sonnet" = {
            name = "Claude Sonnet";
          };
          "deepseek" = {
            name = "DeepSeek";
          };
        };
      };
    };
  };
}
