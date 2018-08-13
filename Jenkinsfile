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
  - name: gradle
    image: gradle:4.5.1-jdk9
    tty: true
    securityContext:
      runAsUser: 0
      allowPrivilegeEscalation: false
"""
    podTemplate(label: labelDind, yaml:yamlDinD) {
          node(labelDind){
            stage('Build Docker Image'){
                sh "id"
                  container('gradle'){
                     sh "id"
                  }
                }
              }
            }
          
    

