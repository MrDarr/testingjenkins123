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


}
}
