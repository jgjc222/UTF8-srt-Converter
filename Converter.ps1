$path = $name = Read-Host 'Enter Directory'
write-Host "Recursively? (y,n)"
$confirmation = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
if ($confirmation.VirtualKeyCode -eq 89) {
$files = [IO.Directory]::GetFiles($name,"*.srt", [System.IO.SearchOption]::AllDirectories)
}
elseif  ($confirmation.VirtualKeyCode -eq 78) {
$files = [IO.Directory]::GetFiles($name,"*.srt")
}
else{
"Terminating.."
Exit
}
foreach($file in $files)
{
$content = get-content -path $file
$content | out-file $file -encoding utf8
}
