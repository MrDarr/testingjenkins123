pipeline{
    agent any 
tools {
  terraform 'terraform'
}


stages{
  
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

    stage('Terraform plan'){
        steps{
          sh '''cd ecr
         terraform plan'''
       }
    }

stage('Terraform init 2'){
    steps{
         sh '''cd other
         terraform init'''
    }
}
stage('Terraform plan2'){
steps{
    sh '''cd other
terraform plan'''
}
}
stage('Build image'){
    steps{
        script{
          
            app = docker.build("testingjenkins123/javacode")
             sh 'cd javacode'
        }
    }
}
stage('image to ECR'){
    steps{
        sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 202467142321.dkr.ecr.us-east-1.amazonaws.com'
       
    }
}
}
}
