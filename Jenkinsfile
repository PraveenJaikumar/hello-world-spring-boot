pipeline {
	agent any
	tools {
        	tool name: 'terraform', type: 'terraform'
        }	
	stages {
	stage('Checkout Source') {
		steps {
				echo 'Check out the project'
				checkout scm  
		}
		}
    stage('Maven Building Artifacts'){
        steps {			
			bat "mvn clean package"
		}
	}	

    stage('Build Docker Image'){
     steps {		
			bat 'docker build -t spring123 .'
		}
   }

     stage('Push Docker Image'){
		steps {
        	echo 'connecting to ECR.. '
           withDockerRegistry([url: "https://310643530327.dkr.ecr.us-west-2.amazonaws.com/spring123",credentialsId: "ecr:us-west-2:aws-credentials"]) {
           bat 'docker tag spring123:latest 310643530327.dkr.ecr.us-west-2.amazonaws.com/spring123:latest'
	   bat 'docker push 310643530327.dkr.ecr.us-west-2.amazonaws.com/spring123:latest'
               }
	    }
	}
	
	stage('Terraform Init'){
        steps {			
		        	echo 'Terraform Init.. '

		bat "terraform init"
		}
	}	
	

}
}
