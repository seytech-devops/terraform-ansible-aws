pipeline {
    agent any

    // global environments
    environment {
        REPO="git@github.com:seytech-devops/terraform-ansible-aws.git"
        SSHKEY="sshkey"
    }

    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: "", artifactNumToKeepStr: "", daysToKeepStr: "7", numToKeepStr: "5")
    }

    parameters {
        string(name: "BRANCH_NAME", defaultValue:"", description: "The Git Branch name to build from")
        choice choices: ["init", "plan", "apply", "destroy"], description: "The terraform options to apply to", name: "TFCHOICE"
    }
    
    stages {
        stage("SCM Checkout"){
            steps{
                checkout scmGit(branches: [[name: "**"]], extensions: [], userRemoteConfigs: [[credentialsId: "${SSHKEY}", url: "${REPO}"]])
            }
        }
        stage("Change directory"){
            steps{
                sh """
                cd ${WORKSPACE}
                pwd
                whoami
                """
            }
        }
        stage("Terraform init"){
            steps{
                sh """
                terraform --version
                cd ${WORKSPACE}/terraform
                terraform init -no-color
                """
            }
        }
        stage("Terraform plan"){
            steps{
                sh """
                cd ${WORKSPACE}/terraform
                terraform plan -no-color
                """
            }
        }
        stage("Terraform apply"){
            when {
                beforeInput true 
                expression {
                    return (params.TFCHOICE == "apply" || params.TFCHOICE == "destroy")
                }
            }
            steps {
                script {
                    env.SELECTED_CHOICE = input message: "Please approve", ok: "deploy", parameters: [choice(choices: ["--auto-approve", "no"], description: "Approve or Cancel", name: "SELECTED_CHOICE")], submitter: "casesuroo"
                }
                echo "${env.SELECTED_CHOICE}"
                sh """
                cd ${WORKSPACE}/terraform
                terraform ${params.TFCHOICE}  -no-color  ${env.SELECTED_CHOICE}
                """
            }
        }
        stage("Clean Workspace"){
            steps{
                cleanWs()
            }
        }
    }
}