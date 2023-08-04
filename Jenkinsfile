pipeline {
    environment {
        dockerimagename = 'elkingsparx/devops-practice'
        VERSION = "v1.0.${env.BUILD_ID}"
        IMAGE = "${dockerimagename}:${VERSION}"
    }

    agent any

    stages {
        stage('Checkout Source') {
            steps {
                git 'https://github.com/eliud-kinyanjui/devops-practice.git'
            }
        }

        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build IMAGE
                }
            }
        }

        stage('Pushing Image') {
            environment {
                registryCredential = 'dockerhub-credentials'
            }
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        dockerImage.push('latest')
                        dockerImage.push("${IMAGE}")
                    }
                }
            }
        }
    }
}
