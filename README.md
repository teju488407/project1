# Project-1 sk

Launching kubernetes cluster using Terraform.

### Configuring github

1. SetUp a github account : https://github.com
2. Create a repository in your github account.
3. Create a working directory of you machine/VM.\
   `mkdir project` --> `cd project`
4. In that particular directory run - `git init`
5. Create the required files in the directrory.\
   `git add <filename>`\
   `git commit -m "commit_message"`  
6. Adding the remote url or setting the new one.\
   `git remote add origin https://github.com/username/reponame` - have to use github username & password every time you push to github.\
   `git remote add origin git@github.com:username/reponame` - have to use SSH keys push to github.\
   The above two commands are used to add a new remote URL of github\
   `git remote set-url origin git@github.com:User/reponame.git` - to change the url of an existing remote repository\
   **Reference URL** : https://help.github.com/en/articles/about-ssh
7. Add SSH public key in github. Goto **`settings`** --> **`SSH and GPG keys`** --> add the _public key_ --> **`save`** (It will prompt for password)
8. Verify the SSH connection using the command `ssh -T git@github.com`
9. Push the changes to git `git push -u origin <branch_name>`

    