def label = "mypod-${UUID.randomUUID().toString()}"
def yamlDinD = """
apiVersion: v1
kind: Pod
metadata:
  labels:
    some-label: some-label-value
spec:
  containers:
  - name: gradle
    image: gradle:latest
    command:
    - cat
    tty: true
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
