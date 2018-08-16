def labelDind = "agent-k8s-${UUID.randomUUID().toString()}"
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
    containerTemplate(name: 'gradle', image: 'gradle:4.5.1-jdk9', command: 'cat', ttyEnabled: true),

]) {

 node(label) {

        stage('Get a Gradle project') {
            checkout scm
            container('gradle') {
                stage('Build a Gradle project') {
                   sh 'ls -lat'
                }
            }
        }

    }
}
