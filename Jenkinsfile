node{
    stage('Auth') {
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
	stage('Init') {
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
	stage('Plan') {
		withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
			script {
				def creds = readJSON text: secret
				env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
				env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
				env.AWS_DEFAULT_REGION = 'us-east-1'
			}
			ansiColor('xterm') {
				sh 'terraform plan -out tfplan '
				sh 'terraform show -no-color tfplan > tfplan.txt'
			}
		}	
	}
	stage('Auto-Apply') {
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
	stage('Summary') {
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