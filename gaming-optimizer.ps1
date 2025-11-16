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
$tabControl.Size = New-Object System.Drawing.Size(1150, 660)
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
$btnRunTweaks.Location = New-Object System.Drawing.Point(610, 602)
$btnRunTweaks.Size = New-Object System.Drawing.Size(236, 36)
$btnRunTweaks.Text = 'Run Tweaks'
$btnRunTweaks.Font = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
$btnRunTweaks.BackColor = [System.Drawing.Color]::FromArgb(180, 30, 30)
$btnRunTweaks.ForeColor = [System.Drawing.Color]::White
$btnRunTweaks.FlatStyle = 'Flat'
$btnRunTweaks.FlatAppearance.BorderColor = [System.Drawing.Color]::White
$btnRunTweaks.FlatAppearance.BorderSize = 2
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
$panelCommands = @('compmgmt.msc', 'control', 'ncpa.cpl', 'powercfg.cpl', 'control printers', 'intl.cpl', 'rstrui.exe', 'mmsys.cpl', 'sysdm.cpl', 'timedate.cpl')

for ($i = 0; $i -lt $panels.Count; $i++) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Location = New-Object System.Drawing.Point(30, $yPos)
    $btn.Size = New-Object System.Drawing.Size(480, 35)
    $btn.Text = $panels[$i]
    $btn.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = 'Flat'
    $btn.Tag = $panelCommands[$i]
    $btn.Add_Click({ Start-Process $this.Tag -ErrorAction SilentlyContinue })
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
$fixes = @(
    @{Name='Reset Windows Update'; Action={
        Stop-Service wuauserv, cryptSvc, bits, msiserver -Force -ErrorAction SilentlyContinue
        Remove-Item "$env:SystemRoot\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue
        Start-Service wuauserv, cryptSvc, bits, msiserver -ErrorAction SilentlyContinue
        [System.Windows.Forms.MessageBox]::Show("Windows Update reset complete!", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }},
    @{Name='Reset Network'; Action={
        netsh winsock reset
        netsh int ip reset
        ipconfig /release
        ipconfig /renew
        ipconfig /flushdns
        [System.Windows.Forms.MessageBox]::Show("Network reset complete! Restart recommended.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }},
    @{Name='System Corruption Scan'; Action={
        Start-Process powershell -ArgumentList "sfc /scannow; DISM /Online /Cleanup-Image /RestoreHealth" -Verb RunAs
    }},
    @{Name='WinGet Reinstall'; Action={
        Start-Process powershell -ArgumentList "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -Verb RunAs
    }}
)

foreach ($fix in $fixes) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Location = New-Object System.Drawing.Point(610, $yPos)
    $btn.Size = New-Object System.Drawing.Size(480, 35)
    $btn.Text = $fix.Name
    $btn.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = 'Flat'
    $btn.Tag = $fix.Action
    $btn.Add_Click({ & $this.Tag })
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

# PERFORMANCE/ADVANCED TAB
$tabPerformance = New-Object System.Windows.Forms.TabPage
$tabPerformance.Text = 'Performance'
$tabPerformance.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabPerformance)

$lblPerfInfo = New-Object System.Windows.Forms.Label
$lblPerfInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblPerfInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblPerfInfo.Text = 'Advanced Performance Tweaks - Safe for Gaming (Select and click "Apply Performance Tweaks")'
$lblPerfInfo.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblPerfInfo.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabPerformance.Controls.Add($lblPerfInfo)

$perfChks = @{}
$yPos = 60
$xPos = 30

$performanceTweaks = @(
    @{Name='Disable CPU Core Parking (Max Performance)'; Safe=$true},
    @{Name='Disable HPET (High Precision Event Timer)'; Safe=$true},
    @{Name='Set GPU to Maximum Performance Mode'; Safe=$true},
    @{Name='Disable USB Selective Suspend'; Safe=$true},
    @{Name='Disable PCIe Power Management'; Safe=$true},
    @{Name='Enable MSI Mode for GPU (If Supported)'; Safe=$true},
    @{Name='Optimize Processor Scheduling for Programs'; Safe=$true},
    @{Name='Disable Memory Compression'; Safe=$true},
    @{Name='Set System Responsiveness to Maximum'; Safe=$true},
    @{Name='Disable Fast Startup (Improves Boot Reliability)'; Safe=$true},
    @{Name='Set Timer Resolution to 0.5ms'; Safe=$true},
    @{Name='Disable Prefetch and Superfetch'; Safe=$true},
    @{Name='Optimize Network Adapter Power Settings'; Safe=$true},
    @{Name='Disable Windows Search Indexing'; Safe=$true},
    @{Name='Set Page File to System Managed'; Safe=$true},
    @{Name='Disable Power Throttling'; Safe=$true},
    @{Name='Disable VBS (Virtualization Based Security)'; Safe=$true},
    @{Name='Disable Spectre/Meltdown Mitigations'; Safe=$false},
    @{Name='Disable Processor Idle States (Max CPU)'; Safe=$false},
    @{Name='Disable C-States (Prevents CPU Sleep)'; Safe=$false}
)

$columnCount = 0
foreach ($tweak in $performanceTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 25)
    $chk.Text = $tweak.Name
    if ($tweak.Safe) {
        $chk.ForeColor = [System.Drawing.Color]::LimeGreen
        $chk.Checked = $true
    } else {
        $chk.ForeColor = [System.Drawing.Color]::Orange
        $chk.Checked = $false
    }
    $chk.Font = New-Object System.Drawing.Font('Segoe UI', 9)
    $tabPerformance.Controls.Add($chk)
    $perfChks[$tweak.Name] = $chk
    
    $yPos += 28
    $columnCount++
    
    if ($columnCount -eq 10) {
        $xPos = 580
        $yPos = 60
    }
}

$lblWarning = New-Object System.Windows.Forms.Label
$lblWarning.Location = New-Object System.Drawing.Point(30, 570)
$lblWarning.Size = New-Object System.Drawing.Size(1080, 20)
$lblWarning.Text = '⚠️ Green = Safe for all systems | Orange = Advanced (May increase power/heat or reduce security)'
$lblWarning.Font = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Italic)
$lblWarning.ForeColor = [System.Drawing.Color]::Yellow
$tabPerformance.Controls.Add($lblWarning)

$btnApplyPerf = New-Object System.Windows.Forms.Button
$btnApplyPerf.Location = New-Object System.Drawing.Point(30, 600)
$btnApplyPerf.Size = New-Object System.Drawing.Size(300, 40)
$btnApplyPerf.Text = 'Apply Performance Tweaks'
$btnApplyPerf.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnApplyPerf.BackColor = [System.Drawing.Color]::FromArgb(150, 20, 20)
$btnApplyPerf.ForeColor = [System.Drawing.Color]::White
$btnApplyPerf.FlatStyle = 'Flat'
$btnApplyPerf.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply selected performance tweaks?`n`nRestart required for some changes.", "Confirm", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        
        if ($perfChks['Disable CPU Core Parking (Max Performance)'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" -Name "ValueMax" -Value 0 -ErrorAction SilentlyContinue
            powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPMINCORES 100
            powercfg -setactive SCHEME_CURRENT
            $count++
        }
        
        if ($perfChks['Disable HPET (High Precision Event Timer)'].Checked) {
            bcdedit /deletevalue useplatformclock
            $count++
        }
        
        if ($perfChks['Set GPU to Maximum Performance Mode'].Checked) {
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\DirectX\UserGpuPreferences" -Name "DirectXUserGlobalSettings" -Value "VRROptimizeEnable=0;" -ErrorAction SilentlyContinue
            powercfg -setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE 0
            $count++
        }
        
        if ($perfChks['Disable USB Selective Suspend'].Checked) {
            powercfg -setacvalueindex SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
            powercfg -setdcvalueindex SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
            $count++
        }
        
        if ($perfChks['Disable PCIe Power Management'].Checked) {
            powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0
            $count++
        }
        
        if ($perfChks['Enable MSI Mode for GPU (If Supported)'].Checked) {
            $gpu = Get-PnpDevice | Where-Object {$_.Class -eq "Display" -and $_.Status -eq "OK"} | Select-Object -First 1
            if ($gpu) {
                $path = "HKLM:\SYSTEM\CurrentControlSet\Enum\$($gpu.InstanceId)\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"
                New-Item -Path $path -Force -ErrorAction SilentlyContinue | Out-Null
                Set-ItemProperty -Path $path -Name "MSISupported" -Value 1 -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        if ($perfChks['Optimize Processor Scheduling for Programs'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Disable Memory Compression'].Checked) {
            Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Set System Responsiveness to Maximum'].Checked) {
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Disable Fast Startup (Improves Boot Reliability)'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Set Timer Resolution to 0.5ms'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" -Name "GlobalTimerResolutionRequests" -Value 1 -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Disable Prefetch and Superfetch'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnablePrefetcher" -Value 0 -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnableSuperfetch" -Value 0 -ErrorAction SilentlyContinue
            Stop-Service SysMain -Force -ErrorAction SilentlyContinue
            Set-Service SysMain -StartupType Disabled -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Optimize Network Adapter Power Settings'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                Set-NetAdapterPowerManagement -Name $adapter.Name -SelectiveSuspend Disabled -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        if ($perfChks['Disable Windows Search Indexing'].Checked) {
            Stop-Service WSearch -Force -ErrorAction SilentlyContinue
            Set-Service WSearch -StartupType Disabled -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Set Page File to System Managed'].Checked) {
            $cs = Get-WmiObject -Class Win32_ComputerSystem -EnableAllPrivileges
            $cs.AutomaticManagedPagefile = $true
            $cs.Put() | Out-Null
            $count++
        }
        
        if ($perfChks['Disable Power Throttling'].Checked) {
            New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Force -ErrorAction SilentlyContinue | Out-Null
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -Value 1 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Disable VBS (Virtualization Based Security)'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "RequirePlatformSecurityFeatures" -Value 0 -ErrorAction SilentlyContinue
            bcdedit /set hypervisorlaunchtype off
            $count++
        }
        
        if ($perfChks['Disable Spectre/Meltdown Mitigations'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($perfChks['Disable Processor Idle States (Max CPU)'].Checked) {
            powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE 1
            $count++
        }
        
        if ($perfChks['Disable C-States (Prevents CPU Sleep)'].Checked) {
            powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEPROMOTE 100
            powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEDEMOTE 100
            $count++
        }
        
        powercfg -setactive SCHEME_CURRENT
        
        [System.Windows.Forms.MessageBox]::Show("Applied $count performance tweaks!`n`nRestart recommended for all changes to take effect.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})
$tabPerformance.Controls.Add($btnApplyPerf)

$btnSelectAllPerf = New-Object System.Windows.Forms.Button
$btnSelectAllPerf.Location = New-Object System.Drawing.Point(350, 600)
$btnSelectAllPerf.Size = New-Object System.Drawing.Size(200, 40)
$btnSelectAllPerf.Text = 'Select Safe Only'
$btnSelectAllPerf.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnSelectAllPerf.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnSelectAllPerf.ForeColor = [System.Drawing.Color]::White
$btnSelectAllPerf.FlatStyle = 'Flat'
$btnSelectAllPerf.Add_Click({
    foreach ($chk in $perfChks.Values) {
        if ($chk.ForeColor -eq [System.Drawing.Color]::LimeGreen) {
            $chk.Checked = $true
        } else {
            $chk.Checked = $false
        }
    }
})
$tabPerformance.Controls.Add($btnSelectAllPerf)

$btnDeselectAllPerf = New-Object System.Windows.Forms.Button
$btnDeselectAllPerf.Location = New-Object System.Drawing.Point(560, 600)
$btnDeselectAllPerf.Size = New-Object System.Drawing.Size(200, 40)
$btnDeselectAllPerf.Text = 'Deselect All'
$btnDeselectAllPerf.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnDeselectAllPerf.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnDeselectAllPerf.ForeColor = [System.Drawing.Color]::White
$btnDeselectAllPerf.FlatStyle = 'Flat'
$btnDeselectAllPerf.Add_Click({ foreach ($chk in $perfChks.Values) { $chk.Checked = $false } })
$tabPerformance.Controls.Add($btnDeselectAllPerf)

# NETWORK TAB (NEW!)
$tabNetwork = New-Object System.Windows.Forms.TabPage
$tabNetwork.Text = 'Network'
$tabNetwork.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabNetwork)

$lblNetworkInfo = New-Object System.Windows.Forms.Label
$lblNetworkInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblNetworkInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblNetworkInfo.Text = 'Advanced Network Optimization - Reduce Latency & Improve Gaming Performance'
$lblNetworkInfo.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblNetworkInfo.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabNetwork.Controls.Add($lblNetworkInfo)

$networkChks = @{}
$yPos = 60
$xPos = 30

$networkTweaks = @(
    @{Name='Disable Network Throttling Index'; Safe=$true},
    @{Name='Enable TCPNoDelay (Reduce Latency)'; Safe=$true},
    @{Name='Set TCP Acknowledgment Frequency to 1'; Safe=$true},
    @{Name='Disable Nagle Algorithm (Lower Ping)'; Safe=$true},
    @{Name='Increase Network TTL (Time To Live)'; Safe=$true},
    @{Name='Optimize MTU Size (Maximum Transmission Unit)'; Safe=$true},
    @{Name='Disable Large Send Offload (LSO)'; Safe=$true},
    @{Name='Disable TCP Chimney Offload'; Safe=$true},
    @{Name='Set Network Adapter to Maximum Performance'; Safe=$true},
    @{Name='Disable Windows Auto-Tuning'; Safe=$false},
    @{Name='Increase Network Buffer Sizes'; Safe=$true},
    @{Name='Optimize Receive Side Scaling (RSS)'; Safe=$true},
    @{Name='Disable Interrupt Moderation'; Safe=$false},
    @{Name='Set DNS to Cloudflare (1.1.1.1)'; Safe=$true},
    @{Name='Disable IPv6 (If Not Used)'; Safe=$true},
    @{Name='Prioritize Network Packets (QoS)'; Safe=$true},
    @{Name='Disable Windows Network Limiter'; Safe=$true},
    @{Name='Optimize Ethernet Flow Control'; Safe=$true}
)

$columnCount = 0
foreach ($tweak in $networkTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 25)
    $chk.Text = $tweak.Name
    if ($tweak.Safe) {
        $chk.ForeColor = [System.Drawing.Color]::LimeGreen
        $chk.Checked = $true
    } else {
        $chk.ForeColor = [System.Drawing.Color]::Orange
        $chk.Checked = $false
    }
    $chk.Font = New-Object System.Drawing.Font('Segoe UI', 9)
    $tabNetwork.Controls.Add($chk)
    $networkChks[$tweak.Name] = $chk
    
    $yPos += 28
    $columnCount++
    
    if ($columnCount -eq 9) {
        $xPos = 580
        $yPos = 60
    }
}

$lblNetWarning = New-Object System.Windows.Forms.Label
$lblNetWarning.Location = New-Object System.Drawing.Point(30, 570)
$lblNetWarning.Size = New-Object System.Drawing.Size(1080, 20)
$lblNetWarning.Text = '⚠️ Green = Safe optimizations | Orange = May affect some network features'
$lblNetWarning.Font = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Italic)
$lblNetWarning.ForeColor = [System.Drawing.Color]::Yellow
$tabNetwork.Controls.Add($lblNetWarning)

$btnApplyNetwork = New-Object System.Windows.Forms.Button
$btnApplyNetwork.Location = New-Object System.Drawing.Point(30, 600)
$btnApplyNetwork.Size = New-Object System.Drawing.Size(300, 40)
$btnApplyNetwork.Text = 'Apply Network Tweaks'
$btnApplyNetwork.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnApplyNetwork.BackColor = [System.Drawing.Color]::FromArgb(150, 20, 20)
$btnApplyNetwork.ForeColor = [System.Drawing.Color]::White
$btnApplyNetwork.FlatStyle = 'Flat'
$btnApplyNetwork.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply network optimizations?`n`nThis will optimize your network for gaming.", "Confirm", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        
        if ($networkChks['Disable Network Throttling Index'].Checked) {
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($networkChks['Enable TCPNoDelay (Reduce Latency)'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($adapter.InterfaceGuid)"
                if (Test-Path $regPath) {
                    Set-ItemProperty -Path $regPath -Name "TCPNoDelay" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                }
            }
            $count++
        }
        
        if ($networkChks['Set TCP Acknowledgment Frequency to 1'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($adapter.InterfaceGuid)"
                if (Test-Path $regPath) {
                    Set-ItemProperty -Path $regPath -Name "TcpAckFrequency" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                }
            }
            $count++
        }
        
        if ($networkChks['Disable Nagle Algorithm (Lower Ping)'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpNoDelay" -Value 1 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($networkChks['Increase Network TTL (Time To Live)'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultTTL" -Value 64 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($networkChks['Optimize MTU Size (Maximum Transmission Unit)'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                netsh interface ipv4 set subinterface $adapter.InterfaceIndex mtu=1500 store=persistent
            }
            $count++
        }
        
        if ($networkChks['Disable Large Send Offload (LSO)'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                Set-NetAdapterLso -Name $adapter.Name -IPv4Enabled $false -IPv6Enabled $false -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        if ($networkChks['Disable TCP Chimney Offload'].Checked) {
            netsh int tcp set global chimney=disabled
            $count++
        }
        
        if ($networkChks['Set Network Adapter to Maximum Performance'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Green Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Power Saving Mode" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        if ($networkChks['Disable Windows Auto-Tuning'].Checked) {
            netsh int tcp set global autotuninglevel=disabled
            $count++
        }
        
        if ($networkChks['Increase Network Buffer Sizes'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpWindowSize" -Value 65535 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "Tcp1323Opts" -Value 3 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($networkChks['Optimize Receive Side Scaling (RSS)'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                Enable-NetAdapterRss -Name $adapter.Name -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        if ($networkChks['Disable Interrupt Moderation'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Interrupt Moderation" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        if ($networkChks['Set DNS to Cloudflare (1.1.1.1)'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses ("1.1.1.1","1.0.0.1") -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        if ($networkChks['Disable IPv6 (If Not Used)'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                Disable-NetAdapterBinding -Name $adapter.Name -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        if ($networkChks['Prioritize Network Packets (QoS)'].Checked) {
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Name "NonBestEffortLimit" -Value 0 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($networkChks['Disable Windows Network Limiter'].Checked) {
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($networkChks['Optimize Ethernet Flow Control'].Checked) {
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            foreach ($adapter in $adapters) {
                Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Flow Control" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
            }
            $count++
        }
        
        [System.Windows.Forms.MessageBox]::Show("Applied $count network optimizations!`n`nRestart recommended for all changes to take effect.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})
$tabNetwork.Controls.Add($btnApplyNetwork)

$btnSelectAllNetwork = New-Object System.Windows.Forms.Button
$btnSelectAllNetwork.Location = New-Object System.Drawing.Point(350, 600)
$btnSelectAllNetwork.Size = New-Object System.Drawing.Size(200, 40)
$btnSelectAllNetwork.Text = 'Select Safe Only'
$btnSelectAllNetwork.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnSelectAllNetwork.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnSelectAllNetwork.ForeColor = [System.Drawing.Color]::White
$btnSelectAllNetwork.FlatStyle = 'Flat'
$btnSelectAllNetwork.Add_Click({
    foreach ($chk in $networkChks.Values) {
        if ($chk.ForeColor -eq [System.Drawing.Color]::LimeGreen) {
            $chk.Checked = $true
        } else {
            $chk.Checked = $false
        }
    }
})
$tabNetwork.Controls.Add($btnSelectAllNetwork)

$btnDeselectAllNetwork = New-Object System.Windows.Forms.Button
$btnDeselectAllNetwork.Location = New-Object System.Drawing.Point(560, 600)
$btnDeselectAllNetwork.Size = New-Object System.Drawing.Size(200, 40)
$btnDeselectAllNetwork.Text = 'Deselect All'
$btnDeselectAllNetwork.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnDeselectAllNetwork.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnDeselectAllNetwork.ForeColor = [System.Drawing.Color]::White
$btnDeselectAllNetwork.FlatStyle = 'Flat'
$btnDeselectAllNetwork.Add_Click({ foreach ($chk in $networkChks.Values) { $chk.Checked = $false } })
$tabNetwork.Controls.Add($btnDeselectAllNetwork)

# AUDIO TAB (NEW!)
$tabAudio = New-Object System.Windows.Forms.TabPage
$tabAudio.Text = 'Audio'
$tabAudio.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabAudio)

$lblAudioInfo = New-Object System.Windows.Forms.Label
$lblAudioInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblAudioInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblAudioInfo.Text = 'Audio Latency Reduction & Optimization - Improve Audio Responsiveness'
$lblAudioInfo.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblAudioInfo.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabAudio.Controls.Add($lblAudioInfo)

$audioChks = @{}
$yPos = 60

$audioTweaks = @(
    @{Name='Reduce Audio Buffer Size (Lower Latency)'; Safe=$true},
    @{Name='Disable Audio Enhancements'; Safe=$true},
    @{Name='Set Audio to High Performance Mode'; Safe=$true},
    @{Name='Disable Exclusive Mode for Audio'; Safe=$false},
    @{Name='Optimize MMCSS (Multimedia Class Scheduler)'; Safe=$true},
    @{Name='Increase Audio Thread Priority'; Safe=$true},
    @{Name='Disable Audio Device Sleep Mode'; Safe=$true},
    @{Name='Set Audio Sample Rate to 48000 Hz'; Safe=$true},
    @{Name='Disable Windows Audio Effects'; Safe=$true},
    @{Name='Optimize Audio Service Priority'; Safe=$true}
)

foreach ($tweak in $audioTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point(30, $yPos)
    $chk.Size = New-Object System.Drawing.Size(1080, 25)
    $chk.Text = $tweak.Name
    if ($tweak.Safe) {
        $chk.ForeColor = [System.Drawing.Color]::LimeGreen
        $chk.Checked = $true
    } else {
        $chk.ForeColor = [System.Drawing.Color]::Orange
        $chk.Checked = $false
    }
    $chk.Font = New-Object System.Drawing.Font('Segoe UI', 9)
    $tabAudio.Controls.Add($chk)
    $audioChks[$tweak.Name] = $chk
    $yPos += 28
}

$lblAudioHelp = New-Object System.Windows.Forms.Label
$lblAudioHelp.Location = New-Object System.Drawing.Point(30, 400)
$lblAudioHelp.Size = New-Object System.Drawing.Size(1080, 40)
$lblAudioHelp.Text = "ℹ️ Audio optimizations reduce latency and improve sound quality in games.`nLower buffer sizes = less latency but may cause crackling on slower systems."
$lblAudioHelp.Font = New-Object System.Drawing.Font('Segoe UI', 9, [System.Drawing.FontStyle]::Italic)
$lblAudioHelp.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$tabAudio.Controls.Add($lblAudioHelp)

$btnApplyAudio = New-Object System.Windows.Forms.Button
$btnApplyAudio.Location = New-Object System.Drawing.Point(30, 600)
$btnApplyAudio.Size = New-Object System.Drawing.Size(300, 40)
$btnApplyAudio.Text = 'Apply Audio Tweaks'
$btnApplyAudio.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnApplyAudio.BackColor = [System.Drawing.Color]::FromArgb(150, 20, 20)
$btnApplyAudio.ForeColor = [System.Drawing.Color]::White
$btnApplyAudio.FlatStyle = 'Flat'
$btnApplyAudio.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply audio optimizations?", "Confirm", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        
        if ($audioChks['Reduce Audio Buffer Size (Lower Latency)'].Checked) {
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AudioSrv" -Name "DependOnService" -Value @("AudioEndpointBuilder","RpcSs") -Type MultiString -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NoLazyMode" -Value 1 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "AlwaysOn" -Value 1 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($audioChks['Disable Audio Enhancements'].Checked) {
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Audio" -Name "DisableProtectedAudioDG" -Value 1 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($audioChks['Set Audio to High Performance Mode'].Checked) {
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" -Name "Priority" -Value 1 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" -Name "Scheduling Category" -Value "High" -Type String -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($audioChks['Disable Exclusive Mode for Audio'].Checked) {
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Audio" -Name "AllowExclusiveMode" -Value 0 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($audioChks['Optimize MMCSS (Multimedia Class Scheduler)'].Checked) {
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" -Name "Affinity" -Value 0 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" -Name "Background Only" -Value "False" -Type String -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" -Name "Clock Rate" -Value 10000 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" -Name "GPU Priority" -Value 8 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($audioChks['Increase Audio Thread Priority'].Checked) {
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" -Name "Priority" -Value 1 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Pro Audio" -Name "Scheduling Category" -Value "High" -Type String -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($audioChks['Disable Audio Device Sleep Mode'].Checked) {
            powercfg -setacvalueindex SCHEME_CURRENT SUB_NONE DEVICEIDLE 0
            powercfg -setactive SCHEME_CURRENT
            $count++
        }
        
        if ($audioChks['Set Audio Sample Rate to 48000 Hz'].Checked) {
            Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SamplingRate" -Value 48000 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($audioChks['Disable Windows Audio Effects'].Checked) {
            Set-ItemProperty -Path "HKCU:\Software\Microsoft\Multimedia\Audio" -Name "UserDuckingPreference" -Value 3 -Type DWord -ErrorAction SilentlyContinue
            $count++
        }
        
        if ($audioChks['Optimize Audio Service Priority'].Checked) {
            sc config Audiosrv start= auto
            sc config AudioEndpointBuilder start= auto
            $count++
        }
        
        [System.Windows.Forms.MessageBox]::Show("Applied $count audio optimizations!`n`nRestart recommended for all changes to take effect.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})
$tabAudio.Controls.Add($btnApplyAudio)

$btnSelectAllAudio = New-Object System.Windows.Forms.Button
$btnSelectAllAudio.Location = New-Object System.Drawing.Point(350, 600)
$btnSelectAllAudio.Size = New-Object System.Drawing.Size(200, 40)
$btnSelectAllAudio.Text = 'Select All Safe'
$btnSelectAllAudio.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnSelectAllAudio.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnSelectAllAudio.ForeColor = [System.Drawing.Color]::White
$btnSelectAllAudio.FlatStyle = 'Flat'
$btnSelectAllAudio.Add_Click({
    foreach ($chk in $audioChks.Values) {
        if ($chk.ForeColor -eq [System.Drawing.Color]::LimeGreen) {
            $chk.Checked = $true
        } else {
            $chk.Checked = $false
        }
    }
})
$tabAudio.Controls.Add($btnSelectAllAudio)

$btnDeselectAllAudio = New-Object System.Windows.Forms.Button
$btnDeselectAllAudio.Location = New-Object System.Drawing.Point(560, 600)
$btnDeselectAllAudio.Size = New-Object System.Drawing.Size(200, 40)
$btnDeselectAllAudio.Text = 'Deselect All'
$btnDeselectAllAudio.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnDeselectAllAudio.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnDeselectAllAudio.ForeColor = [System.Drawing.Color]::White
$btnDeselectAllAudio.FlatStyle = 'Flat'
$btnDeselectAllAudio.Add_Click({ foreach ($chk in $audioChks.Values) { $chk.Checked = $false } })
$tabAudio.Controls.Add($btnDeselectAllAudio)

# PROCESSES TAB
$tabProcesses = New-Object System.Windows.Forms.TabPage
$tabProcesses.Text = 'Processes'
$tabProcesses.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabProcesses)

$lblProcessInfo = New-Object System.Windows.Forms.Label
$lblProcessInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblProcessInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblProcessInfo.Text = 'Process Priority Management - Lower background processes to boost gaming performance'
$lblProcessInfo.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblProcessInfo.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabProcesses.Controls.Add($lblProcessInfo)

# Common Background Processes Section
$lblCommonProcs = New-Object System.Windows.Forms.Label
$lblCommonProcs.Location = New-Object System.Drawing.Point(20, 60)
$lblCommonProcs.Size = New-Object System.Drawing.Size(500, 25)
$lblCommonProcs.Text = 'Common Background Processes to Lower'
$lblCommonProcs.Font = New-Object System.Drawing.Font('Segoe UI', 10, [System.Drawing.FontStyle]::Bold)
$lblCommonProcs.ForeColor = [System.Drawing.Color]::FromArgb(200, 200, 200)
$tabProcesses.Controls.Add($lblCommonProcs)

$processChks = @{}
$yPos = 90
$xPos = 30

$commonProcesses = @(
    @{Name='Chrome (chrome.exe)'; Process='chrome'; Priority='Low'},
    @{Name='Edge (msedge.exe)'; Process='msedge'; Priority='Low'},
    @{Name='Firefox (firefox.exe)'; Process='firefox'; Priority='Low'},
    @{Name='Discord (Discord.exe)'; Process='Discord'; Priority='BelowNormal'},
    @{Name='Spotify (Spotify.exe)'; Process='Spotify'; Priority='BelowNormal'},
    @{Name='Steam (steam.exe)'; Process='steam'; Priority='BelowNormal'},
    @{Name='Epic Games Launcher'; Process='EpicGamesLauncher'; Priority='BelowNormal'},
    @{Name='OneDrive (OneDrive.exe)'; Process='OneDrive'; Priority='Low'},
    @{Name='Windows Update (wuauserv)'; Process='wuauserv'; Priority='Low'},
    @{Name='Windows Defender (MsMpEng.exe)'; Process='MsMpEng'; Priority='BelowNormal'},
    @{Name='Cortana (SearchUI.exe)'; Process='SearchUI'; Priority='Low'},
    @{Name='Windows Security (SecurityHealthSystray)'; Process='SecurityHealthSystray'; Priority='Low'},
    @{Name='Nvidia Share (nvcontainer.exe)'; Process='nvcontainer'; Priority='BelowNormal'},
    @{Name='AMD Software (RadeonSoftware.exe)'; Process='RadeonSoftware'; Priority='BelowNormal'},
    @{Name='GeForce Experience (GFExperience.exe)'; Process='GFExperience'; Priority='BelowNormal'},
    @{Name='Origin (Origin.exe)'; Process='Origin'; Priority='BelowNormal'},
    @{Name='Battle.net (Battle.net.exe)'; Process='Battle.net'; Priority='BelowNormal'},
    @{Name='Razer Synapse (RzSynapse.exe)'; Process='RzSynapse'; Priority='BelowNormal'},
    @{Name='Logitech G HUB (lghub.exe)'; Process='lghub'; Priority='BelowNormal'},
    @{Name='MSI Afterburner (MSIAfterburner.exe)'; Process='MSIAfterburner'; Priority='BelowNormal'},
    @{Name='Wallpaper Engine'; Process='wallpaper32'; Priority='Low'},
    @{Name='OBS Studio (obs64.exe)'; Process='obs64'; Priority='BelowNormal'},
    @{Name='Streamlabs OBS'; Process='Streamlabs OBS'; Priority='BelowNormal'},
    @{Name='TeamViewer'; Process='TeamViewer'; Priority='Low'}
)

$columnCount = 0
foreach ($proc in $commonProcesses) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 20)
    $chk.Text = $proc.Name
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Segoe UI', 9)
    $chk.Tag = $proc
    $chk.Checked = $true
    $tabProcesses.Controls.Add($chk)
    $processChks[$proc.Process] = $chk
    
    $yPos += 22
    $columnCount++
    
    if ($columnCount -eq 12) {
        $xPos = 580
        $yPos = 90
    }
}

# Priority Buttons
$btnLowerProcesses = New-Object System.Windows.Forms.Button
$btnLowerProcesses.Location = New-Object System.Drawing.Point(30, 560)
$btnLowerProcesses.Size = New-Object System.Drawing.Size(300, 40)
$btnLowerProcesses.Text = 'Lower Selected Processes'
$btnLowerProcesses.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnLowerProcesses.BackColor = [System.Drawing.Color]::FromArgb(150, 20, 20)
$btnLowerProcesses.ForeColor = [System.Drawing.Color]::White
$btnLowerProcesses.FlatStyle = 'Flat'
$btnLowerProcesses.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Lower priority for selected processes?`n`nThis will reduce CPU priority for background applications.", "Confirm", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        $notFound = 0
        
        foreach ($chk in $processChks.Values) {
            if ($chk.Checked) {
                $procInfo = $chk.Tag
                $processes = Get-Process -Name $procInfo.Process -ErrorAction SilentlyContinue
                
                if ($processes) {
                    foreach ($p in $processes) {
                        try {
                            $p.PriorityClass = $procInfo.Priority
                            $count++
                        } catch {
                            # Process may have exited or access denied
                        }
                    }
                } else {
                    $notFound++
                }
            }
        }
        
        $msg = "Successfully lowered $count process(es)!"
        if ($notFound -gt 0) {
            $msg += "`n$notFound process(es) not currently running."
        }
        [System.Windows.Forms.MessageBox]::Show($msg, "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    }
})
$tabProcesses.Controls.Add($btnLowerProcesses)

$btnResetProcesses = New-Object System.Windows.Forms.Button
$btnResetProcesses.Location = New-Object System.Drawing.Point(350, 560)
$btnResetProcesses.Size = New-Object System.Drawing.Size(250, 40)
$btnResetProcesses.Text = 'Reset to Normal Priority'
$btnResetProcesses.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnResetProcesses.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnResetProcesses.ForeColor = [System.Drawing.Color]::White
$btnResetProcesses.FlatStyle = 'Flat'
$btnResetProcesses.Add_Click({
    $count = 0
    foreach ($chk in $processChks.Values) {
        if ($chk.Checked) {
            $procInfo = $chk.Tag
            $processes = Get-Process -Name $procInfo.Process -ErrorAction SilentlyContinue
            
            if ($processes) {
                foreach ($p in $processes) {
                    try {
                        $p.PriorityClass = 'Normal'
                        $count++
                    } catch {}
                }
            }
        }
    }
    [System.Windows.Forms.MessageBox]::Show("Reset $count process(es) to normal priority!", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})
$tabProcesses.Controls.Add($btnResetProcesses)

$btnSelectAllProcs = New-Object System.Windows.Forms.Button
$btnSelectAllProcs.Location = New-Object System.Drawing.Point(620, 560)
$btnSelectAllProcs.Size = New-Object System.Drawing.Size(150, 40)
$btnSelectAllProcs.Text = 'Select All'
$btnSelectAllProcs.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnSelectAllProcs.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnSelectAllProcs.ForeColor = [System.Drawing.Color]::White
$btnSelectAllProcs.FlatStyle = 'Flat'
$btnSelectAllProcs.Add_Click({ foreach ($chk in $processChks.Values) { $chk.Checked = $true } })
$tabProcesses.Controls.Add($btnSelectAllProcs)

$btnDeselectAllProcs = New-Object System.Windows.Forms.Button
$btnDeselectAllProcs.Location = New-Object System.Drawing.Point(780, 560)
$btnDeselectAllProcs.Size = New-Object System.Drawing.Size(150, 40)
$btnDeselectAllProcs.Text = 'Deselect All'
$btnDeselectAllProcs.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnDeselectAllProcs.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnDeselectAllProcs.ForeColor = [System.Drawing.Color]::White
$btnDeselectAllProcs.FlatStyle = 'Flat'
$btnDeselectAllProcs.Add_Click({ foreach ($chk in $processChks.Values) { $chk.Checked = $false } })
$tabProcesses.Controls.Add($btnDeselectAllProcs)

# Info Label
$lblProcHelp = New-Object System.Windows.Forms.Label
$lblProcHelp.Location = New-Object System.Drawing.Point(30, 610)
$lblProcHelp.Size = New-Object System.Drawing.Size(1080, 35)
$lblProcHelp.Text = "ℹ️ Lowering process priority reduces CPU resources given to background apps, boosting game performance.`nChanges are temporary and reset when processes restart. Run before gaming for best results."
$lblProcHelp.Font = New-Object System.Drawing.Font('Segoe UI', 8, [System.Drawing.FontStyle]::Italic)
$lblProcHelp.ForeColor = [System.Drawing.Color]::FromArgb(180, 180, 180)
$tabProcesses.Controls.Add($lblProcHelp)

# EXTRAS TAB
$tabExtras = New-Object System.Windows.Forms.TabPage
$tabExtras.Text = 'Extras'
$tabExtras.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabExtras)

$lblExtras = New-Object System.Windows.Forms.Label
$lblExtras.Location = New-Object System.Drawing.Point(20, 20)
$lblExtras.Size = New-Object System.Drawing.Size(1100, 30)
$lblExtras.Text = 'Extra Quality of Life Tweaks'
$lblExtras.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$lblExtras.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$tabExtras.Controls.Add($lblExtras)

$extrasChks = @{}
$yPos = 60

$extrasTweaks = @(
    @{Name='Force Shutdown Even When Apps Prevent It'; Reg='HKCU:\Control Panel\Desktop'; Key='AutoEndTasks'; Value='1'; Type='String'},
    @{Name='Hide Web Results from Windows Search'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Search'; Key='BingSearchEnabled'; Value=0; Type='DWord'},
    @{Name='Disable the Pointless Lock Screen'; Reg='HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'; Key='NoLockScreen'; Value=1; Type='DWord'},
    @{Name='Set Menu Show Delay to 0ms (Instant Menus)'; Reg='HKCU:\Control Panel\Desktop'; Key='MenuShowDelay'; Value='0'; Type='String'},
    @{Name='Reduce App Hung Timeout (Kill Faster)'; Reg='HKCU:\Control Panel\Desktop'; Key='HungAppTimeout'; Value='1000'; Type='String'},
    @{Name='Reduce Wait to Kill App Timeout (2 seconds)'; Reg='HKCU:\Control Panel\Desktop'; Key='WaitToKillAppTimeout'; Value='2000'; Type='String'},
    @{Name='Reduce Wait to Kill Service Timeout (2 seconds)'; Reg='HKLM:\SYSTEM\CurrentControlSet\Control'; Key='WaitToKillServiceTimeout'; Value='2000'; Type='String'},
    @{Name='Reduce Mouse Hover Time to 10ms'; Reg='HKCU:\Control Panel\Mouse'; Key='MouseHoverTime'; Value='10'; Type='String'},
    @{Name='Set Foreground Lock Timeout to 0 (Instant Focus)'; Reg='HKCU:\Control Panel\Desktop'; Key='ForegroundLockTimeout'; Value=0; Type='DWord'},
    @{Name='Reduce Cursor Blink Rate (Faster Typing Feel)'; Reg='HKCU:\Control Panel\Desktop'; Key='CursorBlinkRate'; Value='200'; Type='String'},
    @{Name='Disable Low Disk Space Checks (Reduce Delays)'; Reg='HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'; Key='NoLowDiskSpaceChecks'; Value=1; Type='DWord'},
    @{Name='Disable Animation When Minimizing/Maximizing'; Reg='HKCU:\Control Panel\Desktop\WindowMetrics'; Key='MinAnimate'; Value='0'; Type='String'},
    @{Name='Disable Taskbar Animation Delays'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'; Key='TaskbarAnimations'; Value=0; Type='DWord'},
    @{Name='Disable Thumbnail Preview Delay'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'; Key='ExtendedUIHoverTime'; Value=0; Type='DWord'},
    @{Name='Disable Mouse Pointer Hiding (When Typing)'; Reg='HKCU:\Control Panel\Desktop'; Key='UserPreferencesMask'; Value=[byte[]](0x9e,0x1e,0x06,0x80,0x12,0x00,0x00,0x00); Type='Binary'},
    @{Name='Show This PC Instead of Quick Access'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'; Key='LaunchTo'; Value=1; Type='DWord'},
    @{Name='Disable Aero Shake (Window Minimize Shake)'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'; Key='DisallowShaking'; Value=1; Type='DWord'},
    @{Name='Remove 3D Objects from This PC'; Reg='HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}'; Key='DELETE'; Value=''; Type='Delete'},
    @{Name='Show Seconds in Taskbar Clock'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'; Key='ShowSecondsInSystemClock'; Value=1; Type='DWord'},
    @{Name='Disable Windows Tips and Suggestions'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager'; Key='SubscribedContent-338389Enabled'; Value=0; Type='DWord'},
    @{Name='Disable Cortana'; Reg='HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search'; Key='AllowCortana'; Value=0; Type='DWord'},
    @{Name='Disable OneDrive'; Reg='HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive'; Key='DisableFileSyncNGSC'; Value=1; Type='DWord'},
    @{Name='Always Show All Tray Icons'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer'; Key='EnableAutoTray'; Value=0; Type='DWord'},
    @{Name='Disable News and Interests on Taskbar'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds'; Key='ShellFeedsTaskbarViewMode'; Value=2; Type='DWord'},
    @{Name='Remove Meet Now from Taskbar'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'; Key='HideSCAMeetNow'; Value=1; Type='DWord'},
    @{Name='Disable Game Bar Tips'; Reg='HKCU:\Software\Microsoft\GameBar'; Key='ShowStartupPanel'; Value=0; Type='DWord'},
    @{Name='Disable Startup Delay for All Apps'; Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize'; Key='StartupDelayInMSec'; Value=0; Type='DWord'}
)

$columnCount = 0
$xPos = 30
foreach ($tweak in $extrasTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 20)
    $chk.Text = $tweak.Name
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Segoe UI', 9)
    $chk.Tag = $tweak
    $chk.Checked = $true
    $tabExtras.Controls.Add($chk)
    $extrasChks[$tweak.Name] = $chk
    $yPos += 22
    $columnCount++
    
    if ($columnCount -eq 14) {
        $xPos = 580
        $yPos = 60
    }
}

$btnApplyExtras = New-Object System.Windows.Forms.Button
$btnApplyExtras.Location = New-Object System.Drawing.Point(30, 600)
$btnApplyExtras.Size = New-Object System.Drawing.Size(300, 40)
$btnApplyExtras.Text = 'Apply Selected Extras'
$btnApplyExtras.Font = New-Object System.Drawing.Font('Segoe UI', 11, [System.Drawing.FontStyle]::Bold)
$btnApplyExtras.BackColor = [System.Drawing.Color]::FromArgb(150, 20, 20)
$btnApplyExtras.ForeColor = [System.Drawing.Color]::White
$btnApplyExtras.FlatStyle = 'Flat'
$btnApplyExtras.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply selected extras?`n`nExplorer restart may be required.", "Confirm", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        
        foreach ($chk in $extrasChks.Values) {
            if ($chk.Checked) {
                $tweak = $chk.Tag
                try {
                    if ($tweak.Type -eq 'Delete') {
                        Remove-Item -Path $tweak.Reg -Recurse -Force -ErrorAction SilentlyContinue
                    } elseif ($tweak.Type -eq 'Create') {
                        New-Item -Path $tweak.Reg -Force -ErrorAction SilentlyContinue | Out-Null
                    } else {
                        if (!(Test-Path $tweak.Reg)) {
                            New-Item -Path $tweak.Reg -Force -ErrorAction SilentlyContinue | Out-Null
                        }
                        if ($tweak.Type -eq 'Binary') {
                            Set-ItemProperty -Path $tweak.Reg -Name $tweak.Key -Value $tweak.Value -Type Binary -ErrorAction SilentlyContinue
                        } elseif ($tweak.Type -eq 'DWord') {
                            Set-ItemProperty -Path $tweak.Reg -Name $tweak.Key -Value $tweak.Value -Type DWord -ErrorAction SilentlyContinue
                        } else {
                            Set-ItemProperty -Path $tweak.Reg -Name $tweak.Key -Value $tweak.Value -ErrorAction SilentlyContinue
                        }
                    }
                    $count++
                } catch {}
            }
        }
        
        $restartExplorer = [System.Windows.Forms.MessageBox]::Show("Applied $count extras successfully!`n`nRestart File Explorer now to see changes?", "Success", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Information)
        
        if ($restartExplorer -eq [System.Windows.Forms.DialogResult]::Yes) {
            Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
            Start-Process explorer
        }
    }
})
$tabExtras.Controls.Add($btnApplyExtras)

$btnSelectAllExtras = New-Object System.Windows.Forms.Button
$btnSelectAllExtras.Location = New-Object System.Drawing.Point(350, 600)
$btnSelectAllExtras.Size = New-Object System.Drawing.Size(200, 40)
$btnSelectAllExtras.Text = 'Select All'
$btnSelectAllExtras.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnSelectAllExtras.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnSelectAllExtras.ForeColor = [System.Drawing.Color]::White
$btnSelectAllExtras.FlatStyle = 'Flat'
$btnSelectAllExtras.Add_Click({ foreach ($chk in $extrasChks.Values) { $chk.Checked = $true } })
$tabExtras.Controls.Add($btnSelectAllExtras)

$btnDeselectAllExtras = New-Object System.Windows.Forms.Button
$btnDeselectAllExtras.Location = New-Object System.Drawing.Point(560, 600)
$btnDeselectAllExtras.Size = New-Object System.Drawing.Size(200, 40)
$btnDeselectAllExtras.Text = 'Deselect All'
$btnDeselectAllExtras.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$btnDeselectAllExtras.BackColor = [System.Drawing.Color]::FromArgb(40, 15, 15)
$btnDeselectAllExtras.ForeColor = [System.Drawing.Color]::White
$btnDeselectAllExtras.FlatStyle = 'Flat'
$btnDeselectAllExtras.Add_Click({ foreach ($chk in $extrasChks.Values) { $chk.Checked = $false } })
$tabExtras.Controls.Add($btnDeselectAllExtras)

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
            if ($chks['Disable Hibernation'].Checked) {
                Update-Progress "Disabling hibernation..."
                powercfg -h off
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
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Location Tracking'].Checked) {
                Update-Progress "Disabling location..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny" -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Storage Sense'].Checked) {
                Update-Progress "Disabling Storage Sense..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Name "01" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Run Disk Cleanup'].Checked) {
                Update-Progress "Running disk cleanup..."
                Start-Process cleanmgr -ArgumentList "/sagerun:1" -NoNewWindow -ErrorAction SilentlyContinue
            }
            if ($chks['Dark Theme for Windows'].Checked) {
                Update-Progress "Enabling dark theme..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['NumLock on Startup'].Checked) {
                Update-Progress "Enabling NumLock on startup..."
                Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Value 2 -ErrorAction SilentlyContinue
            }
            if ($chks['Show Hidden Files'].Checked) {
                Update-Progress "Showing hidden files..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1 -ErrorAction SilentlyContinue
            }
            if ($chks['Show File Extensions'].Checked) {
                Update-Progress "Showing file extensions..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Sticky Keys'].Checked) {
                Update-Progress "Disabling sticky keys..."
                Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value 506 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\Keyboard Response" -Name "Flags" -Value 122 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\ToggleKeys" -Name "Flags" -Value 58 -ErrorAction SilentlyContinue
            }
            if ($chks['Remove Bloatware Apps'].Checked) {
                Update-Progress "Removing bloatware..."
                $bloat = @("Microsoft.BingNews", "Microsoft.GetHelp", "Microsoft.Getstarted", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.XboxGamingOverlay", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo", "Microsoft.People", "Microsoft.WindowsFeedbackHub", "Microsoft.YourPhone", "Microsoft.MixedReality.Portal")
                foreach ($app in $bloat) {
                    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
                }
            }
            if ($chks['Snap Window'].Checked) {
                Update-Progress "Enabling snap window..."
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "WindowArrangementActive" -Value 1 -ErrorAction SilentlyContinue
            }
            if ($chks['Snap Assist Flyout'].Checked) {
                Update-Progress "Enabling snap assist flyout..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SnapAssist" -Value 1 -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Bing Search in Start Menu'].Checked) {
                Update-Progress "Disabling Bing search..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Task View Button in Taskbar'].Checked) {
                Update-Progress "Showing task view button..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 1 -ErrorAction SilentlyContinue
            }
            if ($chks['Search Button in Taskbar'].Checked) {
                Update-Progress "Showing search button..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 1 -ErrorAction SilentlyContinue
            }
            if ($chks['Widgets Button in Taskbar'].Checked) {
                Update-Progress "Showing widgets button..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -Value 1 -ErrorAction SilentlyContinue
            }
            if ($chks['Verbose Messages During Logon'].Checked) {
                Update-Progress "Enabling verbose logon..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "VerboseStatus" -Value 1 -ErrorAction SilentlyContinue
            }
            if ($chks['Detailed BSoD'].Checked) {
                Update-Progress "Enabling detailed BSoD..."
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl" -Name "DisplayParameters" -Value 1 -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Advertising ID'].Checked) {
                Update-Progress "Disabling advertising ID..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Disable Feedback Requests'].Checked) {
                Update-Progress "Disabling feedback..."
                Set-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 0 -ErrorAction SilentlyContinue
            }
            if ($chks['Configure Windows Update Hours'].Checked) {
                Update-Progress "Configuring updates..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursStart" -Value 8 -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursEnd" -Value 2 -ErrorAction SilentlyContinue
            }
            if ($chks['Multiplane Overlay'].Checked) {
                Update-Progress "Enabling multiplane overlay..."
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Dwm" -Name "OverlayTestMode" -Value 5 -ErrorAction SilentlyContinue
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
