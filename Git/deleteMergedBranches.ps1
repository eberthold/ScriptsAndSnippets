$branches = git branch --merged | %{ $_.Trim() } | Where-Object { $_ -ne "master" }
Write-Output "Delete following branches?"
Write-Output $branches
$choice = Read-Host '(y/n)'
if ($choice -eq 'y')
{
    git branch -d @($branches | Select-String -Pattern @(git rev-parse --abbrev-ref HEAD) -notmatch)
    Write-Output "branches deleted"
}
