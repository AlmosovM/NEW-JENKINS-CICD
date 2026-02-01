pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Unit Tests') {
            steps {
                sh 'bash jenkinsscript.sh'
            }
        }

        stage('Publish Junit report') {
            steps {
                junit 'xmlReport/output.xml'
            }
        }

        stage('Publish Code Coverage') {
            steps {
                cobertura path: 'coverage.xml'
            }
        }
    }
}
