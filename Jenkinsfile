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
                    sh 'sudo kubectl apply -f nginx-deployment.yaml --validate=false'
                }
            }
        }
    }

    post {
        always {
            script {
                // Show the status of the deployment
                sh 'sudo kubectl get deployments'
                sh 'sudo kubectl get services'
            }
        }
    }
}

