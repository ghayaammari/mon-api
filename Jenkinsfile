pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Cloner le code source depuis le dépôt
                git 'https://github.com/ghayaammari/mon-api.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Construire l'image Docker
                sh 'docker build -t ghayaammari/mon-api-1:1.0 .'
            }
        }

        stage('Push to DockerHub') {
            steps {
                // Se connecter à DockerHub
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
                // Pousser l'image
                sh 'docker push ghayaammri/mon-api-1:1.0'
            }
        }

        stage('Deploy Container') {
            steps {
                // Déployer le conteneur
                sh 'docker run -d -p 3000:3000 ghayaammari/mon-api-1:1.0'
            }
        }
    }
}
