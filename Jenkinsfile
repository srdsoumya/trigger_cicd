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
		stage('Init') {
			steps{
				withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
					script {
						def creds = readJSON text: secret
						env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
						env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
						env.AWS_DEFAULT_REGION = 'us-east-1'
					}
					ansiColor('xterm') {
						sh 'terraform init' //terraform -migrate-state or -reconfigure
					}
				}
			}	
		}
		stage('Plan') {
			steps{
				withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
					script {
						def creds = readJSON text: secret
						env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
						env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
						env.AWS_DEFAULT_REGION = 'us-east-1'
					}
					ansiColor('xterm') {
						sh 'terraform plan'
						sh 'terraform show'
					}
				}
			}	
		}
		stage('Apply') {
			steps{
				withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
					script {
						def creds = readJSON text: secret
						env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
						env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
						env.AWS_DEFAULT_REGION = 'us-east-1'
					}
					ansiColor('xterm') {
						sh 'terraform plan' //terraform --auto-approve
					}
				}
			}	
		}
		stage('Output') {
			steps{
				withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
					script {
						def creds = readJSON text: secret
						env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
						env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
						env.AWS_DEFAULT_REGION = 'us-east-1'
					}
					ansiColor('xterm') {
						sh 'terraform plan' //terraform output
					}
				}
			}	
		}
	}
}