pipeline {
  agent {
    kubernetes {
      //cloud 'kubernetes'
      label 'mypod'
      containerTemplate {
        name 'gradle'
        image 'gradle:4.5.1-jdk9'
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
                          sh 'ls -lat'
                  }
              }
          }
           
           
   }
       
        
  
  
}
