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

      # 4. Local Privacy Model (Qwen 2.5 7B via Ollama OpenAI API)
      - model_name: qwen
        litellm_params:
          model: openai/qwen2.5:7b
          api_base: http://localhost:11434/v1
          api_key: "ollama"

      # 5. Local Fast Reasoning (DeepSeek-R1 Distill Qwen 14B)
      - model_name: r1-14b
        litellm_params:
          model: openai/deepseek-r1:14b
          api_base: http://localhost:11434/v1
          api_key: "ollama"

      # 6. Local High-Intelligence Reasoning (DeepSeek-R1 Distill Qwen 32B)
      - model_name: r1-32b
        litellm_params:
          model: openai/deepseek-r1:32b
          api_base: http://localhost:11434/v1
          api_key: "ollama"

    litellm_settings:
      drop_params: true
      set_verbose: false
      ui: true
  '';
}
