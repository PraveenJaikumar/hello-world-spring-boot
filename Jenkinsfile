pipeline {
	agent any
		
	stages {
	stage('Checkout Source') {
		steps {
				echo 'Check out the project'
				checkout scm  
		}
		}


    stage('Build Docker Image'){
     steps {		
			bat 'docker build -t nginx .'
		}
   }

     stage('Push Docker Image'){
		steps {
        	echo 'connecting to ECR.. '
           withDockerRegistry([url: "https://310643530327.dkr.ecr.us-west-2.amazonaws.com/nginx",credentialsId: "ecr:us-west-2:aws-credentials"]) {
           bat 'docker tag nginx:latest 310643530327.dkr.ecr.us-west-2.amazonaws.com/nginx:latest'
	   bat 'docker push 310643530327.dkr.ecr.us-west-2.amazonaws.com/nginx:latest'
               }
	    }
	}

}
}
