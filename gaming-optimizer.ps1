#Requires -RunAsAdministrator

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'ChargieTweaks - Gaming Optimizer'
$form.Size = New-Object System.Drawing.Size(900, 850)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)

$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$titleLabel.Size = New-Object System.Drawing.Size(850, 40)
$titleLabel.Text = 'CHARGIETWEAKS GAMING OPTIMIZER'
$titleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 18, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
$titleLabel.TextAlign = 'MiddleCenter'
$form.Controls.Add($titleLabel)

$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Location = New-Object System.Drawing.Point(20, 65)
$subtitleLabel.Size = New-Object System.Drawing.Size(850, 25)
$subtitleLabel.Text = 'Select optimizations to apply to your system'
$subtitleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 200)
$subtitleLabel.TextAlign = 'MiddleCenter'
$form.Controls.Add($subtitleLabel)

$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Location = New-Object System.Drawing.Point(20, 100)
$tabControl.Size = New-Object System.Drawing.Size(850, 620)
$tabControl.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$form.Controls.Add($tabControl)

# Tab 1 - Essential Tweaks
$tab1 = New-Object System.Windows.Forms.TabPage
$tab1.Text = 'Essential Tweaks'
$tab1.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabControl.TabPages.Add($tab1)

$yPos = 20
$chkRestorePoint = New-Object System.Windows.Forms.CheckBox
$chkRestorePoint.Location = New-Object System.Drawing.Point(20, $yPos)
$chkRestorePoint.Size = New-Object System.Drawing.Size(800, 30)
$chkRestorePoint.Text = 'Create System Restore Point (Recommended)'
$chkRestorePoint.ForeColor = [System.Drawing.Color]::White
$chkRestorePoint.Checked = $true
$tab1.Controls.Add($chkRestorePoint)
$yPos += 35

$chkKeyboard = New-Object System.Windows.Forms.CheckBox
$chkKeyboard.Location = New-Object System.Drawing.Point(20, $yPos)
$chkKeyboard.Size = New-Object System.Drawing.Size(800, 30)
$chkKeyboard.Text = 'Optimize Keyboard Settings'
$chkKeyboard.ForeColor = [System.Drawing.Color]::White
$chkKeyboard.Checked = $true
$tab1.Controls.Add($chkKeyboard)
$yPos += 35

$chkMouse = New-Object System.Windows.Forms.CheckBox
$chkMouse.Location = New-Object System.Drawing.Point(20, $yPos)
$chkMouse.Size = New-Object System.Drawing.Size(800, 30)
$chkMouse.Text = 'Optimize Mouse Settings'
$chkMouse.ForeColor = [System.Drawing.Color]::White
$chkMouse.Checked = $true
$tab1.Controls.Add($chkMouse)
$yPos += 35

$chkPower = New-Object System.Windows.Forms.CheckBox
$chkPower.Location = New-Object System.Drawing.Point(20, $yPos)
$chkPower.Size = New-Object System.Drawing.Size(800, 30)
$chkPower.Text = 'Enable High Performance Power Plan'
$chkPower.ForeColor = [System.Drawing.Color]::White
$chkPower.Checked = $true
$tab1.Controls.Add($chkPower)
$yPos += 35

$chkServices = New-Object System.Windows.Forms.CheckBox
$chkServices.Location = New-Object System.Drawing.Point(20, $yPos)
$chkServices.Size = New-Object System.Drawing.Size(800, 30)
$chkServices.Text = 'Disable Unnecessary Services'
$chkServices.ForeColor = [System.Drawing.Color]::White
$chkServices.Checked = $true
$tab1.Controls.Add($chkServices)
$yPos += 35

$chkVisual = New-Object System.Windows.Forms.CheckBox
$chkVisual.Location = New-Object System.Drawing.Point(20, $yPos)
$chkVisual.Size = New-Object System.Drawing.Size(800, 30)
$chkVisual.Text = 'Optimize Visual Effects'
$chkVisual.ForeColor = [System.Drawing.Color]::White
$chkVisual.Checked = $true
$tab1.Controls.Add($chkVisual)
$yPos += 35

$chkGameDVR = New-Object System.Windows.Forms.CheckBox
$chkGameDVR.Location = New-Object System.Drawing.Point(20, $yPos)
$chkGameDVR.Size = New-Object System.Drawing.Size(800, 30)
$chkGameDVR.Text = 'Disable Game DVR and Game Bar'
$chkGameDVR.ForeColor = [System.Drawing.Color]::White
$chkGameDVR.Checked = $true
$tab1.Controls.Add($chkGameDVR)
$yPos += 35

$chkGPU = New-Object System.Windows.Forms.CheckBox
$chkGPU.Location = New-Object System.Drawing.Point(20, $yPos)
$chkGPU.Size = New-Object System.Drawing.Size(800, 30)
$chkGPU.Text = 'Enable Hardware GPU Scheduling'
$chkGPU.ForeColor = [System.Drawing.Color]::White
$chkGPU.Checked = $true
$tab1.Controls.Add($chkGPU)
$yPos += 35

$chkFullscreen = New-Object System.Windows.Forms.CheckBox
$chkFullscreen.Location = New-Object System.Drawing.Point(20, $yPos)
$chkFullscreen.Size = New-Object System.Drawing.Size(800, 30)
$chkFullscreen.Text = 'Disable Fullscreen Optimizations'
$chkFullscreen.ForeColor = [System.Drawing.Color]::White
$chkFullscreen.Checked = $true
$tab1.Controls.Add($chkFullscreen)

# Tab 2 - Network
$tab2 = New-Object System.Windows.Forms.TabPage
$tab2.Text = 'Network'
$tab2.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabControl.TabPages.Add($tab2)

$yPos = 20
$chkNetwork = New-Object System.Windows.Forms.CheckBox
$chkNetwork.Location = New-Object System.Drawing.Point(20, $yPos)
$chkNetwork.Size = New-Object System.Drawing.Size(800, 30)
$chkNetwork.Text = 'Optimize Network Settings'
$chkNetwork.ForeColor = [System.Drawing.Color]::White
$chkNetwork.Checked = $true
$tab2.Controls.Add($chkNetwork)
$yPos += 35

$chkDNS = New-Object System.Windows.Forms.CheckBox
$chkDNS.Location = New-Object System.Drawing.Point(20, $yPos)
$chkDNS.Size = New-Object System.Drawing.Size(800, 30)
$chkDNS.Text = 'Increase DNS Cache Size'
$chkDNS.ForeColor = [System.Drawing.Color]::White
$chkDNS.Checked = $true
$tab2.Controls.Add($chkDNS)

# Tab 3 - Privacy
$tab3 = New-Object System.Windows.Forms.TabPage
$tab3.Text = 'Privacy'
$tab3.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabControl.TabPages.Add($tab3)

$yPos = 20
$chkTelemetry = New-Object System.Windows.Forms.CheckBox
$chkTelemetry.Location = New-Object System.Drawing.Point(20, $yPos)
$chkTelemetry.Size = New-Object System.Drawing.Size(800, 30)
$chkTelemetry.Text = 'Disable Telemetry'
$chkTelemetry.ForeColor = [System.Drawing.Color]::White
$chkTelemetry.Checked = $true
$tab3.Controls.Add($chkTelemetry)
$yPos += 35

$chkLocation = New-Object System.Windows.Forms.CheckBox
$chkLocation.Location = New-Object System.Drawing.Point(20, $yPos)
$chkLocation.Size = New-Object System.Drawing.Size(800, 30)
$chkLocation.Text = 'Disable Location Tracking'
$chkLocation.ForeColor = [System.Drawing.Color]::White
$chkLocation.Checked = $true
$tab3.Controls.Add($chkLocation)

# Tab 4 - Advanced
$tab4 = New-Object System.Windows.Forms.TabPage
$tab4.Text = 'Advanced'
$tab4.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabControl.TabPages.Add($tab4)

$yPos = 20
$chkUpdate = New-Object System.Windows.Forms.CheckBox
$chkUpdate.Location = New-Object System.Drawing.Point(20, $yPos)
$chkUpdate.Size = New-Object System.Drawing.Size(800, 30)
$chkUpdate.Text = 'Configure Windows Update'
$chkUpdate.ForeColor = [System.Drawing.Color]::White
$chkUpdate.Checked = $true
$tab4.Controls.Add($chkUpdate)
$yPos += 35

$chkBloatware = New-Object System.Windows.Forms.CheckBox
$chkBloatware.Location = New-Object System.Drawing.Point(20, $yPos)
$chkBloatware.Size = New-Object System.Drawing.Size(800, 30)
$chkBloatware.Text = 'Remove Bloatware Apps'
$chkBloatware.ForeColor = [System.Drawing.Color]::White
$chkBloatware.Checked = $false
$tab4.Controls.Add($chkBloatware)

# Buttons
$btnSelectAll = New-Object System.Windows.Forms.Button
$btnSelectAll.Location = New-Object System.Drawing.Point(250, 735)
$btnSelectAll.Size = New-Object System.Drawing.Size(150, 40)
$btnSelectAll.Text = 'Select All'
$btnSelectAll.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnSelectAll.ForeColor = [System.Drawing.Color]::White
$btnSelectAll.FlatStyle = 'Flat'
$btnSelectAll.Add_Click({
    $chkRestorePoint.Checked = $true
    $chkKeyboard.Checked = $true
    $chkMouse.Checked = $true
    $chkPower.Checked = $true
    $chkServices.Checked = $true
    $chkVisual.Checked = $true
    $chkGameDVR.Checked = $true
    $chkGPU.Checked = $true
    $chkFullscreen.Checked = $true
    $chkNetwork.Checked = $true
    $chkDNS.Checked = $true
    $chkTelemetry.Checked = $true
    $chkLocation.Checked = $true
    $chkUpdate.Checked = $true
    $chkBloatware.Checked = $true
})
$form.Controls.Add($btnSelectAll)

$btnDeselectAll = New-Object System.Windows.Forms.Button
$btnDeselectAll.Location = New-Object System.Drawing.Point(420, 735)
$btnDeselectAll.Size = New-Object System.Drawing.Size(150, 40)
$btnDeselectAll.Text = 'Deselect All'
$btnDeselectAll.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnDeselectAll.ForeColor = [System.Drawing.Color]::White
$btnDeselectAll.FlatStyle = 'Flat'
$btnDeselectAll.Add_Click({
    $chkRestorePoint.Checked = $false
    $chkKeyboard.Checked = $false
    $chkMouse.Checked = $false
    $chkPower.Checked = $false
    $chkServices.Checked = $false
    $chkVisual.Checked = $false
    $chkGameDVR.Checked = $false
    $chkGPU.Checked = $false
    $chkFullscreen.Checked = $false
    $chkNetwork.Checked = $false
    $chkDNS.Checked = $false
    $chkTelemetry.Checked = $false
    $chkLocation.Checked = $false
    $chkUpdate.Checked = $false
    $chkBloatware.Checked = $false
})
$form.Controls.Add($btnDeselectAll)

$btnApply = New-Object System.Windows.Forms.Button
$btnApply.Location = New-Object System.Drawing.Point(290, 785)
$btnApply.Size = New-Object System.Drawing.Size(320, 50)
$btnApply.Text = 'APPLY OPTIMIZATIONS'
$btnApply.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$btnApply.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
$btnApply.ForeColor = [System.Drawing.Color]::White
$btnApply.FlatStyle = 'Flat'
$btnApply.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply selected optimizations?`n`nRestart recommended after completion.", "Confirm", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $form.Hide()
        
        $progressForm = New-Object System.Windows.Forms.Form
        $progressForm.Text = 'ChargieTweaks - Optimizing...'
        $progressForm.Size = New-Object System.Drawing.Size(600, 350)
        $progressForm.StartPosition = 'CenterScreen'
        $progressForm.FormBorderStyle = 'FixedDialog'
        $progressForm.MaximizeBox = $false
        $progressForm.MinimizeBox = $false
        $progressForm.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
        
        $progressLabel = New-Object System.Windows.Forms.Label
        $progressLabel.Location = New-Object System.Drawing.Point(20, 20)
        $progressLabel.Size = New-Object System.Drawing.Size(550, 30)
        $progressLabel.Text = 'Starting...'
        $progressLabel.ForeColor = [System.Drawing.Color]::White
        $progressForm.Controls.Add($progressLabel)
        
        $progressBar = New-Object System.Windows.Forms.ProgressBar
        $progressBar.Location = New-Object System.Drawing.Point(20, 60)
        $progressBar.Size = New-Object System.Drawing.Size(550, 30)
        $progressForm.Controls.Add($progressBar)
        
        $outputBox = New-Object System.Windows.Forms.TextBox
        $outputBox.Location = New-Object System.Drawing.Point(20, 100)
        $outputBox.Size = New-Object System.Drawing.Size(550, 200)
        $outputBox.Multiline = $true
        $outputBox.ScrollBars = 'Vertical'
        $outputBox.ReadOnly = $true
        $outputBox.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
        $outputBox.ForeColor = [System.Drawing.Color]::LimeGreen
        $progressForm.Controls.Add($outputBox)
        
        $progressForm.Show()
        
        $totalSteps = ($chkRestorePoint.Checked + $chkKeyboard.Checked + $chkMouse.Checked + $chkPower.Checked + $chkServices.Checked + $chkVisual.Checked + $chkGameDVR.Checked + $chkGPU.Checked + $chkFullscreen.Checked + $chkNetwork.Checked + $chkDNS.Checked + $chkTelemetry.Checked + $chkLocation.Checked + $chkUpdate.Checked + $chkBloatware.Checked)
        $currentStep = 0
        
        function Update-Progress {
            param($message)
            $script:currentStep++
            $progressBar.Value = [int](($script:currentStep / $totalSteps) * 100)
            $progressLabel.Text = $message
            $outputBox.AppendText("$message`r`n")
            $outputBox.SelectionStart = $outputBox.TextLength
            $outputBox.ScrollToCaret()
            [System.Windows.Forms.Application]::DoEvents()
        }
        
        try {
            if ($chkRestorePoint.Checked) {
                Update-Progress "Creating restore point..."
                try {
                    Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
                    Checkpoint-Computer -Description "ChargieTweaks Backup" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
                } catch {}
            }
            
            if ($chkKeyboard.Checked) {
                Update-Progress "Optimizing keyboard..."
                Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Value 31 -ErrorAction SilentlyContinue
            }
            
            if ($chkMouse.Checked) {
                Update-Progress "Optimizing mouse..."
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value 0 -ErrorAction SilentlyContinue
            }
            
            if ($chkPower.Checked) {
                Update-Progress "Setting power plan..."
                $plan = powercfg -list | Select-String "High performance"
                if ($plan) {
                    $guid = $plan.ToString().Split()[3]
                    powercfg -setactive $guid
                }
            }
            
            if ($chkServices.Checked) {
                Update-Progress "Disabling services..."
                $services = @("DiagTrack", "dmwappushservice", "SysMain", "WSearch", "XblAuthManager", "XblGameSave", "XboxNetApiSvc", "XboxGipSvc")
                foreach ($svc in $services) {
                    try {
                        Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
                        Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
                    } catch {}
                }
            }
            
            if ($chkVisual.Checked) {
                Update-Progress "Optimizing visuals..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -ErrorAction SilentlyContinue
            }
            
            if ($chkGameDVR.Checked) {
                Update-Progress "Disabling Game DVR..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "GameDVR_Enabled" -Value 0 -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -Force -ErrorAction SilentlyContinue
            }
            
            if ($chkGPU.Checked) {
                Update-Progress "Enabling GPU scheduling..."
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -Force -ErrorAction SilentlyContinue
            }
            
            if ($chkFullscreen.Checked) {
                Update-Progress "Disabling fullscreen optimizations..."
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehaviorMode" -Value 2 -Force -ErrorAction SilentlyContinue
            }
            
            if ($chkNetwork.Checked) {
                Update-Progress "Optimizing network..."
                $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
                foreach ($adapter in $adapters) {
                    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($adapter.InterfaceGuid)"
                    if (Test-Path $regPath) {
                        Set-ItemProperty -Path $regPath -Name "TcpAckFrequency" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path $regPath -Name "TCPNoDelay" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
                    }
                }
            }
            
            if ($chkDNS.Checked) {
                Update-Progress "Increasing DNS cache..."
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" -Name "CacheHashTableBucketSize" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" -Name "CacheHashTableSize" -Value 384 -Type DWord -ErrorAction SilentlyContinue
            }
            
            if ($chkTelemetry.Checked) {
                Update-Progress "Disabling telemetry..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue
            }
            
            if ($chkLocation.Checked) {
                Update-Progress "Disabling location..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny" -ErrorAction SilentlyContinue
            }
            
            if ($chkUpdate.Checked) {
                Update-Progress "Configuring updates..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursStart" -Value 8 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursEnd" -Value 2 -ErrorAction SilentlyContinue
            }
            
            if ($chkBloatware.Checked) {
                Update-Progress "Removing bloatware..."
                $bloatware = @("Microsoft.BingNews", "Microsoft.GetHelp", "Microsoft.Getstarted", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.WindowsFeedbackHub", "Microsoft.XboxGamingOverlay", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo")
                foreach ($app in $bloatware) {
                    try {
                        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
                    } catch {}
                }
            }
            
            $progressBar.Value = 100
            $progressLabel.Text = "Complete!"
            $outputBox.AppendText("`r`n=== OPTIMIZATION COMPLETE ===`r`nPlease restart your computer.`r`n")
            Start-Sleep -Seconds 2
            
            [System.Windows.Forms.MessageBox]::Show("Optimization complete!`n`nPlease restart your computer.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Error: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
        
        $progressForm.Close()
        $form.Close()
    }
})
$form.Controls.Add($btnApply)

[void]$form.ShowDialog()
