node {
    stage('Example') {
        if (env.BRANCH_NAME == 'master') {
            echo 'I only execute on the env.BRANCH_NAME'
        } else {
            echo 'I execute elsewhere env.BRANCH_NAME'
        }
    }
    stage('Checkout'){
        checkout scm
    }
    docker.image("openjdk:13-alpine").inside {
        stage('Build') {
            sh './gradlew clean build -x test'
        }
    }
    stage('build docker image'){
        sh 'docker build -t demo1ucb .'
    }

    if (env.BRANCH_NAME == 'master') {
        stage('test'){
            echo 'This is Branch name "${env.BRANCH_NAME}"'
        }
    }
    stage('Deploy') {
            when { tag "v*" }
            steps {
                echo 'Deploying only because this commit is tagged...'
                
            }
    }

}
