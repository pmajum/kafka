def label = "agent-k8s-${UUID.randomUUID().toString()}"

podTemplate(label: label, yaml:yamlDinD,containers: [
    containerTemplate(name: 'gradle', image: 'gradle:4.5.1-jdk9', command: 'cat', ttyEnabled: true),

],volumes: [
        hostPathVolume(
            hostPath: '/var/run/docker.sock',
            mountPath: '/var/run/docker.sock'
        )
    ]) {

 node(label) {

        stage('Get a Gradle project') {
            checkout scm
            container('gradle') {
                stage('Build a Gradle project') {
                   sh 'ls -lat'
                }
            }
        }

    }
}
