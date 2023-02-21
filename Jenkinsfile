pipeline {
  agent any
  // any, none, label, node, docker, dockerfile, kubernetes
  tools {
    gradle 'test-gradle'
  }
  environment {
    gitName = 'soojik'
    gitEmail = 'wltn2858@swu.ac.kr'
    githubCredential = 'github-jenkins'
    dockerHubRegistry = 'wltn2858/test-jenkins'
  }
  stages {
    stage('Checkout Github') {
      steps {
          checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: githubCredential, url: 'https://github.com/soojik/test-jenkins']]])
          }
      post {
        failure {
          echo 'Repository clone failure'
        }
        success {
          echo 'Repository clone success'  
        }
      }
    }

    stage('Gradle Build') {
      steps {
          sh 'gradle clean build'
          }
      post {
        failure {
          echo 'Gradle jar build failure'
        }
        success {
          echo 'Gradle jar build success'  
        }
      }
    }
    stage('Docker Image Build') {
      steps {
          sh "docker build -t ${dockerHubRegistry}:${currentBuild.number} ."
          sh "docker build -t ${dockerHubRegistry}:latest ."
          }
      post {
        failure {
          echo 'Docker image build failure'
        }
        success {
          echo 'Docker image build success'  
        }
      }
    }
  }
}
