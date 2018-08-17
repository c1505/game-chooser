pipeline {
    agent { docker { image 'ruby' } }
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
                sh 'echo "Hello World"'
            }
        }
    }
}
