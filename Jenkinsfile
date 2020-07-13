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
				  sh "docker build -t hoannk/kiot ."
			 }
		}
		stage('Docker push') {
			 steps {
				sh "docker login -u hoannk1 -p Kingofwarlock123." 
				sh "docker push hoannk/kiot"
			 }
		}
		stage('Deploy to staging') {
			 steps {
				  sh "docker run -d -p 8088:8088 --name kiot hoannk/kiot"
			 }
		}
	}
}