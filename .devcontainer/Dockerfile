FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Dev tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    jq ripgrep fzf \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Persist shell history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R vscode /commandhistory \
    && echo "$SNIPPET" >> /home/vscode/.bashrc

USER vscode
