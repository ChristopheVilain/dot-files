# dot-files

Personnal dot files I use on MacOS. Thought for bash as the default shell.  
I use alacritty as the terminal emulator, and tmux as a window manager.  

In the process of learning neovim to ascend to true Nerd form.  

## Bash Autocomplete

Have bash-completion@2 installed via brew.  
The default shell must be set to whatever was install with brew : `chsh -s /opt/homebrew/bin/bash`  

Always good measure to also modify the shell file `/etc/shells`  

If kubectl from rancher desktop, then manually create the autocomplete scripts : `kubectl completion bash > /opt/homebrew/etc/bash_completion.d/kubectl`  
And allow execution, `chmod +x /opt/homebrew/etc/bash_completion.d/kubectl`  



