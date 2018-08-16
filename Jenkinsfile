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
                          git([url: 'https://github.com/pmajum/kafka.git', branch: 'master'])
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
