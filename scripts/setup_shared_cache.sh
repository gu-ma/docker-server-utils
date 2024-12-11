#!/bin/bash

# 1. Create a group for permissions to the directories
sudo groupadd shared-users 2>/dev/null || echo "Group shared-users already exists."
sudo usermod -aG shared-users "$USER"

# 2. Define shared directories for Hugging Face and PyTorch, change to the one you want to use
HF_DIR="/huggingface"
TORCH_DIR="/torch"

# 3. Create shared directories and set permissions
for DIR in "$HF_DIR" "$TORCH_DIR"; do
    sudo mkdir -p --mode=u+rwx,g+rwxs,o-rwx "$DIR"
    sudo chown "$USER" "$DIR"
    sudo chgrp shared-users "$DIR"
done

# 4. Add environment variables to .bashrc
cat <<EOF >> "$HOME/.bashrc"
# Hugging Face Home Directory
export HF_HOME="$HF_DIR"

# PyTorch Home Directory
export TORCH_HOME="$TORCH_DIR"

# Default umask to allow group write permissions
umask 002
EOF

# 5. Apply the new group membership in the current shell
newgrp shared-users
