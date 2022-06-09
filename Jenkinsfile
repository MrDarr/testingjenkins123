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
   sh '''cd ecr
terraform init'''

}
stage('Terraform plan'){
    sh '''cd ecr
terraform plan'''
}



stage('image to ECR'){
    steps{
        sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 202467142321.dkr.ecr.us-east-1.amazonaws.com'
        sh 'docker tag demo-repo:latest 202467142321.dkr.ecr.us-east-1.amazonaws.com/demo-repo:latest'
        docker push 202467142321.dkr.ecr.us-east-1.amazonaws.com/demo-repo:latest

    }
}
stage('Terraform init'){
    steps{
         sh '''cd other
         terraform init'''
    }
}
stage('Terraform plan'){
    sh '''cd other
terraform plan'''
}

}
}
