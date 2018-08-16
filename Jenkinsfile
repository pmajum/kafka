def label = "agent-k8s-${UUID.randomUUID().toString()}"

podTemplate(label: label,containers: [
    containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave:latest', args: '${computer.jnlpmac} ${computer.name}'),
    containerTemplate(name: 'gradle', image: 'prasenjit/gradle:latest', command: 'cat', ttyEnabled: true)

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
                        gradle -g /tmp
                        ./gradlew clean
                        ./gradlew releaseTarGz
                    """
                   
                }
            }
        }

    }
}
