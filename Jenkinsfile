def label = "worker-${UUID.randomUUID().toString()}"
def yamlWorkAround = """
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


podTemplate(label: label, yaml: yamlWorkAround) {
  node(label) {
    def myRepo = checkout scm
    def gitCommit = myRepo.GIT_COMMIT
    def gitBranch = myRepo.GIT_BRANCH
    def shortGitCommit = "${gitCommit[0..10]}"
    def previousGitCommit = sh(script: "git rev-parse ${gitCommit}~", returnStdout: true)
 
    
    stage('Build') {
      container('gradle') {
        sh "gradle build"
      }
    }

  }
}
