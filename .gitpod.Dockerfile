FROM gitpod/workspace-full:2023-05-08-21-16-55

# Install gcloud
RUN sudo apt-get update &&\
    sudo apt-get install -y apt-transport-https ca-certificates gnupg curl sudo &&\
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list &&\
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - &&\
    sudo apt-get update && sudo apt-get install -y google-cloud-cli

# Install kubectl
RUN sudo apt-get install kubectl  &&\
    sudo apt-get install -y google-cloud-sdk-gke-gcloud-auth-plugin
