pipeline {
    agent any
    stages {
       stage("Create docker repository"){
        steps {
            echo "aws create-repository --name mongo_db || true "
        }
       }

       stage("Build docker image"){
        steps {
            sh "docker logout"
            sh "cat regpwd.txt | docker login --username igwefredrickchiemeka@gmail.com --password-stdin"
            sh "docker build -t igfred/mongo_db:$BUILD_NUMBER ."
            sh "docker tag igfred/mongo_db:$BUILD_NUMBER igfred/mongo_db:latest "
        }
       }

       stage("Docker image scan"){
        steps {
            echo "synk notifications_api:v1 --policies 'novulno' "
        }
       }

      stage("Push image to registry"){
        steps {
            sh "docker push igfred/mongo_db:$BUILD_NUMBER"
            sh "docker push igfred/mongo_db:latest"
        }
      } 

     stage("deploy"){
        steps {
            sh "kubectl delete -f deploy || true "
            sh "kubectl apply -f deploy"
            sh "kubectl get deploy"
            sh "kubectl get nodes -o wide"
        }
     }   
    }
}
