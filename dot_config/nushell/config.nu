$env.config.show_banner = false

# Setup atuin
source ~/.atuin/init.nu

# Setup starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
