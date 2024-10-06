pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/rajeshbuece/CI-CD-JENKINS-DOCKER-JAVAAPP.git'
            }
        }
        stage('Build') {
            agent {
                docker {
                    image 'maven:3.8.1'   // Specify the Docker image for Maven
                    args '-v /root/.m2:/root/.m2'  // To cache Maven dependencies
                }
            }
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    dockerImage = docker.build("your-app:${env.BUILD_ID}")
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f kubernetes/deployment.yml'
                }
            }
        }
    }
}
