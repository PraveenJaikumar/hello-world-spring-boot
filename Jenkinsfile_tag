pipeline {
	agent any
	tools {
        maven 'maven-3.6.3' 
        }
	environment {
		version = "${BUILD_NUMBER}"
		project = 'clxrepx'
		image = "$project:$version"
	}	
	stages {

    stage('Build Docker Image'){
     steps {	
     		echo "Current Build Number is : ${BUILD_NUMBER}"
     		echo "Current Build Number is : ${version}"
     		echo "Current Image Name is : ${image}"
			script{
			//bat 'docker build -t clxrepx .'
			docker.build('clxrepx')
			}
		}
   }
   
     stage('Push NGINX Docker Image'){
		steps {
		script{
        	echo 'connecting to ECR Inside Script.. '
			docker.withRegistry('https://310643530327.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:aws-credentials') {
			//docker.image('clxrepx').push('${version}')
			docker.image('clxrepx').push("${env.BUILD_NUMBER}")

			}
			  }
	    }
	}

}
}
