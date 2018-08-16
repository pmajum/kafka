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
  securityContext:
    runAsUser: 1000
  containers:
  - name: jnlp
    image: jenkins/jnlp-slave
    tty: true
    securityContext:
      runAsUser: 1000
      allowPrivilegeEscalation: false
  - name: gradle
    image: gradle:latest
    tty: true
    command: 'cat'
    securityContext:
      runAsUser: 1000
      privileged: true
"""
podTemplate(label: label, yaml:yamlDinD) {

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
