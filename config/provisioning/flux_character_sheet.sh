#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

# DEFAULT_WORKFLOW="https://raw.githubusercontent.com/ai-dock/comfyui/main/config/workflows/flux-comfyui-example.json"

APT_PACKAGES=(
    "libcudnn8"
    "espeak-ng"
)

PIP_PACKAGES=(
    "ultralytics"
    "ctranslate2==4.4.0"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/niknah/quick-connections"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/chrisgoringe/cg-use-everywhere"
    "https://github.com/lldacing/ComfyUI_PuLID_Flux_ll"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/ltdrdata/ComfyUI-Impact-Subpack"
    "https://github.com/giriss/comfy-image-saver"
    "https://github.com/xwzliang/ComfyUI_FaceAnalysis"
    # "https://github.com/kijai/ComfyUI-CogVideoXWrapper"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
    "https://github.com/aigc-apps/EasyAnimate"
    "https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved"
    "https://github.com/AIFSH/ComfyUI-UVR5"
    "https://github.com/xwzliang/ComfyUI-WhisperX"
    "https://github.com/xwzliang/comfyui-kokoro"
    "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet"
    "https://github.com/kijai/ComfyUI-LivePortraitKJ"
)

CUSTOM_INPUT_FILES=(
    #"https://huggingface.co/xwzliang/myloras/resolve/main/Pose_sheet_v02.png"
)

CUSTOM_MODEL_REPOS=(
    "EasyAnimate https://huggingface.co/alibaba-pai/EasyAnimateV5.1-12b-zh-InP"
    "../me https://github.com/xwzliang/comfyui"
)

CUSTOM_MODELS=(
    "loras/anime_blockprint_style.safetensors https://huggingface.co/glif/anime-blockprint-style/resolve/main/bwmanga.safetensors"
    "insightface/models/antelopev2.zip https://huggingface.co/xwzliang/myloras/resolve/main/antelopev2.zip"
    "insightface/models/buffalo_l.zip https://huggingface.co/xwzliang/myloras/resolve/main/buffalo_l.zip"
    "ultralytics/bbox/face_yolov8m.pt https://huggingface.co/Bingsu/adetailer/resolve/main/face_yolov8m.pt"
    "ultralytics/bbox/hand_yolov9c.pt https://huggingface.co/Bingsu/adetailer/resolve/main/hand_yolov9c.pt"
    "text_encoders/t5/t5xxl_fp16.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors"
    # "controlnet/FLUX.1/flux_shakker_labs_union_pro-fp8_e4m3fn.safetensors https://huggingface.co/Kijai/flux-fp8/resolve/main/flux_shakker_labs_union_pro-fp8_e4m3fn.safetensors"
    "pulid/pulid_flux_v0.9.1.safetensors https://huggingface.co/guozinan/PuLID/resolve/main/pulid_flux_v0.9.1.safetensors"
)

CUSTOM_NODES=(
    "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
)

CHECKPOINT_MODELS=(
    "https://huggingface.co/LootingGod/WildCardX-SDXL-Turbo/resolve/main/wildcardxXLTURBO_wildcardxXLTURBOV10.safetensors"
)

CLIP_MODELS=(
    "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors"
    # "https://huggingface.co/mcmonkey/google_t5-v1_1-xxl_encoderonly/resolve/main/t5xxl_fp8_e4m3fn.safetensors"
)

UNET_MODELS=(
)

VAE_MODELS=(
    "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

LORA_MODELS=(
    "https://huggingface.co/prithivMLmods/Canopus-Cute-Kawaii-Flux-LoRA/resolve/main/Canopus-Cute-Kawaii-Flux-LoRA.safetensors"
    "https://huggingface.co/prithivMLmods/Flux.1-Dev-Ctoon-LoRA/resolve/main/ctoon.safetensors"
    "https://huggingface.co/prithivMLmods/Knitted-Character-Flux-LoRA/resolve/main/Knitted-Character.safetensors"
    "https://huggingface.co/xwzliang/myloras/resolve/main/Jixar_flux_v2.safetensors"
)

ESRGAN_MODELS=(
    # "https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    # "https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    # "https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    "https://huggingface.co/TheMistoAI/MistoLine/resolve/main/mistoLine_fp16.safetensors"
)

UPSCALE_MODELS=(
    "https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth"
    #"https://huggingface.co/skbhadra/ClearRealityV1/resolve/main/4x-ClearRealityV1.pth"
)

ANIMATEDIFF_MODELS=(
    "https://huggingface.co/hotshotco/Hotshot-XL/resolve/main/hsxl_temporal_layers.f16.safetensors"
)

function provisioning_get_custom_model_repos() {
    for entry in "${CUSTOM_MODEL_REPOS[@]}"; do
        model_folder=$(echo "$entry" | awk '{print $1}')
        repo=$(echo "$entry" | awk '{print $2}')
        dirname="${repo##*/}"
        path="/opt/ComfyUI/models/${model_folder}"
        mkdir -p $path
        git lfs install
        git clone $repo "${path}/${dirname}"
        # Remove .git to save space
        rm -rf "${path}/${dirname}/.git"
    done
}

function fix_insightface() {
    unzip -o /workspace/ComfyUI/models/insightface/models/buffalo_l.zip -d /workspace/ComfyUI/models/insightface/models/buffalo_l
    unzip -o /workspace/ComfyUI/models/insightface/models/antelopev2.zip -d /workspace/ComfyUI/models/insightface/models/antelopev2
    mv /workspace/ComfyUI/models/insightface/models/antelopev2/antelopev2/* /workspace/ComfyUI/models/insightface/models/antelopev2/
}

function provisioning_start() {
    if [[ ! -d /opt/environments/python ]]; then 
        export MAMBA_BASE=true
    fi
    source /opt/ai-dock/etc/environment.sh
    source /opt/ai-dock/bin/venv-set.sh comfyui

    # Get licensed models if HF_TOKEN set & valid
    if provisioning_has_valid_hf_token; then
        UNET_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors")
        VAE_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors")
    else
        UNET_MODELS+=("https://huggingface.co/Kijai/flux-fp8/resolve/main/flux1-dev-fp8.safetensors")
        VAE_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors")
        # sed -i 's/flux1-dev\.safetensors/flux1-schnell.safetensors/g' /opt/ComfyUI/web/scripts/defaultGraph.js
    fi

    provisioning_print_header
    provisioning_get_apt_packages
    # provisioning_get_default_workflow
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_custom_nodes
    provisioning_get_custom_model_repos
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
    fix_insightface
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
