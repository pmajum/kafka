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
    fsGroup: 1000
  containers:
  - name: jnlp
    image: jenkins/jnlp-slave
    tty: true
    securityContext:
      runAsUser: 1000
      allowPrivilegeEscalation: false
  - name: docker
    image: docker:dind
    tty: true
    securityContext:
      runAsUser: 0
      privileged: true
  
"""
    podTemplate(label: labelDind, yaml:yamlDinD,containers: [
  containerTemplate(name: 'gradle', image: 'gradle:3.3-jdk9', command: 'cat', ttyEnabled: true)
  ],
volumes: [
  hostPathVolume(mountPath: '/home/gradle/.gradle', hostPath: '/tmp/jenkins/.gradle'),
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) {
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
          
    

