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

# other stuff
git add .
git commit -m "change 4"


# graph
e11e416 (HEAD -> feat) change 4
c2565b4 Add script_3.sql
a5e4e13 Add script_2.sql
331c2f9 Add script_1.sql


# squash
git checkout master

git checkout -b feature-pr1
git cherry-pick e11e416 331c2f9

git checkout master
git checkout -b feature-pr2
git cherry-pick c2565b4 a5e4e13

git push -u origin feature-pr1
git push -u origin feature-pr2