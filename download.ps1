#Start-Process powershell -Verb runAs -ArgumentList 'wsl -d Ubuntu-22.04 -u root sudo apt-get update && wsl -d Ubuntu-22.04 -u root sudo apt-get install youtube-dl'

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Liedje URL'
$form.Size = New-Object System.Drawing.Size(300,150)
$form.StartPosition = 'CenterScreen'

$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,70)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Location = New-Object System.Drawing.Point(150,70)
$CancelButton.Size = New-Object System.Drawing.Size(75,23)
$CancelButton.Text = 'Cancel'
$CancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $CancelButton
$form.Controls.Add($CancelButton)

$urlBox = New-Object System.Windows.Forms.TextBox
$urlBox.Location = New-Object System.Drawing.Point(10,40)
$urlBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($urlBox)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    cd $env:userprofile\Music
    $liedjeUrl=$urlBox.Text
    wsl -d Ubuntu-22.04 youtube-dl -x --verbose --audio-format mp3 $liedjeUrl
    Write-Host "De ingevoerde URL is: $liedjeUrl"
    
}
else
{
    Write-Host "Annuleren is geselecteerd."

}

<#
$liedjeUrl=Read-Host -Prompt 'Geef een online video URL'
wsl -d Ubuntu-22.04 youtube-dl -x --verbose --audio-format mp3 $liedjeUrl
#>
