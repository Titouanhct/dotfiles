# Dotfiles

Personal configuration files for Neovim and Kitty on Linux.

This repository provides a simple way to install, manage, and synchronize configurations across multiple Linux systems using Git and symbolic links.

## Repository Structure

```text
dotfiles/
├── nvim/
│   ├── init.lua
│   ├── lua/
│   └── lazy-lock.json
├── kitty/
│   └── kitty.conf
├── install.sh
└── README.md
```

## Installation

The following instructions are intended for a fresh Ubuntu or Debian installation.

### 1. Install Dependencies

Update the package index and install the required applications:

```bash
sudo apt update
sudo apt install -y \
    git \
    neovim \
    kitty \
    curl \
    wget \
    unzip \
    ripgrep \
    fd-find \
    build-essential
```

Some Neovim plugins require a recent version of Neovim. Check the installed version:

```bash
nvim --version
```

If necessary, install a newer version from the [official Neovim releases](https://github.com/neovim/neovim/releases).

Additional dependencies, such as language servers, runtimes, or fonts, may be required depending on the configuration.

### 2. Clone the Repository

Clone the repository into your home directory:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Replace `YOUR_USERNAME` with your GitHub username.

### 3. Install Configurations

Run the installation script:

```bash
bash install.sh
```

The script performs the following operations:

1. Creates `~/.config` if it does not exist.
2. Backs up existing Neovim and Kitty configurations.
3. Creates symbolic links pointing to the repository.
4. Skips configurations that are already correctly linked.

After installation:

```text
~/.config/
├── nvim  -> ~/dotfiles/nvim/
└── kitty -> ~/dotfiles/kitty/
```

Both applications will use the configurations stored in the repository.

### 4. Initialize Neovim

Launch Neovim:

```bash
nvim
```

If the configuration uses lazy.nvim with automatic bootstrapping, missing plugins will be installed on the first launch.

To manually synchronize plugins:

```vim
:Lazy sync
```

Restart Neovim after installation if necessary.

### 5. Launch Kitty

Start Kitty:

```bash
kitty
```

Kitty will automatically load its configuration from:

```text
~/.config/kitty/kitty.conf
```

If the configuration uses a custom font, ensure that it is installed on the system.

## Configuration Management

### Updating Configurations

Configurations are managed through symbolic links. Any changes made in `~/.config/nvim` or `~/.config/kitty` are directly reflected in the repository.

To commit and push changes:

```bash
cd ~/dotfiles
git add .
git commit -m "Update configurations"
git push
```

### Synchronizing Another Computer

To retrieve the latest changes:

```bash
cd ~/dotfiles
git pull
```

The updated configurations will be available immediately through the existing symbolic links.

Restart or reload the affected applications to apply changes.

## Configuration Locations

| Application | Configuration Path |
|---|---|
| Neovim | `~/.config/nvim/` |
| Kitty | `~/.config/kitty/` |

### Neovim

The main configuration file is:

```text
~/.config/nvim/init.lua
```

Plugins and runtime data are generally stored in:

```text
~/.local/share/nvim/
```

These files are not included in the repository and should be installed through the configured plugin manager.

If using lazy.nvim, the `lazy-lock.json` file records plugin versions to help maintain consistency across installations.

### Kitty

The main configuration file is:

```text
~/.config/kitty/kitty.conf
```

Kitty loads this configuration automatically at startup.

## Troubleshooting

### Neovim Plugins Are Missing

Open Neovim and run:

```vim
:Lazy sync
```

This command applies only if the configuration uses lazy.nvim.

### Neovim Version Is Incompatible

Check the installed version:

```bash
nvim --version
```

Install a compatible version from the official Neovim releases if required.

### Kitty Fonts Are Missing

Verify that the required font is installed:

```bash
fc-list : family
```

Install any missing fonts and ensure that the font family configured in `kitty.conf` matches the installed font.

### Existing Configurations

The installation script creates timestamped backups before replacing existing configurations:

```text
~/.config/nvim.backup.YYYYMMDD_HHMMSS
~/.config/kitty.backup.YYYYMMDD_HHMMSS
```

These backups can be restored manually if necessary.

### Git Synchronization Conflicts

Check the repository status:

```bash
cd ~/dotfiles
git status
```

Commit local changes before pulling updates from another computer.

Alternatively:

```bash
git stash
git pull
git stash pop
```

Conflicts may require manual resolution.

## Security

Do not commit sensitive information such as passwords, API keys, access tokens, or private SSH keys.

Review configuration files before pushing changes, particularly when using a public repository.

## Quick Setup

For a fresh Ubuntu or Debian installation:

```bash
# Install dependencies
sudo apt update
sudo apt install -y git neovim kitty curl wget unzip ripgrep fd-find build-essential

# Clone repository
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles

# Install configurations
cd ~/dotfiles
bash install.sh

# Launch Neovim
nvim
```

## Compatibility

- Operating system: Linux
- Package manager: APT (Ubuntu/Debian)
- Configuration management: Git and symbolic links
- Applications: Neovim and Kitty

Other Linux distributions are supported in principle but require installation of dependencies through their respective package managers.
