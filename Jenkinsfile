pipeline {
    agent any

    environment {
        KUBE_CONFIG = credentials('kubernetes-token')
    }

    stages {
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

