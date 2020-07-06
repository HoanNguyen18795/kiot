pipeline {
     agent any
     stages {
          stage('Compile') {
               steps {
                    sh "./gradlew compileJava"
               }
          }
          stage('Unit test') {
               steps {
                    sh "./gradlew test"
               }
          }
		stage('Package') {
			 steps {
				  sh "./gradlew build"
			 }
		}
		stage('Docker build') {
			 steps {
			      sh "sudo chmod 666 /var/run/docker.sock"
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
				  sh "docker run -d --rm -p 8088:8088 --name kiot hoannk/kiot"
			 }
		}
	}
}