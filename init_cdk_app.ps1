$project_location = Get-Location
$temp_app_dir_name = 'temporary_app'
$temp_app_location = Join-Path -Path $project_location -ChildPath $temp_app_dir_name
# Write-Output -InputObject $project_location\requirements.txt

mkdir $temp_app_location

Set-Location -Path $temp_app_location
cdk init app --language python
Set-Location -Path $project_location

# Rename folder so its easier to move out content later
$temp_app_dir_renamed = 'temporary_app_temp'
$temp_app_location_renamed = Join-Path -Path $project_location -ChildPath $temp_app_dir_renamed
Rename-Item -Path $temp_app_location -NewName $temp_app_location_renamed

Get-Content -Path $temp_app_location_renamed\requirements.txt >> $project_location\requirements.txt
Get-Content -Path $temp_app_location_renamed\.gitignore >> $project_location\.gitignore

Remove-Item -Path $temp_app_location_renamed\requirements.txt
Remove-Item -Path $temp_app_location_renamed\.gitignore
Remove-Item -Path $temp_app_location_renamed\README.md
Remove-Item -Path $temp_app_location_renamed\.venv -Recurse

Move-Item -Path $temp_app_location_renamed\* -Destination $project_location

Remove-Item -Path $temp_app_location_renamed

cdk synth