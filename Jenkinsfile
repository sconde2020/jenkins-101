pipeline {
   agent {
        label 'maître'
    }
    stages {
        stage('Example Build') {
            steps {
	        sh "echo 'Hello Maven'"
                sh 'mvn --version'
            }
        }
        
    }
}
