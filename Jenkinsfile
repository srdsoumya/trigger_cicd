pipeline {
	agent any
	stages {
		stage('Auth') {
			steps{
				withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
					script {
						def creds = readJSON text: secret
						env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
						env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
						env.AWS_DEFAULT_REGION = 'us-east-1'
					}
					ansiColor('xterm') {
						//sh 'aws sts get-caller-identity'
						sh 'aws --version'

					}
				}
			}	
		}
	}
}