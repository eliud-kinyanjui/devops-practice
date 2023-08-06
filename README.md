# devops-practice

## Topics

- Google Cloud
- Jenkins
- Docker
- Ansible
- K8s
  

### GCP Public Images

- To view list of public images run `gcloud compute images list`

### Commonly used images
 

|NAME   |PROJECT   	|FAMILY
|---	|---	|---
|ubuntu-2004-focal-v20230724    |ubuntu-os-cloud    |ubuntu-2004-lts
|ubuntu-2004-focal-v20230724    |ubuntu-os-cloud    |ubuntu-2004-lts       
|ubuntu-2204-jammy-v20230727    |ubuntu-os-cloud    |ubuntu-2204-lts       
|centos-7-v20230711             |centos-cloud       |centos-7    
|debian-10-buster-v20230711     |debian-cloud       |debian-10        
|debian-11-bullseye-v20230711   |debian-cloud       |debian-11  


### Minikube enable proxy

`kubectl proxy --address='0.0.0.0' --disable-filter=true`



`curl http://your_api_server_ip:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/`
