pipeline {
    agent any
    stages {

        stage('Build and Push Docker Image') {
            steps {
                script {
                   def imageVersion = "1.0"  // Define your versioning scheme
                   def buildNumber = env.BUILD_NUMBER
                   def imageName = "sedentary_postres15:${imageVersion}-${buildNumber}"
    
                   // Build and push the Docker image
                   sh "docker build -t ${imageName} ."
                   sh "docker push ${imageName}"
    
                   // Set environment variable for docker-compose
                   sh "echo IMAGE_VERSION=${imageVersion} > .env"
                   sh "echo BUILD_NUMBER=${buildNumber} >> .env"
                }
            }
        }
      // ... other stages ...
    }
}