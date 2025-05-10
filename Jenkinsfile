pipeline {
  agent any

  environment {
    // capture the short commit hash
    COMMIT = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
  }

  stages {
    stage('Test') {
      steps {
        sh "docker run --rm -w /app -v \$(pwd):/app node:10.17.0 bash -c 'npm i -D && npm run test && rm -rf node_modules/'"
      }
    }

    stage('Package') {
      steps {
        sh "chmod +x ./scripts/build.sh"
        // pass COMMIT to build.sh
        sh "./scripts/build.sh ${COMMIT}"
      }
    }

    stage('Deploy') {
      steps {
        sh "chmod +x ./scripts/deploy.sh"
        // pass COMMIT to deploy.sh
        sh "./scripts/deploy.sh ${COMMIT}"
      }
    }
  }
}

