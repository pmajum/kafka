def label = "agent-k8s-${UUID.randomUUID().toString()}"

podTemplate(label: label,containers: [
    containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave:latest', args: '${computer.jnlpmac} ${computer.name}'),
    containerTemplate(name: 'gradle', image: 'prasenjit/gradle:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),

],volumes: [
        hostPathVolume(
            hostPath: '/var/run/docker.sock',
            mountPath: '/var/run/docker.sock'
        ),
        hostPathVolume(mountPath: '/home/gradle/.gradle', hostPath: '/tmp/jenkins/.gradle'),
    ]) {

 node(label) {

        stage('Get a Gradle project') {
            checkout scm
            container('gradle') {
                stage('Build a Gradle project') {
                   sh """
                        cd source-code
                        gradle
                        ./gradlew clean
                        ./gradlew releaseTarGz
                      """
                   
                }
            }
        }
     
     stage('Build Docker image'){
         container('docker'){
             sh """
             docker build -t openwhisk/kafka .
             docker tag openwhisk/kafka mycluster.icp:8500/openwhisk/kafka:v2
             docker push mycluster.icp:8500/openwhisk/kafka:v2
             """
         }
         
     }

    }
}
