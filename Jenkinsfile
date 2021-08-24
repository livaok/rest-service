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

                        return !openshift.selector("bc", "test").exists();

                    }

                }

            }

            steps {

                script {

                    openshift.withCluster() {

                        openshift.newBuild("--name=test", "--image-stream=openjdk:8-jdk-alpine", "--binary")

                    }

                }

            }

        }

        stage('Build Image') {

            steps {

                script {

                    openshift.withCluster() {

                        openshift.selector("bc", "test").startBuild("--from-file=target/rest-service-0.0.1-SNAPSHOT.jar", "--wait")

                    }

                }

            }

        }

        stage('Promote to DEV') {

            steps {

                script {

                    openshift.withCluster() {

                        openshift.tag("test:latest", "test:dev")

                    }

                }

            }

        }

        stage('Create DEV') {

            when {

                expression {

                    openshift.withCluster() {

                        return !openshift.selector('dc', 'test-dev').exists()

                    }

                }

            }

            steps {

                script {

                    openshift.withCluster() {

                        openshift.newApp("test:latest", "--name=test-dev").narrow('svc').expose()

                    }

                }

            }

        }

    }

}