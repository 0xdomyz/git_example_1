git log --oneline

# make example
git checkout master
Remove-Item -Recurse -Force .\script_*.sql
Copy-Item -Recurse -Force .\squash_example\script_0.sql .
git add .
git commit -m "master commit"

git branch feat
git checkout feat

Copy-Item -Recurse -Force .\squash_example\script_1.sql .
git add .
git commit -m "Add script_1.sql"

Copy-Item -Recurse -Force .\squash_example\script_2.sql .
git add .
git commit -m "Add script_2.sql"

Copy-Item -Recurse -Force .\squash_example\script_3.sql .
git add .
git commit -m "Add script_3.sql"


git pull

git checkout -b feature-pr1
git cherry-pick <commit1> <commit2>

git checkout master
git checkout -b feature-pr2
git cherry-pick <commit3>

git checkout master
git checkout -b feature-pr3
git cherry-pick <commit4> <commit5>

git push -u origin feature-pr1
git push -u origin feature-pr2
git push -u origin feature-pr3