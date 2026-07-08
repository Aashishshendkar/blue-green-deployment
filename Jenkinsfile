pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy to Green') {
            steps {
                sh 'chmod +x scripts/*.sh'
                sh './scripts/deploy.sh'
            }
        }

        stage('Health Check') {
            steps {
                sh './scripts/health-check.sh http://16.170.211.157'
            }
        }

        stage('Switch Traffic') {
            steps {
                sh './scripts/switch-traffic.sh'
            }
        }
    }

    post {

        success {
            echo 'Deployment Successful'
        }

        failure {
            echo 'Deployment Failed'
            sh './scripts/rollback.sh'
        }

        always {
            echo 'Pipeline Finished'
        }
    }
}