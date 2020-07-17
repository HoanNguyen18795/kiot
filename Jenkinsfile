pipeline {
     agent any
     stages {
          stage('Clean') {
               steps {
                    sh "./gradlew clean --no-daemon"
               }
          }
          stage('Unit test') {
               steps {
                    sh "./gradlew test"
               }
          }
		stage('Package') {
			 steps {
				  sh "./gradlew -Pprod -Pwar bootWar -PnodeInstall --no-daemon"
			 }
		}
		stage('Docker build') {
			 steps {
				  sh "docker build -t hoannk1/kiot ."
			 }
		}
		stage('Docker push') {
			 steps {
				sh "docker login -u hoannk1 -p Kingofwarlock123." 
				sh "docker push hoannk1/kiot"
			 }
		}
		stage('Deploy to staging') {
			 steps {
				  sh "docker rm $(docker ps -a -q)"
				  sh "docker run -d -p 8088:8088 --name kiot hoannk1/kiot:latest"
			 }
		}
	}
}