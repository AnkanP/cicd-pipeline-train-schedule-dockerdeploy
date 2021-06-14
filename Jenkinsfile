pipeline {
    agent { label 'agent' }
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh './gradlew build --no-daemon'
                archiveArtifacts artifacts: 'dist/trainSchedule.zip'
            }
        }
        stage('Build Docker Image') {
            when {
                branch 'master'
            }
            steps {
                script {
                    sh "docker build -t crawlerp/train-schedule ."
                    }
                }
            }
        
       
        stage('DeployToProduction') {
            when {
                branch 'master'
            }
            steps {
                input 'Deploy to Production?'
                milestone(1)
                    script {
                        
                        try {
                            sh "docker stop train-schedule"
                            sh "docker rm train-schedule"
                        } catch (err) {
                            echo: 'caught error: $err'
                        }
                        sh "docker run --restart always --name train-schedule -p 8080:8080 -d crawlerp/train-schedule:${env.BUILD_NUMBER}"
                    }
                
            }
        }
    }

}
