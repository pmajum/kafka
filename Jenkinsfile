labelDind = "agent-k8s-${UUID.randomUUID().toString()}"
podTemplate(label: labelDind,containers: [
    containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave', workingDir: '/home/jenkins'),
    containerTemplate(name: 'docker', image: 'docker:17.04.0-git',       command: 'cat', ttyEnabled: true),
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
          
    

