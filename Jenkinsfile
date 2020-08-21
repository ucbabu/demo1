node {
    stage('Example') {
        if (env.BRANCH_NAME == 'master') {
            echo 'I only execute on the ${env.BRANCH_NAME}'
        } else {
            echo 'I execute elsewhere ${env.BRANCH_NAME}'
        }
    }
    stage('Build') {
        sh './gradlew build -x test'
    }
}
