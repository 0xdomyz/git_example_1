Copy-Item -Recurse -Force .\no_vcs\version1_step1\* .
git add .
git commit -m "V1 step1: initial workflow snapshot"
git push

Remove-Item -Recurse -Force .\main
Copy-Item -Recurse -Force .\no_vcs\version1_step2\* .
git add .
git commit -m "V1 step2: additional workflow changes"
git push

Remove-Item -Recurse -Force .\main
Remove-Item -Recurse -Force .\v1
Copy-Item -Recurse -Force .\no_vcs\version2\* .
git add .
git commit -m "V2: large workflow update"
git push

Remove-Item -Recurse -Force .\main
Remove-Item -Recurse -Force .\archive
