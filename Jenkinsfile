labelDind = "agent-k8s-${UUID.randomUUID().toString()}"
podTemplate(label: labelDind,containers: [
    containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave', workingDir: '/home/jenkins',runAsUser: 1000),
    containerTemplate(name: 'docker', image: 'docker',       command: 'cat', ttyEnabled: true),
      containerTemplate(name: 'gradle', image: 'gradle:4.5.1-jdk9', command: 'cat', ttyEnabled: true),

 ],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
]) {
          node(labelDind){
              stage('Build') {
      container('jnlp') {
        sh "id"
      }
      container('docker') {
        sh "id"
      }
      
    }
    
              }
            }
