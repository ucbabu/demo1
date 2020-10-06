node {
    

    stage('Example') {
        if (env.BRANCH_NAME == 'master') {
            echo 'I only execute on the env.BRANCH_NAME'
            echo sh(resturnStdout: true, script: 'env')
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
            steps {
                def tag = sh(returnStdout: true, script: "git describe --tags")
                echo "Deploying only because this commit is tagged...${tag}"
                
            }
    }

}
