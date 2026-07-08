pipeline {
    agent any

    environment {
        APP_URL = "http://16.170.211.157"
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out source code...'
                checkout scm
            }
        }

        stage('Deploy to Green') {
            steps {
                echo 'Deploying application to Green server...'
                sh 'chmod +x scripts/*.sh'
                sh './scripts/deploy.sh'
            }
        }

        stage('Health Check') {
            steps {
                echo 'Running health check...'
                sh './scripts/health-check.sh ${APP_URL}'
            }
        }

        stage('Switch Traffic') {
            steps {
                echo 'Switching ALB traffic to Green Target Group...'
                sh './scripts/switch-traffic.sh'
            }
        }
    }

    post {

        success {
            echo '========================================='
            echo ' Blue-Green Deployment Successful'
            echo '========================================='
        }

        failure {
            echo 'Deployment Failed'
            echo 'Rolling back...'
            sh './scripts/rollback.sh'
        }
    }
}