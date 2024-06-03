@echo off
echo "Clear all history commit"
pause

git checkout --orphan latest_branch
git add .
git commit -m "clear history"
git branch -D main
git branch -m main
git push -f origin main


