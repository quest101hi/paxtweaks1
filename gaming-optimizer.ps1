#Requires -RunAsAdministrator

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'ChargieTweaks'
$form.Size = New-Object System.Drawing.Size(1200, 900)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(10, 10, 10)

$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Location = New-Object System.Drawing.Point(20, 20)
$titleLabel.Size = New-Object System.Drawing.Size(1150, 40)
$titleLabel.Text = 'CHARGIETWEAKS - WINDOWS GAMING OPTIMIZER'
$titleLabel.Font = New-Object System.Drawing.Font('Segoe UI', 16, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$titleLabel.TextAlign = 'MiddleCenter'
$form.Controls.Add($titleLabel)

$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Location = New-Object System.Drawing.Point(20, 70)
$tabControl.Size = New-Object System.Drawing.Size(1150, 680)
$tabControl.Font = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($tabControl)

# TWEAKS TAB
$tabTweaks = New-Object System.Windows.Forms.TabPage
$tabTweaks.Text = 'Tweaks'
$tabTweaks.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabTweaks)

# Top buttons
$btnStandard = New-Object System.Windows.Forms.Button
$btnStandard.Location = New-Object System.Drawing.Point(20, 20)
$btnStandard.Size = New-Object System.Drawing.Size(200, 35)
$btnStandard.Text = 'Standard'
$btnStandard.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnStandard.ForeColor = [System.Drawing.Color]::White
$btnStandard.FlatStyle = 'Flat'
$btnStandard.Add_Click({
    # Essential Tweaks - Standard Selection
    $chks['Create Restore Point'].Checked = $true
    $chks['Delete Temporary Files'].Checked = $true
    $chks['Disable Telemetry'].Checked = $true
    $chks['Disable GameDVR'].Checked = $true
    $chks['Disable Hibernation'].Checked = $false
    $chks['Optimize Mouse (No Acceleration)'].Checked = $true
    $chks['Optimize Keyboard'].Checked = $true
    $chks['High Performance Power Plan'].Checked = $true
    $chks['Disable Unnecessary Services'].Checked = $true
    $chks['Optimize Visual Effects'].Checked = $true
    $chks['Enable GPU Scheduling'].Checked = $true
    $chks['Disable Fullscreen Optimizations'].Checked = $true
    $chks['Optimize Network Settings'].Checked = $true
    $chks['Increase DNS Cache'].Checked = $true
    $chks['Disable Activity History'].Checked = $true
    $chks['Disable Location Tracking'].Checked = $true
    $chks['Disable Storage Sense'].Checked = $true
    $chks['Run Disk Cleanup'].Checked = $true
    
    # Customize Preferences - Standard Selection
    $chks['Dark Theme for Windows'].Checked = $true
    $chks['NumLock on Startup'].Checked = $false
    $chks['Show Hidden Files'].Checked = $false
    $chks['Show File Extensions'].Checked = $false
    $chks['Disable Sticky Keys'].Checked = $false
    $chks['Remove Bloatware Apps'].Checked = $false
    $chks['Snap Window'].Checked = $false
    $chks['Snap Assist Flyout'].Checked = $true
    $chks['Disable Bing Search in Start Menu'].Checked = $true
    $chks['Task View Button in Taskbar'].Checked = $true
    $chks['Search Button in Taskbar'].Checked = $true
    $chks['Widgets Button in Taskbar'].Checked = $true
    $chks['Verbose Messages During Logon'].Checked = $false
    $chks['Detailed BSoD'].Checked = $false
    $chks['Disable Advertising ID'].Checked = $true
    $chks['Disable Feedback Requests'].Checked = $true
    $chks['Configure Windows Update Hours'].Checked = $true
    $chks['Multiplane Overlay'].Checked = $true
})
$tabTweaks.Controls.Add($btnStandard)

$btnMinimal = New-Object System.Windows.Forms.Button
$btnMinimal.Location = New-Object System.Drawing.Point(230, 20)
$btnMinimal.Size = New-Object System.Drawing.Size(200, 35)
$btnMinimal.Text = 'Minimal'
$btnMinimal.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnMinimal.ForeColor = [System.Drawing.Color]::White
$btnMinimal.FlatStyle = 'Flat'
$btnMinimal.Add_Click({
    # Essential Tweaks - Minimal Selection (Only the safest)
    $chks['Create Restore Point'].Checked = $true
    $chks['Delete Temporary Files'].Checked = $true
    $chks['Disable Telemetry'].Checked = $true
    $chks['Disable GameDVR'].Checked = $true
    $chks['Disable Hibernation'].Checked = $false
    $chks['Optimize Mouse (No Acceleration)'].Checked = $true
    $chks['Optimize Keyboard'].Checked = $true
    $chks['High Performance Power Plan'].Checked = $true
    $chks['Disable Unnecessary Services'].Checked = $false
    $chks['Optimize Visual Effects'].Checked = $false
    $chks['Enable GPU Scheduling'].Checked = $true
    $chks['Disable Fullscreen Optimizations'].Checked = $true
    $chks['Optimize Network Settings'].Checked = $true
    $chks['Increase DNS Cache'].Checked = $false
    $chks['Disable Activity History'].Checked = $false
    $chks['Disable Location Tracking'].Checked = $false
    $chks['Disable Storage Sense'].Checked = $false
    $chks['Run Disk Cleanup'].Checked = $false
    
    # Customize Preferences - Minimal Selection
    $chks['Dark Theme for Windows'].Checked = $false
    $chks['NumLock on Startup'].Checked = $false
    $chks['Show Hidden Files'].Checked = $false
    $chks['Show File Extensions'].Checked = $false
    $chks['Disable Sticky Keys'].Checked = $false
    $chks['Remove Bloatware Apps'].Checked = $false
    $chks['Snap Window'].Checked = $false
    $chks['Snap Assist Flyout'].Checked = $false
    $chks['Disable Bing Search in Start Menu'].Checked = $false
    $chks['Task View Button in Taskbar'].Checked = $false
    $chks['Search Button in Taskbar'].Checked = $false
    $chks['Widgets Button in Taskbar'].Checked = $false
    $chks['Verbose Messages During Logon'].Checked = $false
    $chks['Detailed BSoD'].Checked = $false
    $chks['Disable Advertising ID'].Checked = $false
    $chks['Disable Feedback Requests'].Checked = $false
    $chks['Configure Windows Update Hours'].Checked = $true
    $chks['Multiplane Overlay'].Checked = $false
})
$tabTweaks.Controls.Add($btnMinimal)

$btnClear = New-Object System.Windows.Forms.Button
$btnClear.Location = New-Object System.Drawing.Point(440, 20)
$btnClear.Size = New-Object System.Drawing.Size(200, 35)
$btnClear.Text = 'Clear'
$btnClear.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnClear.ForeColor = [System.Drawing.Color]::White
$btnClear.FlatStyle = 'Flat'
$btnClear.Add_Click({
    foreach ($chk in $chks.Values) {
        $chk.Checked = $false
    }
})
$tabTweaks.Controls.Add($btnClear)

$chks = @{}

# Left Column
$lblEssential = New-Object System.Windows.Forms.Label
$lblEssential.Location = New-Object System.Drawing.Point(20, 70)
$lblEssential.Size = New-Object System.Drawing.Size(500, 30)
$lblEssential.Text = 'Essential Tweaks'
$lblEssential.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblEssential.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabTweaks.Controls.Add($lblEssential)

$yPos = 105
$essentialTweaks = @(
    'Create Restore Point',
    'Delete Temporary Files',
    'Disable Telemetry',
    'Disable GameDVR',
    'Disable Hibernation',
    'Optimize Mouse (No Acceleration)',
    'Optimize Keyboard',
    'High Performance Power Plan',
    'Disable Unnecessary Services',
    'Optimize Visual Effects',
    'Enable GPU Scheduling',
    'Disable Fullscreen Optimizations',
    'Optimize Network Settings',
    'Increase DNS Cache',
    'Disable Activity History',
    'Disable Location Tracking',
    'Disable Storage Sense',
    'Run Disk Cleanup'
)

foreach ($tweak in $essentialTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point(30, $yPos)
    $chk.Size = New-Object System.Drawing.Size(500, 25)
    $chk.Text = $tweak
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Segoe UI', 9)
    $tabTweaks.Controls.Add($chk)
    $chks[$tweak] = $chk
    $yPos += 28
}

# Right Column
$lblCustomize = New-Object System.Windows.Forms.Label
$lblCustomize.Location = New-Object System.Drawing.Point(600, 70)
$lblCustomize.Size = New-Object System.Drawing.Size(500, 30)
$lblCustomize.Text = 'Customize Preferences'
$lblCustomize.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblCustomize.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabTweaks.Controls.Add($lblCustomize)

$yPos = 105
$customizeTweaks = @(
    'Dark Theme for Windows',
    'NumLock on Startup',
    'Show Hidden Files',
    'Show File Extensions',
    'Disable Sticky Keys',
    'Remove Bloatware Apps',
    'Snap Window',
    'Snap Assist Flyout',
    'Disable Bing Search in Start Menu',
    'Task View Button in Taskbar',
    'Search Button in Taskbar',
    'Widgets Button in Taskbar',
    'Verbose Messages During Logon',
    'Detailed BSoD',
    'Disable Advertising ID',
    'Disable Feedback Requests',
    'Configure Windows Update Hours',
    'Multiplane Overlay'
)

foreach ($tweak in $customizeTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point(610, $yPos)
    $chk.Size = New-Object System.Drawing.Size(500, 25)
    $chk.Text = $tweak
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Segoe UI', 9)
    $tabTweaks.Controls.Add($chk)
    $chks[$tweak] = $chk
    $yPos += 28
}

$btnRunTweaks = New-Object System.Windows.Forms.Button
$btnRunTweaks.Location = New-Object System.Drawing.Point(30, 600)
$btnRunTweaks.Size = New-Object System.Drawing.Size(240, 38)
$btnRunTweaks.Text = 'Run Tweaks'
$btnRunTweaks.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnRunTweaks.BackColor = [System.Drawing.Color]::FromArgb(180, 30, 30)
$btnRunTweaks.ForeColor = [System.Drawing.Color]::White
$btnRunTweaks.FlatStyle = 'Flat'
$btnRunTweaks.FlatAppearance.BorderColor = [System.Drawing.Color]::White
$btnRunTweaks.FlatAppearance.BorderSize = 1
$tabTweaks.Controls.Add($btnRunTweaks)

# CONFIG TAB
$tabConfig = New-Object System.Windows.Forms.TabPage
$tabConfig.Text = 'Config'
$tabConfig.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabConfig)

$lblPanels = New-Object System.Windows.Forms.Label
$lblPanels.Location = New-Object System.Drawing.Point(20, 20)
$lblPanels.Size = New-Object System.Drawing.Size(400, 30)
$lblPanels.Text = 'Legacy Windows Panels'
$lblPanels.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblPanels.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabConfig.Controls.Add($lblPanels)

$yPos = 60
$panels = @('Computer Management', 'Control Panel', 'Network Connections', 'Power Panel', 'Printer Panel', 'Region', 'Windows Restore', 'Sound Settings', 'System Properties', 'Time and Date')

foreach ($panel in $panels) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Location = New-Object System.Drawing.Point(30, $yPos)
    $btn.Size = New-Object System.Drawing.Size(480, 35)
    $btn.Text = $panel
    $btn.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = 'Flat'
    $tabConfig.Controls.Add($btn)
    $yPos += 40
}

$lblFixes = New-Object System.Windows.Forms.Label
$lblFixes.Location = New-Object System.Drawing.Point(600, 20)
$lblFixes.Size = New-Object System.Drawing.Size(300, 30)
$lblFixes.Text = 'Fixes'
$lblFixes.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblFixes.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabConfig.Controls.Add($lblFixes)

$yPos = 60
$fixes = @('Reset Windows Update', 'Reset Network', 'System Corruption Scan', 'WinGet Reinstall')

foreach ($fix in $fixes) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Location = New-Object System.Drawing.Point(610, $yPos)
    $btn.Size = New-Object System.Drawing.Size(480, 35)
    $btn.Text = $fix
    $btn.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = 'Flat'
    $tabConfig.Controls.Add($btn)
    $yPos += 40
}

# SERVICES TAB
$tabServices = New-Object System.Windows.Forms.TabPage
$tabServices.Text = 'Services'
$tabServices.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabServices)

$lblServices = New-Object System.Windows.Forms.Label
$lblServices.Location = New-Object System.Drawing.Point(20, 20)
$lblServices.Size = New-Object System.Drawing.Size(1100, 30)
$lblServices.Text = 'Services to Disable (Select and click "Disable Selected Services")'
$lblServices.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblServices.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabServices.Controls.Add($lblServices)

$serviceChks = @{}
$yPos = 60
$xPos = 30

$servicesToDisable = @(
    @{Name='Bluetooth Audio Gateway Service'; Service='BTAGService'},
    @{Name='Bluetooth Support Service'; Service='bthserv'},
    @{Name='BitLocker Drive Encryption Service'; Service='BDESVC'},
    @{Name='Device Management Wireless Service'; Service='dmwappushservice'},
    @{Name='Downloaded Maps Manager'; Service='MapsBroker'},
    @{Name='Fax'; Service='Fax'},
    @{Name='FH V-Host Service'; Service='fhsvc'},
    @{Name='Hyper-V Data Exchange Service'; Service='vmickvpexchange'},
    @{Name='Hyper-V Guest Service Interface'; Service='vmicguestinterface'},
    @{Name='Hyper-V Guest Shutdown Service'; Service='vmicshutdown'},
    @{Name='Hyper-V Heartbeat Service'; Service='vmicheartbeat'},
    @{Name='Hyper-V PowerShell Direct Service'; Service='vmicvmsession'},
    @{Name='Hyper-V Remote Desktop Virtualization'; Service='vmicrdv'},
    @{Name='Hyper-V Time Synchronization Service'; Service='vmictimesync'},
    @{Name='Hyper-V Volume Shadow Copy'; Service='vmicvss'},
    @{Name='Xbox Accessory Management'; Service='XboxGipSvc'},
    @{Name='Xbox Live Auth Manager'; Service='XblAuthManager'},
    @{Name='Xbox Live Game Save'; Service='XblGameSave'},
    @{Name='Xbox Live Networking Service'; Service='XboxNetApiSvc'},
    @{Name='Windows Image Acquisition'; Service='stisvc'},
    @{Name='Windows Insider Service'; Service='wisvc'},
    @{Name='Windows Error Reporting Service'; Service='WerSvc'}
)

$columnCount = 0
foreach ($svc in $servicesToDisable) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 25)
    $chk.Text = $svc.Name
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Segoe UI', 9)
    $chk.Tag = $svc.Service
    $tabServices.Controls.Add($chk)
    $serviceChks[$svc.Service] = $chk
    
    $yPos += 28
    $columnCount++
    
    if ($columnCount -eq 11) {
        $xPos = 580
        $yPos = 60
    }
}

$btnDisableServices = New-Object System.Windows.Forms.Button
$btnDisableServices.Location = New-Object System.Drawing.Point(30, 600)
$btnDisableServices.Size = New-Object System.Drawing.Size(300, 40)
$btnDisableServices.Text = 'Disable Selected Services'
$btnDisableServices.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnDisableServices.BackColor = [System.Drawing.Color]::FromArgb(150, 20, 20)
$btnDisableServices.ForeColor = [System.Drawing.Color]::White
$btnDisableServices.FlatStyle = 'Flat'
$btnDisableServices.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Disable selected services?`n`nThis will stop and disable the selected services.", "Confirm", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Warning)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        foreach ($key in $serviceChks.Keys) {
            if ($serviceChks[$key].Checked) {
                try {
                    Stop-Service -Name $key -Force -ErrorAction SilentlyContinue
                    Set-Service -Name $key -StartupType Disabled -ErrorAction SilentlyContinue
                    $count++
                } catch {}
            }
        }
        [System.Windows.Forms.MessageBox]::Show("Disabled $count services successfully!", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})
$tabServices.Controls.Add($btnDisableServices)

$btnSelectAllServices = New-Object System.Windows.Forms.Button
$btnSelectAllServices.Location = New-Object System.Drawing.Point(350, 600)
$btnSelectAllServices.Size = New-Object System.Drawing.Size(200, 40)
$btnSelectAllServices.Text = 'Select All'
$btnSelectAllServices.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnSelectAllServices.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnSelectAllServices.ForeColor = [System.Drawing.Color]::White
$btnSelectAllServices.FlatStyle = 'Flat'
$btnSelectAllServices.Add_Click({ foreach ($chk in $serviceChks.Values) { $chk.Checked = $true } })
$tabServices.Controls.Add($btnSelectAllServices)

$btnDeselectAllServices = New-Object System.Windows.Forms.Button
$btnDeselectAllServices.Location = New-Object System.Drawing.Point(560, 600)
$btnDeselectAllServices.Size = New-Object System.Drawing.Size(200, 40)
$btnDeselectAllServices.Text = 'Deselect All'
$btnDeselectAllServices.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnDeselectAllServices.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnDeselectAllServices.ForeColor = [System.Drawing.Color]::White
$btnDeselectAllServices.FlatStyle = 'Flat'
$btnDeselectAllServices.Add_Click({ foreach ($chk in $serviceChks.Values) { $chk.Checked = $false } })
$tabServices.Controls.Add($btnDeselectAllServices)

# Bottom Buttons
$btnSelectAll = New-Object System.Windows.Forms.Button
$btnSelectAll.Location = New-Object System.Drawing.Point(300, 760)
$btnSelectAll.Size = New-Object System.Drawing.Size(200, 45)
$btnSelectAll.Text = 'Select All'
$btnSelectAll.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnSelectAll.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnSelectAll.ForeColor = [System.Drawing.Color]::White
$btnSelectAll.FlatStyle = 'Flat'
$btnSelectAll.Add_Click({ foreach ($chk in $chks.Values) { $chk.Checked = $true } })
$form.Controls.Add($btnSelectAll)

$btnDeselectAll = New-Object System.Windows.Forms.Button
$btnDeselectAll.Location = New-Object System.Drawing.Point(520, 760)
$btnDeselectAll.Size = New-Object System.Drawing.Size(200, 45)
$btnDeselectAll.Text = 'Deselect All'
$btnDeselectAll.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnDeselectAll.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnDeselectAll.ForeColor = [System.Drawing.Color]::White
$btnDeselectAll.FlatStyle = 'Flat'
$btnDeselectAll.Add_Click({ foreach ($chk in $chks.Values) { $chk.Checked = $false } })
$form.Controls.Add($btnDeselectAll)

$btnApply = New-Object System.Windows.Forms.Button
$btnApply.Location = New-Object System.Drawing.Point(740, 760)
$btnApply.Size = New-Object System.Drawing.Size(250, 45)
$btnApply.Text = 'APPLY'
$btnApply.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$btnApply.BackColor = [System.Drawing.Color]::FromArgb(180, 30, 30)
$btnApply.ForeColor = [System.Drawing.Color]::White
$btnApply.FlatStyle = 'Flat'
$btnApply.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply optimizations?", "ChargieTweaks", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $form.Hide()
        $progressForm = New-Object System.Windows.Forms.Form
        $progressForm.Text = 'Optimizing...'
        $progressForm.Size = New-Object System.Drawing.Size(700, 400)
        $progressForm.StartPosition = 'CenterScreen'
        $progressForm.BackColor = [System.Drawing.Color]::FromArgb(10, 10, 10)
        
        $progressLabel = New-Object System.Windows.Forms.Label
        $progressLabel.Location = New-Object System.Drawing.Point(20, 20)
        $progressLabel.Size = New-Object System.Drawing.Size(650, 30)
        $progressLabel.ForeColor = [System.Drawing.Color]::White
        $progressForm.Controls.Add($progressLabel)
        
        $progressBar = New-Object System.Windows.Forms.ProgressBar
        $progressBar.Location = New-Object System.Drawing.Point(20, 60)
        $progressBar.Size = New-Object System.Drawing.Size(650, 30)
        $progressForm.Controls.Add($progressBar)
        
        $outputBox = New-Object System.Windows.Forms.TextBox
        $outputBox.Location = New-Object System.Drawing.Point(20, 100)
        $outputBox.Size = New-Object System.Drawing.Size(650, 250)
        $outputBox.Multiline = $true
        $outputBox.ScrollBars = 'Vertical'
        $outputBox.ReadOnly = $true
        $outputBox.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
        $outputBox.ForeColor = [System.Drawing.Color]::LimeGreen
        $progressForm.Controls.Add($outputBox)
        
        $progressForm.Show()
        
        $selected = @()
        foreach ($k in $chks.Keys) { if ($chks[$k].Checked) { $selected += $k } }
        $total = $selected.Count
        if ($total -eq 0) { $total = 1 }
        $current = 0
        
        function Update-Progress($msg) {
            $script:current++
            $progressBar.Value = [int](($script:current / $total) * 100)
            $progressLabel.Text = $msg
            $outputBox.AppendText("$msg`r`n")
            $outputBox.SelectionStart = $outputBox.TextLength
            $outputBox.ScrollToCaret()
            [System.Windows.Forms.Application]::DoEvents()
        }
        
        try {
            if ($chks['Create Restore Point'].Checked) {
                Update-Progress "Creating restore point..."
                Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
                Checkpoint-Computer -Description "ChargieTweaks" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue
            }
            if ($chks['Delete Temporary Files'].Checked) {
                Update-Progress "Deleting temp files..."
                Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Telemetry'].Checked) {
                Update-Progress "Disabling telemetry..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Disable GameDVR'].Checked) {
                Update-Progress "Disabling Game DVR..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "GameDVR_Enabled" -Value 0 -Force -ErrorAction SilentlyContinue
            }
            if ($chks['Optimize Mouse (No Acceleration)'].Checked) {
                Update-Progress "Optimizing mouse..."
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Optimize Keyboard'].Checked) {
                Update-Progress "Optimizing keyboard..."
                Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Value 31 -ErrorAction SilentlyContinue
            }
            if ($chks['High Performance Power Plan'].Checked) {
                Update-Progress "Setting power plan..."
                $plan = powercfg -list | Select-String "High performance"
                if ($plan) { powercfg -setactive $plan.ToString().Split()[3] }
            }
            if ($chks['Disable Unnecessary Services'].Checked) {
                Update-Progress "Disabling services..."
                $services = @("DiagTrack", "dmwappushservice", "SysMain", "WSearch", "XblAuthManager", "XblGameSave", "XboxNetApiSvc", "XboxGipSvc")
                foreach ($s in $services) {
                    Stop-Service -Name $s -Force -ErrorAction SilentlyContinue
                    Set-Service -Name $s -StartupType Disabled -ErrorAction SilentlyContinue
                }
            }
            if ($chks['Optimize Visual Effects'].Checked) {
                Update-Progress "Optimizing visuals..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue
            }
            if ($chks['Enable GPU Scheduling'].Checked) {
                Update-Progress "Enabling GPU scheduling..."
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -Force -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Fullscreen Optimizations'].Checked) {
                Update-Progress "Disabling fullscreen opt..."
                Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehaviorMode" -Value 2 -Force -ErrorAction SilentlyContinue
            }
            if ($chks['Optimize Network Settings'].Checked) {
                Update-Progress "Optimizing network..."
                $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
                foreach ($a in $adapters) {
                    $p = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($a.InterfaceGuid)"
                    if (Test-Path $p) {
                        Set-ItemProperty -Path $p -Name "TcpAckFrequency" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path $p -Name "TCPNoDelay" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
                    }
                }
            }
            if ($chks['Increase DNS Cache'].Checked) {
                Update-Progress "Increasing DNS cache..."
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" -Name "CacheHashTableSize" -Value 384 -Type DWord -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Activity History'].Checked) {
                Update-Progress "Disabling activity history..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Location Tracking'].Checked) {
                Update-Progress "Disabling location..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny" -ErrorAction SilentlyContinue
            }
            if ($chks['Remove Bloatware Apps'].Checked) {
                Update-Progress "Removing bloatware..."
                $bloat = @("Microsoft.BingNews", "Microsoft.GetHelp", "Microsoft.Getstarted", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.XboxGamingOverlay", "Microsoft.ZuneMusic")
                foreach ($app in $bloat) {
                    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
                }
            }
            if ($chks['Configure Windows Update Hours'].Checked) {
                Update-Progress "Configuring updates..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursStart" -Value 8 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursEnd" -Value 2 -ErrorAction SilentlyContinue
            }
            
            $progressBar.Value = 100
            $outputBox.AppendText("`r`n=== COMPLETE ===`r`nRestart recommended.`r`n")
            Start-Sleep -Seconds 2
            [System.Windows.Forms.MessageBox]::Show("Optimization complete!`n`nRestart recommended.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Error: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        }
        $progressForm.Close()
        $form.Close()
    }
})
$form.Controls.Add($btnApply)

[void]$form.ShowDialog()
