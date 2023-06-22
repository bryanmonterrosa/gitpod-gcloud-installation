FROM gitpod/workspace-full

# Install gcloud
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y

# Install kubectl
RUN sudo apt-get install kubectl
RUN sudo apt-get install -y google-cloud-sdk-gke-gcloud-auth-plugin

# Initialize project and service account

RUN echo $GCP_SERVICE_KEY | base64 -d > .gcloud-conf.json
RUN gcloud auth activate-service-account --key-file .gcloud-conf.json
RUN gcloud config set project $GCP_PROJECT