pipeline {
    environment {
        dockerimagename = 'elkingsparx/devops-practice'
        VERSION = "v1.0.${env.BUILD_ID}"
        IMAGE = "${dockerimagename}:${VERSION}"
        CONTAINER_NAME = 'devops-container'
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
                        dockerImage = docker.image(IMAGE)
                        dockerImage.push()

                        dockerImage.tag('latest')
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    containerStatus = sh(
                        script: "docker inspect -f '{{ .State.Running }}' ${CONTAINER_NAME}",
                        returnStatus: true
                    )

                    if (containerStatus == 'true') {
                        sh 'docker compose down'
                        sleep 15
                        sh 'docker compose up -d'
                    } else {
                        sh 'docker compose up -d'
                    }
                }
            }
        }
    }
}
