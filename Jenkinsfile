pipeline {
  agent {
    kubernetes {
      //cloud 'kubernetes'
      label 'mypod'
      
      containerTemplate {
        name 'gradle'
        image 'gradle:latest'
        ttyEnabled true
        command 'cat'
      }
      
      containerTemplate {
        name 'maven'
        image 'maven:latest'
        ttyEnabled true
        command 'cat'
      }
    
      
    }
  }
  stages {
          stage('CheckOut'){
              steps{
                  container('jnlp'){
                         checkout scm
                  }
              }
          }
    
          stage('Maven Build'){
              steps{
                  container('maven'){
                          sh 'ls -lat'
                  }
              }
          }
          
          stage('Gradle Build'){
              steps{
                  container('gradle'){
                          sh 'ls -lat'
                  }
              }
          }
           
           
   }
       
        
  
  
}
