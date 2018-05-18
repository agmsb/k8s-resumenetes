## Building a Resume to Learn Kubernetes ##

[IN PROGRESS]

This is an example heavily based on [this](https://medium.com/google-cloud/how-i-containerised-my-resume-api-91bb2d2f92f4) example, with a few changes. 

The tl;dr of Mario Menti's helpful blog post is this:

* Your resume as JSON (though, could be replaced by several datastores)
* Endpoints for each resume component as microservices 
* Microservices represented as Kubernetes Objects
* Deploy into a Kubernetes Cluster
* Profit

This example alters the original by:

* Change to Workshop Format
* Change resume fields
* Pretty-print resume JSON
* Review GKE cluster deployment
* Replace containerized nginx Service with native Kubernetes Ingress (ingress-nginx)
* Include Kubernetes concept explainers

What you will (hopefully) learn:

* Kubernetes Fundamentals
* (Some) Google Cloud Platform Fundamentals

## Labs ##

1. [Understanding Source](/labs/understanding_source.md)
2. [Building Container Images](/labs/building_container_images.md)
3. [Creating a Kubernetes Cluster in GCP](/labs/creating_kubernetes_cluster.md)
4. [Deploying Containers into Kubernetes](/labs/deploying_into_kubernetes.md)
5. [Exposing Containers in Kubernetes](/labs/exposing_containers.md)
6. [Creating an Ingress for Kubernetes Services](/labs/creating_ingress.md)
7. [Clean-Up and Wrap-Up](/labs/clean_up.md)

## What Next? ##


