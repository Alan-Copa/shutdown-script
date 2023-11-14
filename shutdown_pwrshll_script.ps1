Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Form Configuration
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Shutdown Confirmation'
$form.Size = New-Object System.Drawing.Size(400,250)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.MinimizeBox = $false

# Style Configuration
$font = New-Object System.Drawing.Font('Segoe UI', 10)
$form.Font = $font

# Button Styling Function
function CreateStyledButton([string]$text, [System.Drawing.Point]$location, [System.Drawing.Size]$size, [System.Drawing.Color]$backColor, [System.Drawing.Color]$mouseOverColor) {
    $button = New-Object System.Windows.Forms.Button
    $button.Location = $location
    $button.Size = $size
    $button.Text = $text
    $button.Font = $font
    $button.BackColor = $backColor
    $button.ForeColor = [System.Drawing.Color]::White
    $button.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
    $button.FlatAppearance.BorderSize = 1
    $button.FlatAppearance.BorderColor = [System.Drawing.Color]::Black
    $button.FlatAppearance.MouseOverBackColor = $mouseOverColor
    $button.Cursor = [System.Windows.Forms.Cursors]::Hand
    return $button
}

# OneDrive Logout Button - Lighter OneDrive Blue Color
$oneDriveColor = [System.Drawing.Color]::FromArgb(0, 120, 215) # Lighter OneDrive blue
$oneDriveMouseOverColor = [System.Drawing.Color]::FromArgb(0, 100, 190) # Darker for mouse-over
$buttonOneDrive = CreateStyledButton 'Log out from OneDrive' (New-Object System.Drawing.Point(100,40)) (New-Object System.Drawing.Size(200,40)) $oneDriveColor $oneDriveMouseOverColor
$buttonOneDrive.Add_Click({
    # Placeholder for OneDrive logout code
    [System.Windows.Forms.MessageBox]::Show('OneDrive log out not implemented')
})
$form.Controls.Add($buttonOneDrive)

# Google Chrome Logout Button - Lighter Chrome Yellow Color
$chromeColor = [System.Drawing.Color]::FromArgb(255, 195, 11) # Lighter Chrome yellow
$chromeMouseOverColor = [System.Drawing.Color]::FromArgb(230, 175, 10) # Darker for mouse-over
$buttonChrome = CreateStyledButton 'Log out from Chrome' (New-Object System.Drawing.Point(100,90)) (New-Object System.Drawing.Size(200,40)) $chromeColor $chromeMouseOverColor
$buttonChrome.Add_Click({
    # Placeholder for Chrome logout code
    [System.Windows.Forms.MessageBox]::Show('Chrome log out not implemented')
})
$form.Controls.Add($buttonChrome)

# Shutdown Confirmation Button - Light Red Color
$shutdownColor = [System.Drawing.Color]::FromArgb(255, 70, 70) # Light red
$shutdownMouseOverColor = [System.Drawing.Color]::FromArgb(230, 50, 50) # Darker for mouse-over
$buttonShutdown = CreateStyledButton 'Confirm Shutdown' (New-Object System.Drawing.Point(50,150)) (New-Object System.Drawing.Size(130,40)) $shutdownColor $shutdownMouseOverColor
$buttonShutdown.Add_Click({
    $form.Close()
    Stop-Computer
})
$form.Controls.Add($buttonShutdown)

# Cancel Button - Light Gray Color
$cancelColor = [System.Drawing.Color]::LightGray # Light gray for cancel button
$cancelMouseOverColor = [System.Drawing.Color]::Gray # Darker for mouse-over
$buttonCancel = CreateStyledButton 'Cancel' (New-Object System.Drawing.Point(220,150)) (New-Object System.Drawing.Size(130,40)) $cancelColor $cancelMouseOverColor
$buttonCancel.Add_Click({
    $form.Close()
})
$form.Controls.Add($buttonCancel)

# Title Label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.AutoSize = $true
$titleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 14, [System.Drawing.FontStyle]::Bold)
$titleLabel.Text = 'Logout Options'
$titleLabel.Location = New-Object System.Drawing.Point(130, 10)
$form.Controls.Add($titleLabel)

# OneDrive Checkbox
$checkBoxOneDrive = New-Object System.Windows.Forms.CheckBox
$checkBoxOneDrive.Checked = $false
$checkBoxOneDrive.Location = New-Object System.Drawing.Point(310,45)
$checkBoxOneDrive.Size = New-Object System.Drawing.Size(20,20)
$form.Controls.Add($checkBoxOneDrive)

# Google Chrome Checkbox
$checkBoxChrome = New-Object System.Windows.Forms.CheckBox
$checkBoxChrome.Checked = $false
$checkBoxChrome.Location = New-Object System.Drawing.Point(310,95)
$checkBoxChrome.Size = New-Object System.Drawing.Size(20,20)
$form.Controls.Add($checkBoxChrome)

# Show Form	
$form.ShowDialog()
