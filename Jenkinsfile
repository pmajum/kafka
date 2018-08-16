def label = "agent-k8s-${UUID.randomUUID().toString()}"
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
 - name: gradle
   image: gradle:latest
   tty: true
   securityContext:
     runAsUser: 1000

"""
//timestamps { 
  podTemplate(label: label, yaml: yaml){
    node(label) {
      sh 'id'
      stage('Run on k8s'){
        container('gradle') {
          sh 'id'
        }
        
      }
    }
  }
//}
