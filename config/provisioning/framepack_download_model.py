from huggingface_hub import snapshot_download

# Download HunyuanVideo model
snapshot_download(
    repo_id="hunyuanvideo-community/HunyuanVideo",
    local_dir="HunyuanVideo",
    ignore_patterns=["transformer/*", "*.git*", "*.log*", "*.md"],
    local_dir_use_symlinks=False
)

# Download flux_redux_bfl model
snapshot_download(
    repo_id="lllyasviel/flux_redux_bfl",
    local_dir="flux_redux_bfl",
    ignore_patterns=["*.git*", "*.log*", "*.md"],
    local_dir_use_symlinks=False
)

# Download FramePackI2V_HY model
snapshot_download(
    repo_id="lllyasviel/FramePackI2V_HY",
    local_dir="FramePackI2V_HY",
    ignore_patterns=["*.git*", "*.log*", "*.md"],
    local_dir_use_symlinks=False
)

# Download FramePackF1_HY model
snapshot_download(
    repo_id="lllyasviel/FramePack_F1_I2V_HY_20250503",
    local_dir="FramePackF1_HY",
    ignore_patterns=["transformer/*", "*.git*", "*.log*", "*.md"],
    local_dir_use_symlinks=False
)
