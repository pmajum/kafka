label = "agent-k8s-${UUID.randomUUID().toString()}"
podTemplate(label: label,containers: [
    containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave', workingDir: '/home/jenkins'),
    containerTemplate(name: 'docker', image: 'docker:17.04.0-git',command: 'cat', ttyEnabled: true),
      containerTemplate(name: 'gradle', image: 'gradle:4.5.1-jdk9', command: 'cat', ttyEnabled: true),

 ],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) {
  node(label) {
    
    stage('Build') {
      container('gradle') {
        sh "id"
      }
    }
    
    
  }
}
