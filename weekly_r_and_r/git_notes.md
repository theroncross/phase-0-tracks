```
git remote -v
```
Shows all remote repositories for that branch
```
git remote add <remote_name> <URL>
```
*Adds a new remote repo to that branch
*Cloning automatically names the remote 'origin'
```
git fetch <remote_name>/<branch_name> <local_branch_name>
```
```
git merge <remote_name>/<branch_name> <local_branch_name>
```
OR
```
git pull <remote_name>/<branch_name> <local_branch_name>
```
*merges a remote branch into a local branch

[Pairing Workflow](https://gist.github.com/theroncross/a9b631e6198cfadcabcc)