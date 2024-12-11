#!/bin/bash

# 1. Create a group for permissions to the directories
sudo groupadd shared-users 2>/dev/null || echo "Group shared-users already exists."
sudo usermod -aG shared-users "$USER"

# 2. Define shared directories for Hugging Face and PyTorch
HF_DIR="/huggingface"
TORCH_DIR="/torch"

# 3. Create shared directories if they don't exist and set permissions
for DIR in "$HF_DIR" "$TORCH_DIR"; do
    if [ ! -d "$DIR" ]; then
        sudo mkdir -p --mode=u+rwx,g+rwxs,o-rwx "$DIR"
        sudo chown "$USER" "$DIR"
        sudo chgrp shared-users "$DIR"
        echo "Created and set up $DIR"
    else
        echo "$DIR already exists. Skipping creation."
    fi
done

# 4. Add environment variables to .bashrc if not already present
grep -qxF 'export HF_HOME="'$HF_DIR'"' "$HOME/.bashrc" || echo 'export HF_HOME="'$HF_DIR'"' >> "$HOME/.bashrc"
grep -qxF 'export TORCH_HOME="'$TORCH_DIR'"' "$HOME/.bashrc" || echo 'export TORCH_HOME="'$TORCH_DIR'"' >> "$HOME/.bashrc"
grep -qxF 'umask 002' "$HOME/.bashrc" || echo 'umask 002' >> "$HOME/.bashrc"

# 5. Apply the new group membership in the current shell
newgrp shared-users
