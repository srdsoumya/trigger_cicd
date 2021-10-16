// Jenkinsfile
//String credentialsId = 'awsCredentials'

try {
  stage('Is Authorised?') {
    node {
      withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
        script {
            def creds = readJSON text: secret
            env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
            env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
            env.AWS_DEFAULT_REGION = 'us-east-1'
        }
        sh "aws sts get-caller-identity"
      }
    }
  }

  // Run terraform init
  stage('Init') {
    node {
      withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
          script {
              def creds = readJSON text: secret
              env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
              env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
              env.AWS_DEFAULT_REGION = 'us-east-1'
          }
          ansiColor('xterm') {
            sh 'terraform init'
          }
      }
    }
  }

  // Run terraform plan
  stage('Plan') {
    node {
      withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
          script {
              def creds = readJSON text: secret
              env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
              env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
              env.AWS_DEFAULT_REGION = 'us-east-1'
          }
          ansiColor('xterm') {
            sh 'terraform plan'
          }
      }
    }
  }

  if (env.BRANCH_NAME != 'master') {

    // Run terraform apply
    stage('Apply') {
      node {
        withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
          script {
              def creds = readJSON text: secret
              env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
              env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
              env.AWS_DEFAULT_REGION = 'us-east-1'
          }
          ansiColor('xterm') {
            sh 'terraform plan' //apply --auto-approve
          }
      }
    }
  }

    // Run terraform show
    stage('show') {
      node {
        withCredentials([string(credentialsId: 'test/acm/info', variable: 'secret')]) {
          script {
              def creds = readJSON text: secret
              env.AWS_ACCESS_KEY_ID = creds['accessKeyId']
              env.AWS_SECRET_ACCESS_KEY = creds['secretAccessKey']
              env.AWS_DEFAULT_REGION = 'us-east-1'
          }
          ansiColor('xterm') {
            sh 'terraform plan'
          }
      }
    }
  }
}
  currentBuild.result = 'SUCCESS'
}
catch (org.jenkinsci.plugins.workflow.steps.FlowInterruptedException flowError) {
  currentBuild.result = 'ABORTED'
}
catch (err) {
  currentBuild.result = 'FAILURE'
  throw err
}
finally {
  if (currentBuild.result == 'SUCCESS') {
    currentBuild.result = 'SUCCESS'
  }
}