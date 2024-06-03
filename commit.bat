@echo off
:CD ..
set excludeFileName=exclude.lst
set excludeFileFullPath=%CD%\%excludeFileName%
:begin
@echo "@@ Commit And Push All File @@"
SET /P sComment=Please comment for commit (empty is default):

git add --all

@IF %sComment%.==. GOTO defaultComment
GOTO userComment

:defaultComment
git commit -m "[--]"
goto push

:userComment
git commit -m "%sComment%"

:push
git push --all --thin --progress "origin"
:end
pause
cls