pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "rajeshbuece/java-app"
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/rajeshbuece/CI-CD-JENKINS-DOCKER-JAVAAPP.git'
            }
        }
        stage('Build') {
            steps {
                docker.image('maven:3.8.1').inside {
                    sh 'mvn clean package'
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push("${env.BUILD_ID}")
                    }
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
