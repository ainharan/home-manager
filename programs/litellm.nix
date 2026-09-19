{ pkgs, ... }:

{
  xdg.configFile."litellm/config.yaml".text = ''
    general_settings:
      master_key: os.environ/LITELLM_MASTER_KEY

    model_list:
      # 1. Daily Workhorse (Google Gemini 3.7 Flash)
      - model_name: gemini-flash
        litellm_params:
          model: gemini/gemini-3.7-flash
          api_key: os.environ/GEMINI_API_KEY

      # 2. Architectural & Complex Logic (Claude Sonnet 5)
      - model_name: claude-sonnet
        litellm_params:
          model: anthropic/claude-sonnet-5
          api_key: os.environ/ANTHROPIC_API_KEY

      # 3. High-Efficiency Coding & Reasoning (DeepSeek V4)
      - model_name: deepseek
        litellm_params:
          model: deepseek/deepseek-chat
          api_key: os.environ/DEEPSEEK_API_KEY

    litellm_settings:
      drop_params: true
      set_verbose: false
      ui: true
  '';
}
