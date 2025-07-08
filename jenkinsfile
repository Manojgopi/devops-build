pipeline {
    agent any

    environment {
        IMAGE_TAG = "${env.BUILD_ID}"
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        DEV_REPO = 'manojgopi510/dev'
    }

    triggers {
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/Manojgopi/devops-build.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("myapp:${IMAGE_TAG}")
                }
            }
        }

        stage('Push to DockerHub (Dev)') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                        docker.image("myapp:${IMAGE_TAG}").tag("${DEV_REPO}:${IMAGE_TAG}")
                        docker.image("${DEV_REPO}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}
