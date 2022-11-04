def COLOR_MAP = [
    'SUCCESS': 'goog',
    'FAILURE': 'danger',
]



pipeline {
    agent any

    stages {
        stage('GITcheckout') {
            steps {
                echo 'adding codes'
                git branch: 'main', url: 'https://github.com/fotsoosee/airbnb-infra.git'
            }
        }
        stage('verify terraform version') {
            steps {
                echo 'verifiying the terraform version'
                sh 'terraform --version'
            }
        }
       stage('terraform init') {
            steps {
                echo 'initialazing the terraform projet'
                sh 'terraform init'
            }
        }
        stage('terraform validate') {
            steps {
                echo 'terraform for validation'
                sh 'terraform validate'
            }
        }
        stage('terraform plan') {
            steps {
                echo 'terraform plan for dry run'
                sh 'terraform plan'
            }
        }
        stage('checkov scan') {
            steps {
                sh """
               sudo pip3 install checkov
               checkov -d . --skip-check CKV_AWS_79
                """
            }
        }
        stage('terraform manual approval') {
            steps {
                input 'approval needed for deployment '
            }
        }
        stage('terraform apply') {
            steps {
               input 'sudo terraform apply --auto-approve'
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
             slackSend channel: '#glorious-w-f-devops-alerts', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
}