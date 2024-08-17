pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh '''#!/bin/bash
                python3.7 -m venv venv
                source venv/bin/activate
                pip install --upgrade pip
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''#!/bin/bash
                chmod +x system_resources_test.sh
                ./system_resources_test.sh
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''#!/bin/bash
                source venv/bin/activate
                eb create [enter-name-of-environment-here] --single
                '''
            }
        }
    }
}

