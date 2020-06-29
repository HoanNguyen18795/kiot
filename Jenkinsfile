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
	}
stage('Package') {
     steps {
          sh "./gradlew build"
     }
}
stage('Docker build') {
     steps {
      
          sh "docker build -t hoannguyen/kiot ."
     }
}
stage('Docker push') {
     steps {
        sh "docker login -u hoannk1 -p Kingofwarlock123."
        sh "docker push hoannguyen/kiot"
     }
}
stage('Deploy to staging') {
     steps {
          sh "docker run -d --rm -p 4443:4443 --name kiot hoannguyen/kiot"
     }
}
}