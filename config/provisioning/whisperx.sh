#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

# DEFAULT_WORKFLOW="https://raw.githubusercontent.com/ai-dock/comfyui/main/config/workflows/flux-comfyui-example.json"

APT_PACKAGES=(
    "libcudnn8"
    "espeak-ng"
    "nodejs"
)

PIP_PACKAGES=(
    "wheel"
    "huggingface_hub[cli]"
    "hf_transfer"
    "flash-attn --no-build-isolation"
    "ctranslate2==4.4.0"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/niknah/quick-connections"
    "https://github.com/AIFSH/ComfyUI-UVR5"
    "https://github.com/xwzliang/ComfyUI-WhisperX"
    "https://github.com/xwzliang/comfyui-kokoro"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
)

CUSTOM_INPUT_FILES=(
    #"https://huggingface.co/xwzliang/myloras/resolve/main/Pose_sheet_v02.png"
)

CUSTOM_MODEL_REPOS=(
)

HUGGINGFACE_CLI_REPOS=(
    "Systran/faster-whisper-large-v3"
    "jonatasgrosman/wav2vec2-large-xlsr-53-chinese-zh-cn"
    "hexgrad/Kokoro-82M"
)

CUSTOM_MODELS=(
)

CUSTOM_NODES=(
    "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation"
)

CHECKPOINT_MODELS=(
)

CLIP_MODELS=(
)

UNET_MODELS=(
)

VAE_MODELS=(
)

LORA_MODELS=(
)

ESRGAN_MODELS=(
    # "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    # "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    # "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
)

UPSCALE_MODELS=(
)

ANIMATEDIFF_MODELS=(
)

function provisioning_get_custom_model_repos() {
    for entry in "${CUSTOM_MODEL_REPOS[@]}"; do
        model_folder=$(echo "$entry" | awk '{print $1}')
        repo=$(echo "$entry" | awk '{print $2}')
        dirname="${repo##*/}"
        path="/opt/ComfyUI/models/${model_folder}"
        mkdir -p $path
        git lfs install
        git clone $repo
        # Remove .git to save space
        rm -rf "${path}/${dirname}/.git"
    done
}

function provisioning_get_huggingface_repos_to_cache() {
    cache_dir=/workspace/home/user/.cache/huggingface/hub
    mkdir -p $cache_dir
    for repo in "${HUGGINGFACE_CLI_REPOS[@]}"; do
        HF_HUB_ENABLE_HF_TRANSFER=1 /opt/environments/python/comfyui/bin/huggingface-cli download $repo --cache-dir $cache_dir
    done
}

function fix_insightface() {
    mv /workspace/ComfyUI/models/insightface/models/antelopev2/antelopev2/* /workspace/ComfyUI/models/insightface/models/antelopev2/
}

function provisioning_start() {
    pip install wheel huggingface_hub[cli] hf_transfer
    pip install flash-attn --no-build-isolation
    pip install ctranslate2==4.4.0
    if [[ ! -d /opt/environments/python ]]; then 
        export MAMBA_BASE=true
    fi
    source /opt/ai-dock/etc/environment.sh
    source /opt/ai-dock/bin/venv-set.sh comfyui

    # Get licensed models if HF_TOKEN set & valid
    # if provisioning_has_valid_hf_token; then
        # UNET_MODELS+=("https://huggingface.co/Kijai/flux-fp8/resolve/main/flux1-dev-fp8.safetensors")
        # VAE_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors")
    # else
    #     UNET_MODELS+=("https://huggingface.co/Kijai/flux-fp8/resolve/main/flux1-schnell-fp8-e4m3fn.safetensors")
    #     VAE_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors")
        # sed -i 's/flux1-dev\.safetensors/flux1-schnell.safetensors/g' /opt/ComfyUI/web/scripts/defaultGraph.js
    # fi

    provisioning_print_header
    provisioning_get_apt_packages
    # provisioning_get_default_workflow
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_custom_nodes
    provisioning_get_custom_model_repos
    provisioning_get_huggingface_repos_to_cache
    provisioning_get_custom_models
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/input" \
        "${CUSTOM_INPUT_FILES[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/loras" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/clip" \
        "${CLIP_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/upscale_models" \
        "${UPSCALE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/ComfyUI/models/animatediff_models" \
        "${ANIMATEDIFF_MODELS[@]}"
    # fix_insightface
    provisioning_print_end
}

function python_run() {
    if [[ -z $MAMBA_BASE ]]; then
            "$COMFYUI_VENV_PYTHON" "$@"
        else
            micromamba run -n comfyui python "$@"
        fi
}

# Download from $1 URL to $2 file path (with filename)
function provisioning_download_with_filename() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -O "$2" "$1"
}

function provisioning_get_custom_models() {
    for entry in "${CUSTOM_MODELS[@]}"; do
        filepath=$(echo "$entry" | awk '{print $1}')
        url=$(echo "$entry" | awk '{print $2}')
        dir=$(dirname $filepath)
        filename=$(basename $filepath)
        full_dir="${WORKSPACE}/ComfyUI/models/${dir}"
        mkdir -p "${full_dir}"
        printf "\n-----------------Downloading: %s\n" "${url}"
        provisioning_download_with_filename "${url}" "${full_dir}/${filename}"
        printf "\n"
    done
}

function provisioning_get_custom_nodes() {
    for repo in "${CUSTOM_NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        install_script="${path}/install.py"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip_install -r "$requirements"
                fi
                python_run $install_script
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip_install -r "$requirements"
            fi
            python_run $install_script
        fi
    done
}

function pip_install() {
    if [[ -z $MAMBA_BASE ]]; then
            "$COMFYUI_VENV_PIP" install --no-cache-dir "$@"
        else
            micromamba run -n comfyui pip install --no-cache-dir "$@"
        fi
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip_install ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip_install -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip_install -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_default_workflow() {
    if [[ -n $DEFAULT_WORKFLOW ]]; then
        workflow_json=$(curl -s "$DEFAULT_WORKFLOW")
        if [[ -n $workflow_json ]]; then
            echo "export const defaultGraph = $workflow_json;" > /opt/ComfyUI/web/scripts/defaultGraph.js
        fi
    fi
}

function provisioning_get_models() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

provisioning_start
