pipeline {
    agent any

    environment {
        REPO="git@github.com:seytech-devops/jenkins.git"
        SSHKEY="sshkey"
    }

    parameters {
        string(name:BRANCH_NAME, defaultValue:"", description: "The Git Branch name to build from")
    }
    
    stages {
        stage("Code Checkout"){
            steps{
                git branch: "${params.BRANCH_NAME}", credentialsId: "${SSHKEY}", url: "${env.REPO}"
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