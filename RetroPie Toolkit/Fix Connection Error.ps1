$Server = Read-Host -Prompt 'Input your RetroPie IP Address'
Write-Host "You input RetroPie IP "$Server" `nMaking the needed changes to the retropie toolkit...."
sleep 4 
Get-ChildItem ./*.cmd -recurse |
    Foreach-Object {
        $c = ($_ | Get-Content) 
        $c = $c -replace 'retropie.local',"$Server"
        [IO.File]::WriteAllText($_.FullName, ($c -join "`r`n"))
    }