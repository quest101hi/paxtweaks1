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
$form.Size = New-Object System.Drawing.Size(900, 850)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)

# Title Label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$titleLabel.Size = New-Object System.Drawing.Size(850, 40)
$titleLabel.Text = 'CHARGIETWEAKS GAMING OPTIMIZER'
$titleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 18, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
$titleLabel.TextAlign = 'MiddleCenter'
$form.Controls.Add($titleLabel)

# Subtitle
$subtitleLabel = New-Object System.Windows.Forms.Label
$subtitleLabel.Location = New-Object System.Drawing.Point(20, 65)
$subtitleLabel.Size = New-Object System.Drawing.Size(850, 25)
$subtitleLabel.Text = 'Select optimizations to apply to your system'
$subtitleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$subtitleLabel.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 200)
$subtitleLabel.TextAlign = 'MiddleCenter'
$form.Controls.Add($subtitleLabel)

# Create TabControl
$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Location = New-Object System.Drawing.Point(20, 100)
$tabControl.Size = New-Object System.Drawing.Size(850, 620)
$tabControl.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$form.Controls.Add($tabControl)

# ============ ESSENTIAL TWEAKS TAB ============
$tab1 = New-Object System.Windows.Forms.TabPage
$tab1.Text = 'Essential Tweaks'
$tab1.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabControl.TabPages.Add($tab1)

$yPos = 20

# Restore Point
$chkRestorePoint = New-Object System.Windows.Forms.CheckBox
$chkRestorePoint.Location = New-Object System.Drawing.Point(20, $yPos)
$chkRestorePoint.Size = New-Object System.Drawing.Size(800, 30)
$chkRestorePoint.Text = 'Create System Restore Point (Recommended)'
$chkRestorePoint.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkRestorePoint.ForeColor = [System.Drawing.Color]::White
$chkRestorePoint.Checked = $true
$tab1.Controls.Add($chkRestorePoint)
$yPos += 35

# Keyboard
$chkKeyboard = New-Object System.Windows.Forms.CheckBox
$chkKeyboard.Location = New-Object System.Drawing.Point(20, $yPos)
$chkKeyboard.Size = New-Object System.Drawing.Size(800, 30)
$chkKeyboard.Text = 'Optimize Keyboard (Minimize delay, maximize repeat rate)'
$chkKeyboard.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkKeyboard.ForeColor = [System.Drawing.Color]::White
$chkKeyboard.Checked = $true
$tab1.Controls.Add($chkKeyboard)
$yPos += 35

# Mouse
$chkMouse = New-Object System.Windows.Forms.CheckBox
$chkMouse.Location = New-Object System.Drawing.Point(20, $yPos)
$chkMouse.Size = New-Object System.Drawing.Size(800, 30)
$chkMouse.Text = 'Optimize Mouse (Disable acceleration, enhance precision)'
$chkMouse.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkMouse.ForeColor = [System.Drawing.Color]::White
$chkMouse.Checked = $true
$tab1.Controls.Add($chkMouse)
$yPos += 35

# Power Plan
$chkPower = New-Object System.Windows.Forms.CheckBox
$chkPower.Location = New-Object System.Drawing.Point(20, $yPos)
$chkPower.Size = New-Object System.Drawing.Size(800, 30)
$chkPower.Text = 'Enable High Performance Power Plan'
$chkPower.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkPower.ForeColor = [System.Drawing.Color]::White
$chkPower.Checked = $true
$tab1.Controls.Add($chkPower)
$yPos += 35

# Disable Telemetry
$chkTelemetry = New-Object System.Windows.Forms.CheckBox
$chkTelemetry.Location = New-Object System.Drawing.Point(20, $yPos)
$chkTelemetry.Size = New-Object System.Drawing.Size(800, 30)
$chkTelemetry.Text = 'Disable Telemetry & Data Collection'
$chkTelemetry.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkTelemetry.ForeColor = [System.Drawing.Color]::White
$chkTelemetry.Checked = $true
$tab1.Controls.Add($chkTelemetry)
$yPos += 35

# Disable Services
$chkServices = New-Object System.Windows.Forms.CheckBox
$chkServices.Location = New-Object System.Drawing.Point(20, $yPos)
$chkServices.Size = New-Object System.Drawing.Size(800, 30)
$chkServices.Text = 'Disable Unnecessary Services (Search, Xbox, Fax, etc.)'
$chkServices.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkServices.ForeColor = [System.Drawing.Color]::White
$chkServices.Checked = $true
$tab1.Controls.Add($chkServices)
$yPos += 35

# Visual Effects
$chkVisual = New-Object System.Windows.Forms.CheckBox
$chkVisual.Location = New-Object System.Drawing.Point(20, $yPos)
$chkVisual.Size = New-Object System.Drawing.Size(800, 30)
$chkVisual.Text = 'Optimize Visual Effects (Disable animations & transparency)'
$chkVisual.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkVisual.ForeColor = [System.Drawing.Color]::White
$chkVisual.Checked = $true
$tab1.Controls.Add($chkVisual)
$yPos += 35

# Game DVR
$chkGameDVR = New-Object System.Windows.Forms.CheckBox
$chkGameDVR.Location = New-Object System.Drawing.Point(20, $yPos)
$chkGameDVR.Size = New-Object System.Drawing.Size(800, 30)
$chkGameDVR.Text = 'Disable Game DVR & Game Bar'
$chkGameDVR.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkGameDVR.ForeColor = [System.Drawing.Color]::White
$chkGameDVR.Checked = $true
$tab1.Controls.Add($chkGameDVR)
$yPos += 35

# Fullscreen Optimizations
$chkFullscreen = New-Object System.Windows.Forms.CheckBox
$chkFullscreen.Location = New-Object System.Drawing.Point(20, $yPos)
$chkFullscreen.Size = New-Object System.Drawing.Size(800, 30)
$chkFullscreen.Text = 'Disable Fullscreen Optimizations'
$chkFullscreen.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkFullscreen.ForeColor = [System.Drawing.Color]::White
$chkFullscreen.Checked = $true
$tab1.Controls.Add($chkFullscreen)
$yPos += 35

# GPU Scheduling
$chkGPU = New-Object System.Windows.Forms.CheckBox
$chkGPU.Location = New-Object System.Drawing.Point(20, $yPos)
$chkGPU.Size = New-Object System.Drawing.Size(800, 30)
$chkGPU.Text = 'Enable Hardware-Accelerated GPU Scheduling'
$chkGPU.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkGPU.ForeColor = [System.Drawing.Color]::White
$chkGPU.Checked = $true
$tab1.Controls.Add($chkGPU)
$yPos += 35

# Disable Hibernation
$chkHibernation = New-Object System.Windows.Forms.CheckBox
$chkHibernation.Location = New-Object System.Drawing.Point(20, $yPos)
$chkHibernation.Size = New-Object System.Drawing.Size(800, 30)
$chkHibernation.Text = 'Disable Hibernation (Frees up disk space)'
$chkHibernation.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkHibernation.ForeColor = [System.Drawing.Color]::White
$chkHibernation.Checked = $false
$tab1.Controls.Add($chkHibernation)

# ============ NETWORK TAB ============
$tab2 = New-Object System.Windows.Forms.TabPage
$tab2.Text = 'Network'
$tab2.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabControl.TabPages.Add($tab2)

$yPos = 20

# Network Optimization
$chkNetwork = New-Object System.Windows.Forms.CheckBox
$chkNetwork.Location = New-Object System.Drawing.Point(20, $yPos)
$chkNetwork.Size = New-Object System.Drawing.Size(800, 30)
$chkNetwork.Text = 'Optimize Network Settings (Disable Nagle''s Algorithm)'
$chkNetwork.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkNetwork.ForeColor = [System.Drawing.Color]::White
$chkNetwork.Checked = $true
$tab2.Controls.Add($chkNetwork)
$yPos += 35

# DNS Cache
$chkDNS = New-Object System.Windows.Forms.CheckBox
$chkDNS.Location = New-Object System.Drawing.Point(20, $yPos)
$chkDNS.Size = New-Object System.Drawing.Size(800, 30)
$chkDNS.Text = 'Increase DNS Cache Size'
$chkDNS.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkDNS.ForeColor = [System.Drawing.Color]::White
$chkDNS.Checked = $true
$tab2.Controls.Add($chkDNS)
$yPos += 35

# Network Throttling
$chkThrottle = New-Object System.Windows.Forms.CheckBox
$chkThrottle.Location = New-Object System.Drawing.Point(20, $yPos)
$chkThrottle.Size = New-Object System.Drawing.Size(800, 30)
$chkThrottle.Text = 'Disable Network Throttling'
$chkThrottle.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkThrottle.ForeColor = [System.Drawing.Color]::White
$chkThrottle.Checked = $true
$tab2.Controls.Add($chkThrottle)

# ============ PRIVACY TAB ============
$tab3 = New-Object System.Windows.Forms.TabPage
$tab3.Text = 'Privacy'
$tab3.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabControl.TabPages.Add($tab3)

$yPos = 20

# Activity History
$chkActivity = New-Object System.Windows.Forms.CheckBox
$chkActivity.Location = New-Object System.Drawing.Point(20, $yPos)
$chkActivity.Size = New-Object System.Drawing.Size(800, 30)
$chkActivity.Text = 'Disable Activity History'
$chkActivity.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkActivity.ForeColor = [System.Drawing.Color]::White
$chkActivity.Checked = $true
$tab3.Controls.Add($chkActivity)
$yPos += 35

# Location Tracking
$chkLocation = New-Object System.Windows.Forms.CheckBox
$chkLocation.Location = New-Object System.Drawing.Point(20, $yPos)
$chkLocation.Size = New-Object System.Drawing.Size(800, 30)
$chkLocation.Text = 'Disable Location Tracking'
$chkLocation.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkLocation.ForeColor = [System.Drawing.Color]::White
$chkLocation.Checked = $true
$tab3.Controls.Add($chkLocation)
$yPos += 35

# Advertising ID
$chkAdID = New-Object System.Windows.Forms.CheckBox
$chkAdID.Location = New-Object System.Drawing.Point(20, $yPos)
$chkAdID.Size = New-Object System.Drawing.Size(800, 30)
$chkAdID.Text = 'Disable Advertising ID'
$chkAdID.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkAdID.ForeColor = [System.Drawing.Color]::White
$chkAdID.Checked = $true
$tab3.Controls.Add($chkAdID)
$yPos += 35

# Feedback
$chkFeedback = New-Object System.Windows.Forms.CheckBox
$chkFeedback.Location = New-Object System.Drawing.Point(20, $yPos)
$chkFeedback.Size = New-Object System.Drawing.Size(800, 30)
$chkFeedback.Text = 'Disable Windows Feedback'
$chkFeedback.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkFeedback.ForeColor = [System.Drawing.Color]::White
$chkFeedback.Checked = $true
$tab3.Controls.Add($chkFeedback)

# ============ ADVANCED TAB ============
$tab4 = New-Object System.Windows.Forms.TabPage
$tab4.Text = 'Advanced'
$tab4.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabControl.TabPages.Add($tab4)

$yPos = 20

# Windows Update
$chkUpdate = New-Object System.Windows.Forms.CheckBox
$chkUpdate.Location = New-Object System.Drawing.Point(20, $yPos)
$chkUpdate.Size = New-Object System.Drawing.Size(800, 30)
$chkUpdate.Text = 'Configure Windows Update Active Hours'
$chkUpdate.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkUpdate.ForeColor = [System.Drawing.Color]::White
$chkUpdate.Checked = $true
$tab4.Controls.Add($chkUpdate)
$yPos += 35

# Bloatware
$chkBloatware = New-Object System.Windows.Forms.CheckBox
$chkBloatware.Location = New-Object System.Drawing.Point(20, $yPos)
$chkBloatware.Size = New-Object System.Drawing.Size(800, 30)
$chkBloatware.Text = 'Remove Windows Bloatware Apps (Cortana, OneDrive, etc.)'
$chkBloatware.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkBloatware.ForeColor = [System.Drawing.Color]::White
$chkBloatware.Checked = $false
$tab4.Controls.Add($chkBloatware)
$yPos += 35

# Temp Files
$chkTemp = New-Object System.Windows.Forms.CheckBox
$chkTemp.Location = New-Object System.Drawing.Point(20, $yPos)
$chkTemp.Size = New-Object System.Drawing.Size(800, 30)
$chkTemp.Text = 'Delete Temporary Files'
$chkTemp.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkTemp.ForeColor = [System.Drawing.Color]::White
$chkTemp.Checked = $false
$tab4.Controls.Add($chkTemp)
$yPos += 35

# Disk Cleanup
$chkDiskCleanup = New-Object System.Windows.Forms.CheckBox
$chkDiskCleanup.Location = New-Object System.Drawing.Point(20, $yPos)
$chkDiskCleanup.Size = New-Object System.Drawing.Size(800, 30)
$chkDiskCleanup.Text = 'Run Disk Cleanup'
$chkDiskCleanup.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$chkDiskCleanup.ForeColor = [System.Drawing.Color]::White
$chkDiskCleanup.Checked = $false
$tab4.Controls.Add($chkDiskCleanup)

# Select All / Deselect All buttons
$btnSelectAll = New-Object System.Windows.Forms.Button
$btnSelectAll.Location = New-Object System.Drawing.Point(250, 735)
$btnSelectAll.Size = New-Object System.Drawing.Size(150, 40)
$btnSelectAll.Text = 'Select All'
$btnSelectAll.Font = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
$btnSelectAll.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnSelectAll.ForeColor = [System.Drawing.Color]::White
$btnSelectAll.FlatStyle = 'Flat'
$btnSelectAll.Add_Click({
    $chkRestorePoint.Checked = $true
    $chkKeyboard.Checked = $true
    $chkMouse.Checked = $true
    $chkPower.Checked = $true
    $chkTelemetry.Checked = $true
    $chkServices.Checked = $true
    $chkVisual.Checked = $true
    $chkGameDVR.Checked = $true
    $chkFullscreen.Checked = $true
    $chkGPU.Checked = $true
    $chkHibernation.Checked = $true
    $chkNetwork.Checked = $true
    $chkDNS.Checked = $true
    $chkThrottle.Checked = $true
    $chkActivity.Checked = $true
    $chkLocation.Checked = $true
    $chkAdID.Checked = $true
    $chkFeedback.Checked = $true
    $chkUpdate.Checked = $true
    $chkBloatware.Checked = $true
    $chkTemp.Checked = $true
    $chkDiskCleanup.Checked = $true
})
$form.Controls.Add($btnSelectAll)

$btnDeselectAll = New-Object System.Windows.Forms.Button
$btnDeselectAll.Location = New-Object System.Drawing.Point(420, 735)
$btnDeselectAll.Size = New-Object System.Drawing.Size(150, 40)
$btnDeselectAll.Text = 'Deselect All'
$btnDeselectAll.Font = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
$btnDeselectAll.BackColor = [System.Drawing.Color]::FromArgb(60, 60, 60)
$btnDeselectAll.ForeColor = [System.Drawing.Color]::White
$btnDeselectAll.FlatStyle = 'Flat'
$btnDeselectAll.Add_Click({
    $chkRestorePoint.Checked = $false
    $chkKeyboard.Checked = $false
    $chkMouse.Checked = $false
    $chkPower.Checked = $false
    $chkTelemetry.Checked = $false
    $chkServices.Checked = $false
    $chkVisual.Checked = $false
    $chkGameDVR.Checked = $false
    $chkFullscreen.Checked = $false
    $chkGPU.Checked = $false
    $chkHibernation.Checked = $false
    $chkNetwork.Checked = $false
    $chkDNS.Checked = $false
    $chkThrottle.Checked = $false
    $chkActivity.Checked = $false
    $chkLocation.Checked = $false
    $chkAdID.Checked = $false
    $chkFeedback.Checked = $false
    $chkUpdate.Checked = $false
    $chkBloatware.Checked = $false
    $chkTemp.Checked = $false
    $chkDiskCleanup.Checked = $false
})
$form.Controls.Add($btnDeselectAll)

# Apply button
$btnApply = New-Object System.Windows.Forms.Button
$btnApply.Location = New-Object System.Drawing.Point(290, 785)
$btnApply.Size = New-Object System.Drawing.Size(320, 50)
$btnApply.Text = 'APPLY OPTIMIZATIONS'
$btnApply.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$btnApply.BackColor = [System.Drawing.Color]::FromArgb(0, 150, 255)
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
        $progressLabel.Text = 'Starting optimization process...'
        $progressLabel.Font = New-Object System.Drawing.Font('Segoe UI', 11)
        $progressLabel.ForeColor = [System.Drawing.Color]::White
        $progressForm.Controls.Add($progressLabel)
        
        $progressBar = New-Object System.Windows.Forms.ProgressBar
        $progressBar.Location = New-Object System.Drawing.Point(20, 60)
        $progressBar.Size = New-Object System.Drawing.Size(550, 30)
        $progressBar.Style = 'Continuous'
        $progressForm.Controls.Add($progressBar)
        
        $outputBox = New-Object System.Windows.Forms.TextBox
        $outputBox.Location = New-Object System.Drawing.Point(20, 100)
        $outputBox.Size = New-Object System.Drawing.Size(550, 200)
        $outputBox.Multiline = $true
        $outputBox.ScrollBars = 'Vertical'
        $outputBox.ReadOnly = $true
        $outputBox.Font = New-Object System.Drawing.Font('Consolas', 9)
        $outputBox.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
        $outputBox.ForeColor = [System.Drawing.Color]::LimeGreen
        $progressForm.Controls.Add($outputBox)
        
        $progressForm.Show()
        
        $totalSteps = ($chkRestorePoint.Checked + $chkKeyboard.Checked + $chkMouse.Checked + 
                      $chkPower.Checked + $chkTelemetry.Checked + $chkServices.Checked + $chkVisual.Checked + 
                      $chkGameDVR.Checked + $chkFullscreen.Checked + $chkGPU.Checked + $chkHibernation.Checked +
                      $chkNetwork.Checked + $chkDNS.Checked + $chkThrottle.Checked +
                      $chkActivity.Checked + $chkLocation.Checked + $chkAdID.Checked + $chkFeedback.Checked +
                      $chkUpdate.Checked + $chkBloatware.Checked + $chkTemp.Checked + $chkDiskCleanup.Checked)
        
        $currentStep = 0
        
        function Update-Progress {
            param($message)
            $script:currentStep++
            $progressBar.Value = [int](($script:currentStep / $totalSteps) * 100)
            $progressLabel.Text = $message
            $outputBox.AppendText("[$(Get-Date -Format 'HH:mm:ss')] $message`r`n")
            $outputBox.SelectionStart = $outputBox.TextLength
            $outputBox.ScrollToCaret()
            [System.Windows.Forms.Application]::DoEvents()
        }
        
        try {
            # Restore Point
            if ($chkRestorePoint.Checked) {
                Update-Progress "Creating system restore point..."
                try {
                    Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
                    Checkpoint-Computer -Description "ChargieTweaks Backup" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
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
                }
            }
            
            # Telemetry
            if ($chkTelemetry.Checked) {
                Update-Progress "Disabling telemetry..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue
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
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXS
