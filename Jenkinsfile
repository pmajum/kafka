pipeline {
  agent {
    kubernetes {
      //cloud 'kubernetes'
      label 'mypod'
      containerTemplate {
        name 'golang'
        image 'golang:1.10-alpine'
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
          
          stage('Gradle Build'){
              steps{
                  container('golang'){
                          sh 'ls -lat'
                  }
              }
          }
           
           
   }
       
        
  
  
}
