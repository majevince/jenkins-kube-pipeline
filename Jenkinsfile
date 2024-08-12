pipeline {
    agent any

    environment {
        KUBE_CONFIG = credentials('kubeconfig-credentials')
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the repository containing the Kubernetes deployment file
                git url: 'https://github.com/your-repo/nginx-kube-deployment.git'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Apply the Kubernetes deployment
                    sh 'kubectl apply -f nginx-deployment.yaml'
                }
            }
        }
    }

    post {
        always {
            script {
                // Show the status of the deployment
                sh 'kubectl get deployments'
                sh 'kubectl get services'
            }
        }
    }
}

