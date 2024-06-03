$source = 'D:\Home\Desktop\tensorflow\tensorflow\lite'
$destination = 'D:\Home\Desktop\copy_h_file_only'
mkdir $destination
Get-ChildItem -Path $source -Filter *.h -Recurse | ForEach-Object {
    $target = $destination + $_.FullName.Substring($source.length)
    New-Item -ItemType File -Path $target -Force
    Copy-Item -Path $_.FullName -Destination $target
}
