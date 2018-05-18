## Pull in parameters from options.yaml

CLUSTER_NAME=$(awk '{for(i=1;i<=NF;i++) if ($i=="cluster_name:") print $(i+1)}' options.yaml)
REGION=$(awk '{for(i=1;i<=NF;i++) if ($i=="region:") print $(i+1)}' options.yaml)
PROJECT_ID=$(gcloud config list project | awk 'FNR ==2 { print $3 }')
NETWORK_NAME=$(awk '{for(i=1;i<=NF;i++) if ($i=="network_name:") print $(i+1)}' options.yaml)
SUBNETWORK_NAME=$(awk '{for(i=1;i<=NF;i++) if ($i=="subnetwork_name:") print $(i+1)}' options.yaml)
POD_RANGE_NAME=$(awk '{for(i=1;i<=NF;i++) if ($i=="pod_range_name:") print $(i+1)}' options.yaml)
SERVICES_RANGE_NAME=$(awk '{for(i=1;i<=NF;i++) if ($i=="services_range_name:") print $(i+1)}' options.yaml)


## Create GCP Network

gcloud compute networks create $NETWORK_NAME \
--subnet-mode=custom

echo "Created "

## Configure gcloud to use v1beta API for regional cluster

gcloud config set container/use_v1_api false

echo "Setting gcloud container to beta."

## Create GKE Cluster 

gcloud beta container clusters create $CLUSTER_NAME --region us-west1 \
--num-nodes 1 \
--enable-autoscaling --max-nodes 3 --min-nodes 1 \
--enable-ip-alias \
--network agmsb-resume-net \
--subnetwork agmsb-resume-net-k8s \
--cluster-secondary-range-name=agmsb-resume-net-k8s-pod \
--services-secondary-range-name=agmsb-resume-net-k8s-svc 
