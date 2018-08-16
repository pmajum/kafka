pipeline {
  agent {
    kubernetes {
      //cloud 'kubernetes'
      label 'mypod'
      containerTemplate {
        name 'maven'
        image 'maven:3.3.9-jdk-8-alpine'
        ttyEnabled true
        command 'cat'
      }
    }
  }
  stages {
          stage('CheckOut'){
              steps{
                  container('jnlp'){
                          git([url: 'https://github.com/pmajum/kafka.git', branch: 'master'])
                  }
              }
          }
          
          stage('Maven'){
              steps{
                  container('maven'){
                          sh 'ls -lat'
                  }
              }
          }
           
           
   }
       
        
  
  
}
