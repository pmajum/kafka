def label = "mypod-${UUID.randomUUID().toString()}"
def yamlDinD = """
apiVersion: v1
kind: Pod
metadata:
 generateName: agent-k8s-
 labels:
   name: jnlp
   label: jnlp

spec:
 containers:
 - name: jnlp
   image: jenkins/jnlp-slave
   workingDir: '/home/jenkins'
   tty: true
   securityContext:
     runAsUser: 1000
"""
podTemplate(label: label, yaml:yamlDinD,containers: [
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
