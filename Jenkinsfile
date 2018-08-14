labelDind = "agent-k8s-${UUID.randomUUID().toString()}"
def yamlDinD = """
apiVersion: v1
kind: Pod
metadata:
  generateName: agent-k8s-
  labels:
    name: gradle
    label: gradle
spec:
  securityContext:
    runAsUser: 1000
  containers:
  - name: gradle
    image: gradle:4.5.1-jdk9
    tty: true
    securityContext:
      runAsUser: 0
      fsGroup : 0
      allowPrivilegeEscalation: false
"""
    podTemplate(label: labelDind, yaml:yamlDinD) {
          node(labelDind){
              stage('Build') {
      container('gradle') {
        sh "gradle build"
      }
    }
    stage('Create Docker images') {
      container('docker') {
        withCredentials([[$class: 'UsernamePasswordMultiBinding',
          credentialsId: 'dockerhub',
          usernameVariable: 'DOCKER_HUB_USER',
          passwordVariable: 'DOCKER_HUB_PASSWORD']]) {
          sh """
            docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PASSWORD}
            docker build -t namespace/my-image:${gitCommit} .
            docker push namespace/my-image:${gitCommit}
            """
        }
      }
    } 
              }
            }
          
    

