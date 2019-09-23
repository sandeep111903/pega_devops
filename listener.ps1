

$FTBM = '.\pega_root'
$FLTR = '*.*'

Unregister-Event FileDeletion
Unregister-Event FileChange
Unregister-Event FileCreated


$watcher = New-Object IO.FileSystemWatcher $FTBM, $FLTR -property @{IncludeSubDirectories = $false; NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'}

Register-ObjectEvent $watcher Created -SourceIdentifier FileCreated -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "This file: $name, was $changeType at $timeStamp!1"
Out-File -filepath 'C:\Users\rajxe\OneDrive\Desktop\listener\changeLogs.txt' -append -inputobject "This file: $name, was $changeType at $timeStamp!"

& ".\pusher.ps1"
}

Register-ObjectEvent $watcher Deleted -SourceIdentifier FileDeletion -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "This file: $name, was $changeType at $timeStamp!2"
Out-File -filepath 'C:\Users\rajxe\OneDrive\Desktop\listener\changeLogs.txt' -append -inputobject "This file: $name, was $changeType at $timeStamp!"
& ".\pusher.ps1"
}

Register-ObjectEvent $watcher Changed -SourceIdentifier FileChange -Action {
$name = $Event.SourceEventArgs.Name
$changeType = $Event.SourceEventArgs.ChangeType
$timeStamp = $Event.TimeGenerated
Write-Host "This file: $name, was $changeType at $timeStamp!3"
Out-File -filepath 'C:\Users\rajxe\OneDrive\Desktop\listener\changeLogs.txt' -append -inputobject "This file: $name, was $changeType at $timeStamp!"
& ".\pusher.ps1"
}

