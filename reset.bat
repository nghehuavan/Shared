@echo off
:CD ..
@echo "@@ Reset And Pull All File @@"
SET /P sComment= Enter for PULL ?

@echo "@@ Revert File .... @@"
git reset --hard
@echo "@@ Pull File .... @@"
git pull -v --progress "origin"

SET /P sComment= Enter for CLEAN-UP ?
git clean -d -f
git clean -d -f -X
pause