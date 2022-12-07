pipeline{
    agent any
    stages {
        stage('git checkout'){
            steps{
                git credentialsId:'github_credentials',url:'https://github.com/quentinleguellanff/simple-java-maven-app'
            }
        }
        stage('build the app'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('test the app'){
            steps{
                sh 'mvn test'
            }
        }
        stage('build docker image'){
            steps{
                sh 'docker build --tag qleguellanff/java-hello-world .'
            }
        }
        stage('push docker image'){
            steps{
                withCredentials([string(credentialsId: 'dockerhubpass', variable:'dockerHubPass')]) {
                    sh 'docker login -u qleguellanff -p $dockerHubPass'
                }
                sh 'docker push qleguellanff/java-hello-world'
            }
        }
    }
	post{
		failure{
			emailext body: 'Ce Build $BUILD_NUMBER a échoué',
			recipientProviders:[requestor()],
			subject: 'build',
			to:	'quentinleguellanff@gmail.com'
		}
	}
}