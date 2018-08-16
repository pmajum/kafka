def label = "mypod-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
    containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'golang', image: 'golang:1.8.0', ttyEnabled: true, command: 'cat')
  ]) {

    node(label) {
        stage('Get a Maven project') {
            checkout scm
            container('maven') {
                stage('Build a Maven project') {
                    sh 'ls -lat'
                }
            }
        }

        stage('Get a Golang project') {
           
            container('golang') {
                stage('Build a Go project') {
                   sh 'ls -lat'
                }
            }
        }

    }
}
