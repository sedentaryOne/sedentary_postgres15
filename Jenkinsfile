pipeline {
    agent any
    stages {

        stage('Build and Push Docker Image') {
            steps {
                script {
                   def imageVersion = "1.0"  // Define your versioning scheme
                    def buildNumber = env.BUILD_NUMBER
                    def imageName = "sedentary_postres15-${imageVersion}-${buildNumber}"
                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'hub.docker.com', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh 'docker login -u $USERNAME -p $PASSWORD'
                    }
                   // Build and push the Docker image
                    sh "docker build -t ${imageName} ."
                    sh "docker push sedentary/sedentary-containers:${imageName}"

                   // Set environment variable for docker-compose
                    sh "echo IMAGE_VERSION=${imageVersion} > .env"
                    sh "echo BUILD_NUMBER=${buildNumber} >> .env"
                }
            }
        }
      // ... other stages ...
    }
}