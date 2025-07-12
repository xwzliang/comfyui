FROM mycomfyui-snapshot-20250629

RUN rm -f /opt/ai-dock/etc/environment.sh

RUN apt install -y nodejs