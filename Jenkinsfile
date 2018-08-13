def label = "worker-${UUID.randomUUID().toString()}"
def yamlWorkAround = """
apiVersion: v1
kind: Pod
spec:
  securityContext:
    runAsUser: 1000
    fsGroup: 1000
  containers:
  - name: gradle
    image: gradle:4.5.1-jdk9
    tty: true
    securityContext:
      runAsUser: 1000
      fsGroup: 1000
      allowPrivilegeEscalation: false
  - name: docker
    image: docker
    tty: true
    securityContext:
      runAsUser: 1000
      fsGroup: 1000
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
