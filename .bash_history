hostnamectl set-hostname controller
exec bash 
swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fsta
sudo sed -i '/ swap / s/^/#/' /etc/fstad
sudo sed -i '/ swap / s/^/#/' /etc/fstab
vim /etc/hosts
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
# sysctl params required by setup, params persist across reboots
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# Apply sysctl params without reboot
sudo sysctl --system
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly
sudo apt-get update
sudo apt-get install -y kubectl kubelet kubeadm 
sudo apt install docker.io
udo sh -c "containerd config default > /etc/containerd/config.toml"
sudo sh -c "containerd config default > /etc/containerd/config.toml"
sudo mkdir /etc/containerd
sudo sh -c "containerd config default > /etc/containerd/config.toml"
sudo sed -i 's/ SystemdCgroup = false/ SystemdCgroup = true/' /etc/containerd/config.toml
sudo systemctl restart containerd.service
sudo systemctl restart kubelet.service
sudo systemctl status  kubelet.service
sudo kubeadm config images pull
sudo kubeadm init --pod-network-cidr=10.10.0.0/16
sudo systemctl status  kubelet.service
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml
curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/custom-resources.yaml -O
sed -i 's/cidr: 192\.168\.0\.0\/16/cidr: 10.10.0.0\/16/g' custom-resources.yaml
kubectl create -f custom-resources.yaml
kubectl get node
sudo systemctl status  kubelet.service
kubeadm join 192.168.121.53:6443 --token khvi7p.702nhqc6k1fwqgk7 	--discovery-token-ca-cert-hash sha256:f0c574ed7877a9f9cacd0d3d4bc16e444bc8fd035c92c0d52f85b5a6a7f61769 
sudo systemctl status  kubelet.service
kubectl get node
sudo systemctl status  kubelet.service
kubectl get node
sudo systemctl status  kubelet.service
kubectl get po -n kube-system 
kubectl exec -i -t dnsutils -- nslookup coredns-7db6d8ff4d-2cvwk
kubectl exec -i -t coredns-7db6d8ff4d-2cvwk -- nslookup 
kubectl get no
systemctl status kubelet.service 
kubectl get pods
kubectl get pod
kubectl get nod
kubectl get no
kubectl get pods -n kube-system
kubectl get na
kubectl get namespaces
vim jenkins-account-service.yaml
kubectl apply jenkins-account-service.yaml 
vim jenkins-account-service.yaml
kubectl apply jenkins-account-service.yaml 
kubectl apply -f jenkins-account-service.yaml 
vim jenkins-cluster.yml
kubectl create jenkins-cluster.yml 
kubectl create -f jenkins-cluster.yml 
kubectl create token jenkins --duration=12M
kubectl create token jenkins --duration=360d
kubectl create token --help
kubectl create token jenkins --duration=24h
kubectl create token jenkins --duration=56w
kubectl create token jenkins --duration=56W
kubectl config view 
vim deployment-nginx.yaml
vim Jenkinsfile
git init
git config --gl
git config --global user.name "vince Anyah"
git config --global user.email "lptxanyahvincent@gmail.com"
git add .
git commit "initial config setup"
git commit -m "initial config setup"
git branch -M master
git remote add origin https://github.com/majevince/jenkins-kube-pipeline.git
git push -u origin master 
vim Jenkinsfile 
mv deployment-nginx.yaml  nginx-deployment.yaml
vim Jenkinsfile 
git add .
git commit -m "update Jenkinsfine "
git push 
vim Jenkinsfile 
git add .
git commit -m "update kube credentials"
git push
kubectl get pods
kubectl apply -f nginx-deployment.yaml
kubectl get po
vim nginx-deployment.yaml 
kubectl get po
ping google.com
curl https://google.com
curl https://www.google.com
clear
kubectl get po
kubectl get no -u jenkins 
kubectl get --help
kubectl --help
vim jenkins-clusterrole.yaml
ll
vim jenkins-clusterrolebinding.yaml
kubectl apply -f jenkins-clusterrole.yaml
kubectl apply -f jenkins-clusterrolebinding.yaml
kubectl delete jenkins-clusterrolebinding
kubectl  get rabc
kubectl  get ClusterRoleBinding
kubectl config view
kubectl cluster-info
ubectl get rolebindings --all-namespaces | grep jenkins
kubectl get rolebindings --all-namespaces | grep jenkins
kubectl get rolebindings --all-namespaces 
kubectl get clusterrolebindings | grep jenkins
kubectl describe serviceaccount jenkins-binding  
kubectl describe serviceaccount jenkins
kubectl create clusterrolebinding test-admin-binding --clusterrole=cluster-admin --serviceaccount=default:jenkins
kubectl create token jenkins --duration=720h
kubectl cluster-info
kubectl config view
exit
