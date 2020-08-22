node {
    stage('Example') {
        if (env.BRANCH_NAME == 'master') {
            echo 'I only execute on the ${env.BRANCH_NAME}'
        } else {
            echo 'I execute elsewhere ${env.BRANCH_NAME}'
        }
    }
    stage('Checkout'){
        checkout scm
    }
    stage('Build') {
        sh './gradlew clean build -x test'
    }
}
