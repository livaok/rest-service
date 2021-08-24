pipeline {

    agent {

        label 'maven'

    }

    stages {

        stage('Build App') {

            steps {

                sh "mvn install"

            }

        }

        stage('Create Image Builder') {

            when {

                expression {

                    openshift.withCluster() {

                        return !openshift.selector("bc", "mapit").exists();

                    }

                }

            }

            steps {

                script {

                    openshift.withCluster() {

                        openshift.newBuild("--name=TEST", "--image-stream=openjdk:8-jdk-alpine", "--binary")

                    }

                }

            }

        }

        stage('Build Image') {

            steps {

                script {

                    openshift.withCluster() {

                        openshift.selector("bc", "TEST").startBuild("--from-file=target/rest-service-0.0.1-SNAPSHOT.jar", "--wait")

                    }

                }

            }

        }

        stage('Promote to DEV') {

            steps {

                script {

                    openshift.withCluster() {

                        openshift.tag("TEST:latest", "TEST:dev")

                    }

                }

            }

        }

        stage('Create DEV') {

            when {

                expression {

                    openshift.withCluster() {

                        return !openshift.selector('dc', 'TEST-dev').exists()

                    }

                }

            }

            steps {

                script {

                    openshift.withCluster() {

                        openshift.newApp("TEST:latest", "--name=TEST-dev").narrow('svc').expose()

                    }

                }

            }

        }

    }

}