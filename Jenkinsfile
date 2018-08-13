def label = "worker-${UUID.randomUUID().toString()}"
def yamlWorkAround = """
apiVersion: v1
kind: Pod
metadata:
  name: openwhisk-deploy-demo
spec:
  securityContext:
    runAsUser: 1000
    fsGroup: 1000
  volumes:
  - name: sec-ctx-vol
    emptyDir: {}
  containers:
  - name: gradle
    image: gradle:4.5.1-jdk9
    tty: true
    volumeMounts:
    - name: sec-ctx-vol
      mountPath: /data/demo
    securityContext:
      runAsUser: 1000
      fsGroup: 1000
      allowPrivilegeEscalation: false
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
        sh " groupadd -g 1000 jenkins"
        sh "useradd -u 1000 -g 1000 jenkins"
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
