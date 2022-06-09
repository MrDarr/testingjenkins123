pipeline{
    agent any 
tools {
  terraform 'terraform'
}


stages{
  
stage('image to ECR'){
    steps{
        sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 202467142321.dkr.ecr.us-east-1.amazonaws.com'
        
    }
}
stage('Git CheckOut'){
    steps{
       checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/MrDarr/testingjenkins123.git']]])
        sh 'cd ecr'
    }
}

stage('terraform init'){
   steps{
   sh '''cd ecr
terraform init'''
}
}


stage('Terraform init 2'){
    steps{
         sh '''cd other
         terraform init'''
    }
}
}
}
