pipeline {
    agent any

    environment {
        REPO="git@github.com:seytech-devops/jenkins.git"
        SSHKEY="sshkey"
    }

    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '7', numToKeepStr: '5')
    }

    parameters {
        string(name: "BRANCH_NAME", defaultValue:"", description: "The Git Branch name to build from")
    }
    
    stages {
        // stage("Code Checkout"){
        //     steps{
        //         git branch: "${params.BRANCH_NAME}", credentialsId: "${SSHKEY}", url: "${env.REPO}"
        //     }
        // }
        stage('SCM Checkout'){
            steps{
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[credentialsId: "${SSHKEY}", url: "${REPO}"]])
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