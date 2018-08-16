pipeline {
  agent {
    kubernetes {
      //cloud 'kubernetes'
      label 'mypod'
      
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  containers:
  - name: golang
    image: golang:1.10
    command:
    - cat
    tty: true
"""
      
      /*containerTemplate {
        name 'gradle'
        image 'gradle:latest'
        ttyEnabled true
        command 'cat'
      }*/
    
      
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
                  container('golang'){
                          sh 'ls -lat'
                  }
              }
          }
           
           
   }
       
        
  
  
}
