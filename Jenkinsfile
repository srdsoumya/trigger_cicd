pipeline {
	agent any
	environment { 
        YOUR_CRED = credentials('test/acm/info') 
    }
	stages {
		stage('Init') {
			steps {
				sh 'terraform init -no-color'
			}
		}
		stage('Plan') {
			steps {
				sh 'terraform plan -no-color'
			}
		}
		stage('Apply') {
			steps {
				sh 'terraform plan -no-color'
			}
		}
		stage('Result') {
			steps {
				sh 'terraform plan -no-color'
			}
		}
	}

	post {
		always {
			archiveArtifacts artifacts: 'tfplan.txt'
		}
	}
}