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
    workingDir: '/home/jenkins'
    tty: true
    securityContext:
      runAsUser: 1000
"""
podTemplate(label: labelDind,, yaml:yamlDinD,containers: [
    containerTemplate(name: 'docker', image: 'docker',       command: 'cat', ttyEnabled: true),
      containerTemplate(name: 'gradle', image: 'gradle:4.5.1-jdk9', command: 'cat', ttyEnabled: true),

 ],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) {
          node(labelDind){
              def myRepo = checkout scm
    def gitCommit = myRepo.GIT_COMMIT
    def gitBranch = myRepo.GIT_BRANCH
    def shortGitCommit = "${gitCommit[0..10]}"
    container('jnlp') {
          sh """
            id
            """
        }
        container('docker') {
          sh """
            id
            """
        }
    
      container('gradle') {
        sh "gradle build"
      }
      
    
      
    
              }
            }
