
$command='git add -A'
iex $command

$command='git commit -m "Auto Commit : '+$(Get-Date -format "MM-dd-yyyy_hh-mm-ss")+'"'
iex $command