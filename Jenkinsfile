pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Construire l'image Docker
                    sh 'docker build -t ghayaammari/mon-api-jenkis .'
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    // Se connecter à DockerHub
                    withDockerRegistry([credentialsId: 'dockerhub-credentials', url: 'https://index.docker.io/v1/']) {
                        // Pousser l'image vers DockerHub
                        sh 'docker push ghayaammari/mon-api-jenkins:latest'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Déployer le conteneur Docker
                    sh 'docker run -d -p 3000:3000 ghayaammari/mon-api-jenkins:latest'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
