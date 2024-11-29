pipeline {
  environment {
    registry = "bhoomika2897n"
    registryCredential = 'docker_cred'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning our Git') {
      steps {
        git 'https://github.com/bhoomikakrish/nodeapp.git'
      }
    }
    stage('Build and Push Docker Image') {
            steps {
                script {
                        def currentBuildNumber = currentBuild.number
                        def nextBuildNumber = currentBuild.number + 1
                        def lastBuildNumber = currentBuild.number - 1
                        echo "$currentBuildNumber"
                        echo "$nextBuildNumber"
                        echo "$lastBuildNumber"
                        def newImageName = "bhoomika2897n/nodeimage1:${currentBuildNumber}"
                        def lastImageName = "bhoomika2897n/nodeimage1:${lastBuildNumber}"
                        echo "$newImageName"
                        echo "$lastImageName"
                        

                    // Build your Docker image (replace 'my-docker-image' and 'latest' with your image name and tag)
                    def dockerImage = docker.build(newImageName, '.')
                    
                    // Authenticate with a Docker registry (e.g., Docker Hub)
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        // Push the Docker image
                         dockerImage.push()
                    }
                }
            }
        }
    }
}
