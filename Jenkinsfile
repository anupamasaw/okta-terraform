pipeline {

  agent any
  stages {

    stage('TF Plan') {
      steps {
          sh 'terraform init'
          sh """
              terraform plan -var okta_group_name=${params.groupname}
              terraform plan -var okta_group_description=${params.description}
          """
        }
      }


    stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }

    stage('TF Apply') {
      steps {
          sh """
              terraform apply -input=false -auto-approve -var okta_group_name=${params.groupname}
          """
        }
      }
  }

}
