pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/rajeshbuece/CI-CD-JENKINS-DOCKER-JAVAAPP.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f kubernetes/deployment.yml'
            }
        }
    }
}
