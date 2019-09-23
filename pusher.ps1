
$command='git add -A'
iex $command

$command='git commit -m "Auto Commit : '+$(Get-Date -format "MM-dd-yyyy_hh-mm-ss")+'"'
iex $command


$command='git -c diff.mnemonicprefix=false -c core.quotepath=false --no-optional-locks push -v --tags origin master:master'
iex $command

