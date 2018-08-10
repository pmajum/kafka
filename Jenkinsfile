podTemplate(
    label: 'mypod', 
    inheritFrom: 'default',
    containers: [
        containerTemplate(name: 'gradle', image: 'gradle:4.5.1-jdk9', command: 'cat', ttyEnabled: true),
        containerTemplate(
            name: 'docker', 
            image: 'docker:18.02',
            ttyEnabled: true,
            command: 'cat'
        )
    ],
    volumes: [
  hostPathVolume(mountPath: '/home/gradle/.gradle', hostPath: '/tmp/jenkins/.gradle'),
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
  ]
  )
  {
    node('mypod') {
        def commitId
        stage ('Extract') {
            checkout scm
            commitId = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
        }
        stage('Build') {
         container('gradle') {
           sh "sudo gradle build"
         }
       }
        def repository
        stage ('Docker') {
            container ('docker') {
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
            }}
        
    }
}
