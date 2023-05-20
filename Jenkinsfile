pipeline {
    agent any

    environment {
        REPO="git@github.com:seytech-devops/jenkins.git"
    }
    
    stages {
        stage("Code Checkout"){
            steps{
                git branch: "kanat", credentialsId: "sshkey", url: "${env.REPO}"
            }
        }
        stage("Change directory"){
            steps{
                sh "cd ${WORKSPACE}"
                sh "pwd"
            }
        }
    }
}