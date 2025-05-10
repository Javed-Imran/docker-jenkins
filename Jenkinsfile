#!/usr/bin/env groovy
 pipeline {
   agent any
+  environment {
+    // get the short commit hash once
+    COMMIT = sh(script: 'git rev-parse --short HEAD', returnStdout: true).trim()
+  }
   stages {

     stage('test') {
       steps {
         sh "docker container run --rm -w /app -v \$(pwd):/app node:10.17.0 bash -c 'npm i -D && npm run test && rm -rf node_modules/'"
       }
     }

     stage('package') {
       steps {
         sh "chmod +x ./scripts/build.sh"
-        sh "./scripts/build.sh"
+        // pass the commit so build.sh can tag correctly
+        sh "./scripts/build.sh ${COMMIT}"
       }
     }

     stage('deploy') {
       steps {
         sh "chmod +x ./scripts/deploy.sh"
-        // whatever you have now
+        // pass the same commit to deploy.sh
+        sh "./scripts/deploy.sh ${COMMIT}"
       }
     }
   }
 }

