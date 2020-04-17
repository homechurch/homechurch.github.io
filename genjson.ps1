function Add-Tabstops
{
    param($Count)
    $tabs = ""
    for($i=0; $i -lt $Count; $i++){$tabs += "  "}
    return $tabs
}

function Output-JsonChildren{
    param($Path, $Level = 1)

    return $(Get-ChildItem -Path $Path | Where-Object{$_} | ForEach-Object {
        $title = $_.Name
       
        (Add-Tabstops $Level) +
        "{" + "`"title`"`: `"$($title)`"" + " }"
    }) -join ",`n"
}

$JSON = Output-JsonChildren -Path "C:\Users\Jared\Documents\GitHub\homechurch.github.io\songs"

$output = "[`n" + $JSON + "`n]"

#$output
$output | Out-File -FilePath "C:\Users\Jared\Documents\GitHub\homechurch.github.io\songs.json"
$output | Out-File -FilePath "D:\miniweb\htdocs\songs.json"