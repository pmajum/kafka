labelDind = "agent-k8s-${UUID.randomUUID().toString()}"
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
      runAsUser: 2000
      allowPrivilegeEscalation: false
  - name: dind
    image: docker:dind
    tty: true
    securityContext:
      runAsUser: 0
      privileged: true
"""
    podTemplate(label: labelDind, yaml:yamlDinD) {
          node(labelDind){
            stage('Build Docker Image'){
                sh "id"
                  container('jnlp'){
                     sh "id"
                  }
                  container('dind'){
                     sh "id"
                     sh "docker version"
                 }
                }
              }
            }
          
    

