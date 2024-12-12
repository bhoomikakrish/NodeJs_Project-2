pipeline {
    agent any
    tools {
        nodejs "node" // Ensure 'node' is configured in Jenkins Global Tool Configuration
    }
    
    environment {
        DOCKER_LOGIN = "docker_hub_credentials" // Docker Hub credentials ID
        IMAGE_NAME = "bhoomika2897n/nodejs-service2" // Docker image base name
    }
    
    parameters {
        choice(choices: ['main', 'master'], description: 'Select the branch name', name: 'BRANCH_NAME')
    }
    
    stages {
        stage('Node.js Version Check') {
            steps {
                echo "Checking the Node.js version..."
                sh 'node -v'
                sh 'which node'
            }
        }
        
        stage('Git Checkout') {
            steps {
                echo "Cloning the Git repository..."
                git branch: "${params.BRANCH_NAME}", url: "https://github.com/bhoomikakrish/NodeJs_Project-2.git"
            }
        }
        
        stage('Build') {
            steps {
                echo "Installing dependencies for Node.js application..."
                sh 'npm install'
            }
        }
        
        stage('Docker Build & Push') {
            steps {
                echo "Building and pushing the Docker image..."
                script {
                    def dockerImage = docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_LOGIN) {
                        dockerImage.push("${BUILD_NUMBER}") // Push with the build number as a tag
                        dockerImage.push('latest') // Push with the 'latest' tag
                    }
                }
            }
        }
    }
}
