def label = "mypod-${UUID.randomUUID().toString()}"
podTemplate(label: label, runAsUser: 0, fsGroup: 0,containers: [
    containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'gradle', image: 'gradle:latest', ttyEnabled: true, command: 'cat')
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

        stage('Get a Gradle project') {
           
            container('gradle') {
                stage('Build a Gradle project') {
                   sh 'ls -lat'
                }
            }
        }

    }
}
