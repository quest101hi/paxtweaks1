#Requires -RunAsAdministrator

<#
.SYNOPSIS
    ChargieTweaks - Gaming Performance Optimizer Tool
.DESCRIPTION
    Interactive GUI tool for optimizing Windows for gaming performance
.NOTES
    Run this script as Administrator
    URL: chargietweaks
#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'ChargieTweaks - Gaming Optimizer'
$form.Size = New-Object System.Drawing.Size(700, 750)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)

# Title Label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$titleLabel.Size = New-Object System.Drawing.Size(650, 40)
$titleLabel.Text = 'CHARGIETWEAKS GAMING OPTIMIZER'
$titleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 16, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$titleLabel.TextAlign = 'MiddleCenter'
$form.Controls.Add($titleLabel)

# Subtitle
$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Location = New-Object System.Drawing.Point(20, 60)
$subtitleLabel.Size = New-Object System.Drawing.Size(650, 25)
$subtitleLabel.Text = 'Select optimizations to apply to your system'
$subtitleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(100, 100, 100)
$subtitleLabel.TextAlign = 'MiddleCenter'
$form.Controls.Add($subtitleLabel)

# Create GroupBox for optimizations
$groupBox = New-Object System.Windows.Forms.GroupBox
$groupBox.Location = New-Object System.Drawing.Point(20, 100)
$groupBox.Size = New-Object System.Drawing.Size(650, 480)
$groupBox.Text = ' Optimization Options '
$groupBox.Font = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($groupBox)

# Create checkboxes
$yPos = 30

# Restore Point Checkbox
$chkRestorePoint = New-Object System.Windows.Forms.CheckBox
$chkRestorePoint.Location = New-Object System.Drawing.Point(20, $yPos)
$chkRestorePoint.Size = New-Object System.Drawing.Size(600, 30)
$chkRestorePoint.Text = 'Create System Restore Point (Recommended)'
$chkRestorePoint.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkRestorePoint.Checked = $true
$groupBox.Controls.Add($chkRestorePoint)
$yPos += 35

# Keyboard Optimization
$chkKeyboard = New-Object System.Windows.Forms.CheckBox
$chkKeyboard.Location = New-Object System.Drawing.Point(20, $yPos)
$chkKeyboard.Size = New-Object System.Drawing.Size(600, 30)
$chkKeyboard.Text = 'Optimize Keyboard (Minimize delay, maximize repeat rate)'
$chkKeyboard.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkKeyboard.Checked = $true
$groupBox.Controls.Add($chkKeyboard)
$yPos += 35

# Mouse Optimization
$chkMouse = New-Object System.Windows.Forms.CheckBox
$chkMouse.Location = New-Object System.Drawing.Point(20, $yPos)
$chkMouse.Size = New-Object System.Drawing.Size(600, 30)
$chkMouse.Text = 'Optimize Mouse (Disable acceleration, enhance precision)'
$chkMouse.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkMouse.Checked = $true
$groupBox.Controls.Add($chkMouse)
$yPos += 35

# Power Plan
$chkPower = New-Object System.Windows.Forms.CheckBox
$chkPower.Location = New-Object System.Drawing.Point(20, $yPos)
$chkPower.Size = New-Object System.Drawing.Size(600, 30)
$chkPower.Text = 'Enable High Performance Power Plan'
$chkPower.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkPower.Checked = $true
$groupBox.Controls.Add($chkPower)
$yPos += 35

# Disable Services
$chkServices = New-Object System.Windows.Forms.CheckBox
$chkServices.Location = New-Object System.Drawing.Point(20, $yPos)
$chkServices.Size = New-Object System.Drawing.Size(600, 30)
$chkServices.Text = 'Disable Unnecessary Services (Telemetry, Search, Xbox)'
$chkServices.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkServices.Checked = $true
$groupBox.Controls.Add($chkServices)
$yPos += 35

# Visual Effects
$chkVisual = New-Object System.Windows.Forms.CheckBox
$chkVisual.Location = New-Object System.Drawing.Point(20, $yPos)
$chkVisual.Size = New-Object System.Drawing.Size(600, 30)
$chkVisual.Text = 'Optimize Visual Effects (Disable animations & transparency)'
$chkVisual.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkVisual.Checked = $true
$groupBox.Controls.Add($chkVisual)
$yPos += 35

# Game DVR
$chkGameDVR = New-Object System.Windows.Forms.CheckBox
$chkGameDVR.Location = New-Object System.Drawing.Point(20, $yPos)
$chkGameDVR.Size = New-Object System.Drawing.Size(600, 30)
$chkGameDVR.Text = 'Disable Game DVR & Game Bar'
$chkGameDVR.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkGameDVR.Checked = $true
$groupBox.Controls.Add($chkGameDVR)
$yPos += 35

# Network Optimization
$chkNetwork = New-Object System.Windows.Forms.CheckBox
$chkNetwork.Location = New-Object System.Drawing.Point(20, $yPos)
$chkNetwork.Size = New-Object System.Drawing.Size(600, 30)
$chkNetwork.Text = 'Optimize Network Settings (Reduce latency)'
$chkNetwork.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkNetwork.Checked = $true
$groupBox.Controls.Add($chkNetwork)
$yPos += 35

# Windows Update
$chkUpdate = New-Object System.Windows.Forms.CheckBox
$chkUpdate.Location = New-Object System.Drawing.Point(20, $yPos)
$chkUpdate.Size = New-Object System.Drawing.Size(600, 30)
$chkUpdate.Text = 'Configure Windows Update Active Hours'
$chkUpdate.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkUpdate.Checked = $true
$groupBox.Controls.Add($chkUpdate)
$yPos += 35

# Fullscreen Optimizations
$chkFullscreen = New-Object System.Windows.Forms.CheckBox
$chkFullscreen.Location = New-Object System.Drawing.Point(20, $yPos)
$chkFullscreen.Size = New-Object System.Drawing.Size(600, 30)
$chkFullscreen.Text = 'Disable Fullscreen Optimizations'
$chkFullscreen.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkFullscreen.Checked = $true
$groupBox.Controls.Add($chkFullscreen)
$yPos += 35

# GPU Optimization
$chkGPU = New-Object System.Windows.Forms.CheckBox
$chkGPU.Location = New-Object System.Drawing.Point(20, $yPos)
$chkGPU.Size = New-Object System.Drawing.Size(600, 30)
$chkGPU.Text = 'Enable Hardware-Accelerated GPU Scheduling'
$chkGPU.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkGPU.Checked = $true
$groupBox.Controls.Add($chkGPU)
$yPos += 35

# Disable Bloatware
$chkBloatware = New-Object System.Windows.Forms.CheckBox
$chkBloatware.Location = New-Object System.Drawing.Point(20, $yPos)
$chkBloatware.Size = New-Object System.Drawing.Size(600, 30)
$chkBloatware.Text = 'Remove Windows Bloatware Apps'
$chkBloatware.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkBloatware.Checked = $false
$groupBox.Controls.Add($chkBloatware)

# Select All / Deselect All buttons
$btnSelectAll = New-Object System.Windows.Forms.Button
$btnSelectAll.Location = New-Object System.Drawing.Point(170, 595)
$btnSelectAll.Size = New-Object System.Drawing.Size(150, 35)
$btnSelectAll.Text = 'Select All'
$btnSelectAll.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnSelectAll.BackColor = [System.Drawing.Color]::FromArgb(230, 230, 230)
$btnSelectAll.Add_Click({
    $chkRestorePoint.Checked = $true
    $chkKeyboard.Checked = $true
    $chkMouse.Checked = $true
    $chkPower.Checked = $true
    $chkServices.Checked = $true
    $chkVisual.Checked = $true
    $chkGameDVR.Checked = $true
    $chkNetwork.Checked = $true
    $chkUpdate.Checked = $true
    $chkFullscreen.Checked = $true
    $chkGPU.Checked = $true
    $chkBloatware.Checked = $true
})
$form.Controls.Add($btnSelectAll)

$btnDeselectAll = New-Object System.Windows.Forms.Button
$btnDeselectAll.Location = New-Object System.Drawing.Point(340, 595)
$btnDeselectAll.Size = New-Object System.Drawing.Size(150, 35)
$btnDeselectAll.Text = 'Deselect All'
$btnDeselectAll.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnDeselectAll.BackColor = [System.Drawing.Color]::FromArgb(230, 230, 230)
$btnDeselectAll.Add_Click({
    $chkRestorePoint.Checked = $false
    $chkKeyboard.Checked = $false
    $chkMouse.Checked = $false
    $chkPower.Checked = $false
    $chkServices.Checked = $false
    $chkVisual.Checked = $false
    $chkGameDVR.Checked = $false
    $chkNetwork.Checked = $false
    $chkUpdate.Checked = $false
    $chkFullscreen.Checked = $false
    $chkGPU.Checked = $false
    $chkBloatware.Checked = $false
})
$form.Controls.Add($btnDeselectAll)

# Apply button
$btnApply = New-Object System.Windows.Forms.Button
$btnApply.Location = New-Object System.Drawing.Point(170, 650)
$btnApply.Size = New-Object System.Drawing.Size(320, 45)
$btnApply.Text = 'APPLY OPTIMIZATIONS'
$btnApply.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$btnApply.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$btnApply.ForeColor = [System.Drawing.Color]::White
$btnApply.FlatStyle = 'Flat'
$btnApply.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show(
        "This will apply the selected optimizations to your system.`n`nA restart is recommended after completion.`n`nDo you want to continue?",
        "Confirm Optimization",
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Question
    )
    
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $form.Hide()
        
        # Create progress form
        $progressForm = New-Object System.Windows.Forms.Form
        $progressForm.Text = 'Optimizing...'
        $progressForm.Size = New-Object System.Drawing.Size(500, 300)
        $progressForm.StartPosition = 'CenterScreen'
        $progressForm.FormBorderStyle = 'FixedDialog'
        $progressForm.MaximizeBox = $false
        $progressForm.MinimizeBox = $false
        
        $progressLabel = New-Object System.Windows.Forms.Label
        $progressLabel.Location = New-Object System.Drawing.Point(20, 20)
        $progressLabel.Size = New-Object System.Drawing.Size(450, 30)
        $progressLabel.Text = 'Starting optimization process...'
        $progressLabel.Font = New-Object System.Drawing.Font('Segoe UI', 11)
        $progressForm.Controls.Add($progressLabel)
        
        $progressBar = New-Object System.Windows.Forms.ProgressBar
        $progressBar.Location = New-Object System.Drawing.Point(20, 60)
        $progressBar.Size = New-Object System.Drawing.Size(450, 30)
        $progressBar.Style = 'Continuous'
        $progressForm.Controls.Add($progressBar)
        
        $outputBox = New-Object System.Windows.Forms.TextBox
        $outputBox.Location = New-Object System.Drawing.Point(20, 100)
        $outputBox.Size = New-Object System.Drawing.Size(450, 140)
        $outputBox.Multiline = $true
        $outputBox.ScrollBars = 'Vertical'
        $outputBox.ReadOnly = $true
        $outputBox.Font = New-Object System.Drawing.Font('Consolas', 9)
        $progressForm.Controls.Add($outputBox)
        
        $progressForm.Show()
        
        $totalSteps = ($chkRestorePoint.Checked + $chkKeyboard.Checked + $chkMouse.Checked + 
                      $chkPower.Checked + $chkServices.Checked + $chkVisual.Checked + 
                      $chkGameDVR.Checked + $chkNetwork.Checked + $chkUpdate.Checked + 
                      $chkFullscreen.Checked + $chkGPU.Checked + $chkBloatware.Checked)
        
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
            # Restore Point
            if ($chkRestorePoint.Checked) {
                Update-Progress "Creating system restore point..."
                try {
                    Enable-ComputerRestore -Drive "C:\"
                    Checkpoint-Computer -Description "ChargieTweaks Backup" -RestorePointType "MODIFY_SETTINGS"
                } catch { }
            }
            
            # Keyboard
            if ($chkKeyboard.Checked) {
                Update-Progress "Optimizing keyboard settings..."
                Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Value 31 -ErrorAction SilentlyContinue
            }
            
            # Mouse
            if ($chkMouse.Checked) {
                Update-Progress "Optimizing mouse settings..."
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSensitivity" -Value 10 -ErrorAction SilentlyContinue
            }
            
            # Power Plan
            if ($chkPower.Checked) {
                Update-Progress "Setting high performance power plan..."
                $plan = powercfg -list | Select-String "High performance"
                if ($plan) {
                    $guid = $plan.ToString().Split()[3]
                    powercfg -setactive $guid
                    powercfg -setacvalueindex $guid 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
                    powercfg -setdcvalueindex $guid 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
                }
            }
            
            # Services
            if ($chkServices.Checked) {
                Update-Progress "Disabling unnecessary services..."
                $services = @("DiagTrack", "dmwappushservice", "SysMain", "WSearch", "TabletInputService", "Fax", "XblAuthManager", "XblGameSave", "XboxNetApiSvc", "XboxGipSvc")
                foreach ($svc in $services) {
                    try {
                        Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
                        Set-Service -Name $svc -StartupType Disabled -ErrorAction SilentlyContinue
                    } catch { }
                }
            }
            
            # Visual Effects
            if ($chkVisual.Checked) {
                Update-Progress "Optimizing visual effects..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -ErrorAction SilentlyContinue
            }
            
            # Game DVR
            if ($chkGameDVR.Checked) {
                Update-Progress "Disabling Game DVR and Game Bar..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "GameDVR_Enabled" -Value 0 -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -Force -ErrorAction SilentlyContinue
                if (!(Test-Path "HKCU:\Software\Microsoft\GameBar")) {
                    New-Item -Path "HKCU:\Software\Microsoft\GameBar" -Force | Out-Null
                }
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -Value 0 -Force -ErrorAction SilentlyContinue
            }
            
            # Network
            if ($chkNetwork.Checked) {
                Update-Progress "Optimizing network settings..."
                $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
                foreach ($adapter in $adapters) {
                    $interfaceGuid = $adapter.InterfaceGuid
                    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$interfaceGuid"
                    if (Test-Path $regPath) {
                        Set-ItemProperty -Path $regPath -Name "TcpAckFrequency" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path $regPath -Name "TCPNoDelay" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
                    }
                }
            }
            
            # Windows Update
            if ($chkUpdate.Checked) {
                Update-Progress "Configuring Windows Update..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursStart" -Value 8 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursEnd" -Value 2 -ErrorAction SilentlyContinue
            }
            
            # Fullscreen Optimizations
            if ($chkFullscreen.Checked) {
                Update-Progress "Disabling fullscreen optimizations..."
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_DXGIHonorFSEWindowsCompatible" -Value 1 -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehaviorMode" -Value 2 -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_HonorUserFSEBehaviorMode" -Value 1 -Force -ErrorAction SilentlyContinue
            }
            
            # GPU
            if ($chkGPU.Checked) {
                Update-Progress "Enabling GPU scheduling..."
                $path = "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
                if (Test-Path $path) {
                    Set-ItemProperty -Path $path -Name "HwSchMode" -Value 2 -Force -ErrorAction SilentlyContinue
                }
            }
            
            # Bloatware
            if ($chkBloatware.Checked) {
                Update-Progress "Removing bloatware apps..."
                $bloatware = @("Microsoft.BingNews", "Microsoft.GetHelp", "Microsoft.Getstarted", "Microsoft.Messaging", 
                              "Microsoft.Microsoft3DViewer", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.People", 
                              "Microsoft.WindowsFeedbackHub", "Microsoft.Xbox.TCUI", "Microsoft.XboxGamingOverlay", 
                              "Microsoft.XboxIdentityProvider", "Microsoft.XboxSpeechToTextOverlay", "Microsoft.ZuneMusic", 
                              "Microsoft.ZuneVideo")
                foreach ($app in $bloatware) {
                    try {
                        Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
                    } catch { }
                }
            }
            
            $progressBar.Value = 100
            $progressLabel.Text = "Optimization complete!"
            $outputBox.AppendText("`r`n=== OPTIMIZATION COMPLETE ===`r`n")
            $outputBox.AppendText("Please restart your computer for all changes to take effect.`r`n")
            
            Start-Sleep -Seconds 2
            
            [System.Windows.Forms.MessageBox]::Show(
                "Optimization complete!`n`nPlease restart your computer for all changes to take effect.",
                "Success",
                [System.Windows.Forms.MessageBoxButtons]::OK,
                [System.Windows.Forms.MessageBoxIcon]::Information
            )
            
        } catch {
            [System.Windows.Forms.MessageBox]::Show(
                "An error occurred during optimization:`n`n$($_.Exception.Message)",
                "Error",
                [System.Windows.Forms.MessageBoxButtons]::OK,
                [System.Windows.Forms.MessageBoxIcon]::Error
            )
        }
        
        $progressForm.Close()
        $form.Close()
    }
})
$form.Controls.Add($btnApply)

# Show the form
[void]$form.ShowDialog()
