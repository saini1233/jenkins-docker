pipeline {
  agent any
  environment {
    DOCKER_IMAGE = "myapps"
    DOCKER_TAG = "v1"
    WAR_FILE = "*.war"
  }
  stages {
    stage('Clone Repository') {
      steps {
        sh 'git clone -b main https://github.com/saini1233/jenkins-docker.git'
      }
    }
    stage('Build') {
      steps {
        dir('jenkins-docker.git') {
          sh 'mvn clean install -U'
        }
      }
    }
    stage('Build Docker image') {
      steps {
        script {
          sshagent(['dockerserver']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.83.105.94 "docker build -t $DOCKER_IMAGE:$DOCKER_TAG ."'
          }
        }
      }
    }
    stage('RUN Docker Container') {
      steps {
        script {
          sshagent(['dockerserver']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@54.83.105.94 "docker run -d --name container1 -v $WORKSPACE/$WAR_FILE:/usr/local/tomcat/webapps/ROOT.war $DOCKER_IMAGE:$DOCKER_TAG"'
          }
        }
      }
    }
  }
  // post {
  //   failure {
  //     mail to: 'your-email@example.com',
  //          subject: "Pipeline Failed: ${currentBuild.fullDisplayName}",
  //          body: "Something went wrong. Please check the Jenkins logs."
  //   }
  // }
}


// pipeline {
//     agent any

//     environment {
//         DOCKER_IMAGE = "myapp"
//         DOCKER_TAG = "v1"
//         SSH_KEY = "~/.ssh/authorized_keys"
//         TOMCAT_IMAGE = "tomcat:latest"
//     }

//     tools {
//         // Install the Maven version configured as "M3" and add it to the path.
//         maven "M3"
//     }

//     stages {
//         stage('Build') {
//             steps {
//                 // Get some code from a GitHub repository
//                 git branch: 'main', url: 'https://github.com/saini1233/jenkins-docker.git'

//                 // Run Maven on a Unix agent.
//                 sh "mvn -Dmaven.test.failure.ignore=true clean package"
//             }
//         }

//         stage('Docker Build') {
//             steps {
//                 script {
//                         sh 'scp -o StrictHostKeyChecking=no Dockerfile ./target/*.jar  ubuntu@98.83.207.43:'
//                         sh 'ssh -o StrictHostKeyChecking=no ubuntu@98.83.207.43 "sudo docker build -t $DOCKER_IMAGE:$DOCKER_TAG ."'
//                 }
//             }
//         }
//     }
// }
