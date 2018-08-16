def label = "mypod-${UUID.randomUUID().toString()}"
def workspace = "/tmp/jenkins-${UUID.randomUUID().toString()}"
def name = 'jenkins'
def yaml = """
apiVersion: v1
kind: Pod
metadata:
  generateName: jnlp-
  labels:
    name: jnlp
    label: jnlp
spec:
  containers:
    - name: jnlp
    image: jenkins/jnlp-slave
    tty: true
    securityContext:
      runAsUser: 1000
      allowPrivilegeEscalation: false
    - name: jenkins
      image: jenkins/jenkins
      tty: true
      securityContext:
       runAsUser: 1000
       allowPrivilegeEscalation: false
"""
//timestamps { 
  podTemplate(label: label, yaml: yaml){
    node(label) {
      sh 'id'
      stage('Run on k8s'){
        container('jnlp') {
          sh 'id'
        }
        container(name) {
          sh 'id'
        }
      }
    }
  }
//}
