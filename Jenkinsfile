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
          
          stage('Gradle Build'){
              steps{
                  container('gradle'){
                          sh 'gradle -version'
                  }
              }
          }
           
           
   }
       
        
  
  
}
