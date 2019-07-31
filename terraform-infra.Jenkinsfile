node() {
    ansiColor('xterm') {
        stage('Infrastructure Creation') {
            withCredentials([file(credentialsId: 'terraformcreds', variable: 'terracreds')]) {
            sh """
            echo "clean workspace"
            rm -rf *
            
            echo "Cloning git repo"
            git clone https://github.com/teju488407/project1.git
            cd ./project1
            
            cat $terracreds > creds.json
            cp creds.json ./project1
            
            echo "Initializing and Running Terraform"
            terraform -v
            terraform init
            terraform plan
            terraform apply -auto-approve
            """
            }
        }
    }
}