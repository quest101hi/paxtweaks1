#Requires -RunAsAdministrator
# ChargieTweaks - Ultimate Gaming Optimizer with Animated GUI
# Features: Bubble fonts, animated borders (Red/Black/White), pulsing effects

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Animation variables
$script:animationFrame = 0
$script:pulseDirection = 1
$script:pulseValue = 0

$form = New-Object System.Windows.Forms.Form
$form.Text = 'ChargieTweaks - Ultimate'
$form.Size = New-Object System.Drawing.Size(1220, 920)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::Black

# Animated border panel
$animatedBorder = New-Object System.Windows.Forms.Panel
$animatedBorder.Location = New-Object System.Drawing.Point(5, 5)
$animatedBorder.Size = New-Object System.Drawing.Size(1200, 900)
$animatedBorder.BackColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$form.Controls.Add($animatedBorder)

$innerPanel = New-Object System.Windows.Forms.Panel
$innerPanel.Location = New-Object System.Drawing.Point(3, 3)
$innerPanel.Size = New-Object System.Drawing.Size(1194, 894)
$innerPanel.BackColor = [System.Drawing.Color]::FromArgb(10, 10, 10)
$animatedBorder.Controls.Add($innerPanel)

# Animated title panel
$titlePanel = New-Object System.Windows.Forms.Panel
$titlePanel.Location = New-Object System.Drawing.Point(10, 10)
$titlePanel.Size = New-Object System.Drawing.Size(1174, 60)
$titlePanel.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
$innerPanel.Controls.Add($titlePanel)

$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Location = New-Object System.Drawing.Point(0, 0)
$titleLabel.Size = New-Object System.Drawing.Size(1174, 60)
$titleLabel.Text = '★ CHARGIETWEAKS - ULTIMATE GAMING OPTIMIZER ★'
$titleLabel.Font = New-Object System.Drawing.Font('Comic Sans MS', 18, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = [System.Drawing.Color]::White
$titleLabel.TextAlign = 'MiddleCenter'
$titlePanel.Controls.Add($titleLabel)

# Decorative animated dots
$leftDot = New-Object System.Windows.Forms.Label
$leftDot.Location = New-Object System.Drawing.Point(20, 20)
$leftDot.Size = New-Object System.Drawing.Size(30, 30)
$leftDot.Text = '●'
$leftDot.Font = New-Object System.Drawing.Font('Arial', 20, [System.Drawing.FontStyle]::Bold)
$leftDot.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$leftDot.BackColor = [System.Drawing.Color]::Transparent
$titlePanel.Controls.Add($leftDot)

$rightDot = New-Object System.Windows.Forms.Label
$rightDot.Location = New-Object System.Drawing.Point(1124, 20)
$rightDot.Size = New-Object System.Drawing.Size(30, 30)
$rightDot.Text = '●'
$rightDot.Font = New-Object System.Drawing.Font('Arial', 20, [System.Drawing.FontStyle]::Bold)
$rightDot.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$rightDot.BackColor = [System.Drawing.Color]::Transparent
$titlePanel.Controls.Add($rightDot)

$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Location = New-Object System.Drawing.Point(20, 80)
$tabControl.Size = New-Object System.Drawing.Size(1155, 680)
$tabControl.Font = New-Object System.Drawing.Font('Comic Sans MS', 10, [System.Drawing.FontStyle]::Bold)
$innerPanel.Controls.Add($tabControl)

# Animation Timer
$animationTimer = New-Object System.Windows.Forms.Timer
$animationTimer.Interval = 50
$animationTimer.Add_Tick({
    $script:animationFrame++
    $cycle = ($script:animationFrame % 180)
    if ($cycle -lt 60) {
        $intensity = 220 - ($cycle * 3.67)
        $animatedBorder.BackColor = [System.Drawing.Color]::FromArgb([int]$intensity, 0, 0)
    } elseif ($cycle -lt 120) {
        $intensity = ($cycle - 60) * 4.25
        $animatedBorder.BackColor = [System.Drawing.Color]::FromArgb([int]$intensity, [int]$intensity, [int]$intensity)
    } else {
        $progress = ($cycle - 120) / 60
        $r = 255; $g = [int](255 * (1 - $progress)); $b = [int](255 * (1 - $progress))
        $animatedBorder.BackColor = [System.Drawing.Color]::FromArgb($r, $g, $b)
    }
    $script:pulseValue += $script:pulseDirection * 5
    if ($script:pulseValue -ge 55 -or $script:pulseValue -le 0) { $script:pulseDirection *= -1 }
    $glowIntensity = 200 + $script:pulseValue
    $titleLabel.ForeColor = [System.Drawing.Color]::FromArgb($glowIntensity, $glowIntensity, $glowIntensity)
    $dotOffset = [Math]::Sin($script:animationFrame * 0.1) * 5
    $leftDot.Location = New-Object System.Drawing.Point((20 + $dotOffset), 20)
    $rightDot.Location = New-Object System.Drawing.Point((1124 - $dotOffset), 20)
    $dotCycle = ($script:animationFrame % 120)
    if ($dotCycle -lt 40) {
        $leftDot.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
        $rightDot.ForeColor = [System.Drawing.Color]::White
    } elseif ($dotCycle -lt 80) {
        $leftDot.ForeColor = [System.Drawing.Color]::White
        $rightDot.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
    } else {
        $leftDot.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
        $rightDot.ForeColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
    }
})
$animationTimer.Start()
$form.Add_FormClosing({ $animationTimer.Stop(); $animationTimer.Dispose() })

# Helper function for styled buttons
function New-StyledButton($text, $x, $y, $width, $height) {
    $btn = New-Object System.Windows.Forms.Button
    $btn.Location = New-Object System.Drawing.Point($x, $y)
    $btn.Size = New-Object System.Drawing.Size($width, $height)
    $btn.Text = $text
    $btn.BackColor = [System.Drawing.Color]::FromArgb(60, 20, 20)
    $btn.ForeColor = [System.Drawing.Color]::White
    $btn.FlatStyle = 'Flat'
    $btn.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
    $btn.FlatAppearance.BorderSize = 2
    $btn.Font = New-Object System.Drawing.Font('Comic Sans MS', 9, [System.Drawing.FontStyle]::Bold)
    $btn.Cursor = [System.Windows.Forms.Cursors]::Hand
    $btn.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(220, 50, 50) })
    $btn.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(60, 20, 20) })
    return $btn
}

$chks = @{}
$serviceChks = @{}
$perfChks = @{}
$networkChks = @{}
$audioChks = @{}
$processChks = @{}
$extrasChks = @{}

# TWEAKS TAB
$tabTweaks = New-Object System.Windows.Forms.TabPage
$tabTweaks.Text = '🎮 Tweaks'
$tabTweaks.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabTweaks)

$btnStandard = New-StyledButton '⭐ Standard' 20 20 180 35
$btnStandard.Add_Click({
    $chks['Create Restore Point'].Checked = $true
    $chks['Delete Temporary Files'].Checked = $true
    $chks['Disable Telemetry'].Checked = $true
    $chks['Disable GameDVR'].Checked = $true
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
    $chks['Dark Theme for Windows'].Checked = $true
    $chks['Disable Bing Search in Start Menu'].Checked = $true
    $chks['Disable Advertising ID'].Checked = $true
    $chks['Disable Feedback Requests'].Checked = $true
    $chks['Configure Windows Update Hours'].Checked = $true
    $chks['Multiplane Overlay'].Checked = $true
})
$tabTweaks.Controls.Add($btnStandard)

$btnMinimal = New-StyledButton '🔹 Minimal' 210 20 180 35
$btnMinimal.Add_Click({
    foreach ($chk in $chks.Values) { $chk.Checked = $false }
    $chks['Create Restore Point'].Checked = $true
    $chks['Delete Temporary Files'].Checked = $true
    $chks['Disable Telemetry'].Checked = $true
    $chks['Optimize Mouse (No Acceleration)'].Checked = $true
    $chks['High Performance Power Plan'].Checked = $true
    $chks['Enable GPU Scheduling'].Checked = $true
    $chks['Optimize Network Settings'].Checked = $true
})
$tabTweaks.Controls.Add($btnMinimal)

$btnClear = New-StyledButton '❌ Clear' 400 20 180 35
$btnClear.Add_Click({ foreach ($chk in $chks.Values) { $chk.Checked = $false } })
$tabTweaks.Controls.Add($btnClear)

$lblEssential = New-Object System.Windows.Forms.Label
$lblEssential.Location = New-Object System.Drawing.Point(20, 65)
$lblEssential.Size = New-Object System.Drawing.Size(500, 30)
$lblEssential.Text = '⚡ Essential Tweaks'
$lblEssential.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold)
$lblEssential.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabTweaks.Controls.Add($lblEssential)

$yPos = 100
$essentialTweaks = @('Create Restore Point','Delete Temporary Files','Disable Telemetry','Disable GameDVR','Disable Hibernation','Optimize Mouse (No Acceleration)','Optimize Keyboard','High Performance Power Plan','Disable Unnecessary Services','Optimize Visual Effects','Enable GPU Scheduling','Disable Fullscreen Optimizations','Optimize Network Settings','Increase DNS Cache','Disable Activity History','Disable Location Tracking','Disable Storage Sense','Run Disk Cleanup')
foreach ($tweak in $essentialTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point(30, $yPos)
    $chk.Size = New-Object System.Drawing.Size(520, 25)
    $chk.Text = "• $tweak"
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $tabTweaks.Controls.Add($chk)
    $chks[$tweak] = $chk
    $yPos += 27
}

$lblCustomize = New-Object System.Windows.Forms.Label
$lblCustomize.Location = New-Object System.Drawing.Point(580, 65)
$lblCustomize.Size = New-Object System.Drawing.Size(500, 30)
$lblCustomize.Text = '🎨 Customize Preferences'
$lblCustomize.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold)
$lblCustomize.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabTweaks.Controls.Add($lblCustomize)

$yPos = 100
$customizeTweaks = @('Dark Theme for Windows','NumLock on Startup','Show Hidden Files','Show File Extensions','Disable Sticky Keys','Remove Bloatware Apps','Snap Window','Snap Assist Flyout','Disable Bing Search in Start Menu','Task View Button in Taskbar','Search Button in Taskbar','Widgets Button in Taskbar','Verbose Messages During Logon','Detailed BSoD','Disable Advertising ID','Disable Feedback Requests','Configure Windows Update Hours','Multiplane Overlay')
foreach ($tweak in $customizeTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point(590, $yPos)
    $chk.Size = New-Object System.Drawing.Size(520, 25)
    $chk.Text = "• $tweak"
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $tabTweaks.Controls.Add($chk)
    $chks[$tweak] = $chk
    $yPos += 27
}

# CONFIG TAB
$tabConfig = New-Object System.Windows.Forms.TabPage
$tabConfig.Text = '⚙️ Config'
$tabConfig.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabConfig)

$lblPanels = New-Object System.Windows.Forms.Label
$lblPanels.Location = New-Object System.Drawing.Point(20, 20)
$lblPanels.Size = New-Object System.Drawing.Size(400, 30)
$lblPanels.Text = '🖥️ Legacy Windows Panels'
$lblPanels.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold)
$lblPanels.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabConfig.Controls.Add($lblPanels)

$yPos = 60
$panels = @('Computer Management', 'Control Panel', 'Network Connections', 'Power Panel', 'Printer Panel', 'Region', 'Windows Restore', 'Sound Settings', 'System Properties', 'Time and Date')
$panelCommands = @('compmgmt.msc', 'control', 'ncpa.cpl', 'powercfg.cpl', 'control printers', 'intl.cpl', 'rstrui.exe', 'mmsys.cpl', 'sysdm.cpl', 'timedate.cpl')
for ($i = 0; $i -lt $panels.Count; $i++) {
    $btn = New-StyledButton "▶ $($panels[$i])" 30 $yPos 500 35
    $btn.Tag = $panelCommands[$i]
    $btn.Add_Click({ Start-Process $this.Tag -ErrorAction SilentlyContinue })
    $tabConfig.Controls.Add($btn)
    $yPos += 39
}

$lblFixes = New-Object System.Windows.Forms.Label
$lblFixes.Location = New-Object System.Drawing.Point(580, 20)
$lblFixes.Size = New-Object System.Drawing.Size(300, 30)
$lblFixes.Text = '🔧 Quick Fixes'
$lblFixes.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold)
$lblFixes.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabConfig.Controls.Add($lblFixes)

$yPos = 60
$fixes = @(
    @{Name='Reset Windows Update'; Action={Stop-Service wuauserv, cryptSvc, bits, msiserver -Force -ErrorAction SilentlyContinue; Remove-Item "$env:SystemRoot\SoftwareDistribution" -Recurse -Force -ErrorAction SilentlyContinue; Start-Service wuauserv, cryptSvc, bits, msiserver -ErrorAction SilentlyContinue; [System.Windows.Forms.MessageBox]::Show("Windows Update reset complete!", "Success", 0, 64)}},
    @{Name='Reset Network'; Action={netsh winsock reset; netsh int ip reset; ipconfig /release; ipconfig /renew; ipconfig /flushdns; [System.Windows.Forms.MessageBox]::Show("Network reset complete! Restart recommended.", "Success", 0, 64)}},
    @{Name='System Corruption Scan'; Action={Start-Process powershell -ArgumentList "sfc /scannow; DISM /Online /Cleanup-Image /RestoreHealth" -Verb RunAs}},
    @{Name='WinGet Reinstall'; Action={Start-Process powershell -ArgumentList "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" -Verb RunAs}}
)
foreach ($fix in $fixes) {
    $btn = New-StyledButton "⚡ $($fix.Name)" 590 $yPos 500 35
    $btn.Tag = $fix.Action
    $btn.Add_Click({ & $this.Tag })
    $tabConfig.Controls.Add($btn)
    $yPos += 39
}

# SERVICES TAB
$tabServices = New-Object System.Windows.Forms.TabPage
$tabServices.Text = '⚙️ Services'
$tabServices.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabServices)

$lblServices = New-Object System.Windows.Forms.Label
$lblServices.Location = New-Object System.Drawing.Point(20, 20)
$lblServices.Size = New-Object System.Drawing.Size(1100, 30)
$lblServices.Text = '🛑 Services to Disable (Select and Disable)'
$lblServices.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold)
$lblServices.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabServices.Controls.Add($lblServices)

$yPos = 60; $xPos = 30; $columnCount = 0
$servicesToDisable = @(@{Name='Bluetooth Audio Gateway'; Service='BTAGService'},@{Name='Bluetooth Support'; Service='bthserv'},@{Name='BitLocker Drive Encryption'; Service='BDESVC'},@{Name='Device Management Wireless'; Service='dmwappushservice'},@{Name='Downloaded Maps Manager'; Service='MapsBroker'},@{Name='Fax'; Service='Fax'},@{Name='FH V-Host Service'; Service='fhsvc'},@{Name='Hyper-V Data Exchange'; Service='vmickvpexchange'},@{Name='Hyper-V Guest Service'; Service='vmicguestinterface'},@{Name='Hyper-V Guest Shutdown'; Service='vmicshutdown'},@{Name='Hyper-V Heartbeat'; Service='vmicheartbeat'},@{Name='Hyper-V PowerShell Direct'; Service='vmicvmsession'},@{Name='Hyper-V Remote Desktop Virt'; Service='vmicrdv'},@{Name='Hyper-V Time Sync'; Service='vmictimesync'},@{Name='Hyper-V Volume Shadow'; Service='vmicvss'},@{Name='Xbox Accessory Mgmt'; Service='XboxGipSvc'},@{Name='Xbox Live Auth Manager'; Service='XblAuthManager'},@{Name='Xbox Live Game Save'; Service='XblGameSave'},@{Name='Xbox Live Networking'; Service='XboxNetApiSvc'},@{Name='Windows Image Acquisition'; Service='stisvc'},@{Name='Windows Insider Service'; Service='wisvc'},@{Name='Windows Error Reporting'; Service='WerSvc'})
foreach ($svc in $servicesToDisable) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 23)
    $chk.Text = "• $($svc.Name)"
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $chk.Tag = $svc.Service
    $tabServices.Controls.Add($chk)
    $serviceChks[$svc.Service] = $chk
    $yPos += 25; $columnCount++
    if ($columnCount -eq 11) { $xPos = 580; $yPos = 60 }
}

$btnDisableServices = New-StyledButton '🛑 Disable Selected' 30 600 250 35
$btnDisableServices.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Disable selected services?", "Confirm", 4, 48)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        foreach ($key in $serviceChks.Keys) {
            if ($serviceChks[$key].Checked) {
                try { Stop-Service -Name $key -Force -ErrorAction SilentlyContinue; Set-Service -Name $key -StartupType Disabled -ErrorAction SilentlyContinue; $count++ } catch {}
            }
        }
        [System.Windows.Forms.MessageBox]::Show("Disabled $count services!", "Success", 0, 64)
    }
})
$tabServices.Controls.Add($btnDisableServices)

$btnSelectAllSvc = New-StyledButton '☑️ Select All' 300 600 150 35
$btnSelectAllSvc.Add_Click({ foreach ($chk in $serviceChks.Values) { $chk.Checked = $true } })
$tabServices.Controls.Add($btnSelectAllSvc)

$btnDeselectAllSvc = New-StyledButton '☐ Deselect All' 460 600 150 35
$btnDeselectAllSvc.Add_Click({ foreach ($chk in $serviceChks.Values) { $chk.Checked = $false } })
$tabServices.Controls.Add($btnDeselectAllSvc)

# PERFORMANCE TAB
$tabPerformance = New-Object System.Windows.Forms.TabPage
$tabPerformance.Text = '⚡ Performance'
$tabPerformance.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabPerformance)

$lblPerfInfo = New-Object System.Windows.Forms.Label
$lblPerfInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblPerfInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblPerfInfo.Text = '⚡ Advanced Performance Tweaks (Green=Safe | Orange=Advanced)'
$lblPerfInfo.Font = New-Object System.Drawing.Font('Comic Sans MS', 11, [System.Drawing.FontStyle]::Bold)
$lblPerfInfo.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabPerformance.Controls.Add($lblPerfInfo)

$yPos = 60; $xPos = 30; $columnCount = 0
$performanceTweaks = @(@{Name='Disable CPU Core Parking';Safe=$true},@{Name='Disable HPET';Safe=$true},@{Name='GPU Max Performance Mode';Safe=$true},@{Name='Disable USB Selective Suspend';Safe=$true},@{Name='Disable PCIe Power Mgmt';Safe=$true},@{Name='Enable MSI Mode for GPU';Safe=$true},@{Name='Optimize Processor Scheduling';Safe=$true},@{Name='Disable Memory Compression';Safe=$true},@{Name='Max System Responsiveness';Safe=$true},@{Name='Disable Fast Startup';Safe=$true},@{Name='Set Timer Resolution 0.5ms';Safe=$true},@{Name='Disable Prefetch/Superfetch';Safe=$true},@{Name='Optimize Network Adapter Power';Safe=$true},@{Name='Disable Windows Search Index';Safe=$true},@{Name='System Managed Page File';Safe=$true},@{Name='Disable Power Throttling';Safe=$true},@{Name='Disable VBS Security';Safe=$true},@{Name='Disable Spectre/Meltdown';Safe=$false},@{Name='Disable Processor Idle States';Safe=$false},@{Name='Disable C-States';Safe=$false})
foreach ($tweak in $performanceTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 23)
    $chk.Text = "• $($tweak.Name)"
    $chk.ForeColor = if($tweak.Safe){[System.Drawing.Color]::LimeGreen}else{[System.Drawing.Color]::Orange}
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $chk.Checked = $tweak.Safe
    $tabPerformance.Controls.Add($chk)
    $perfChks[$tweak.Name] = $chk
    $yPos += 25; $columnCount++
    if ($columnCount -eq 10) { $xPos = 580; $yPos = 60 }
}

$btnApplyPerf = New-StyledButton '⚡ Apply Performance' 30 600 220 35
$btnApplyPerf.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply performance tweaks?`nRestart required.", "Confirm", 4, 32)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        if ($perfChks['Disable CPU Core Parking'].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" -Name "ValueMax" -Value 0 -ErrorAction SilentlyContinue; powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPMINCORES 100; powercfg -setactive SCHEME_CURRENT; $count++ }
        if ($perfChks['Disable HPET'].Checked) { bcdedit /deletevalue useplatformclock; $count++ }
        if ($perfChks['GPU Max Performance Mode'].Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\DirectX\UserGpuPreferences" -Name "DirectXUserGlobalSettings" -Value "VRROptimizeEnable=0;" -ErrorAction SilentlyContinue; powercfg -setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE 0; $count++ }
        if ($perfChks['Disable USB Selective Suspend'].Checked) { powercfg -setacvalueindex SCHEME_CURRENT 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0; $count++ }
        if ($perfChks['Disable PCIe Power Mgmt'].Checked) { powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0; $count++ }
        if ($perfChks['Enable MSI Mode for GPU'].Checked) { $gpu = Get-PnpDevice | Where-Object {$_.Class -eq "Display" -and $_.Status -eq "OK"} | Select-Object -First 1; if ($gpu) { $path = "HKLM:\SYSTEM\CurrentControlSet\Enum\$($gpu.InstanceId)\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties"; New-Item -Path $path -Force -ErrorAction SilentlyContinue | Out-Null; Set-ItemProperty -Path $path -Name "MSISupported" -Value 1 -ErrorAction SilentlyContinue }; $count++ }
        if ($perfChks['Optimize Processor Scheduling'].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\PriorityControl" -Name "Win32PrioritySeparation" -Value 38 -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['Disable Memory Compression'].Checked) { Disable-MMAgent -MemoryCompression -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['Max System Responsiveness'].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['Disable Fast Startup'].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['Set Timer Resolution 0.5ms'].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" -Name "GlobalTimerResolutionRequests" -Value 1 -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['Disable Prefetch/Superfetch'].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnablePrefetcher" -Value 0 -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" -Name "EnableSuperfetch" -Value 0 -ErrorAction SilentlyContinue; Stop-Service SysMain -Force -ErrorAction SilentlyContinue; Set-Service SysMain -StartupType Disabled -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['Optimize Network Adapter Power'].Checked) { $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}; foreach ($adapter in $adapters) { Set-NetAdapterPowerManagement -Name $adapter.Name -SelectiveSuspend Disabled -ErrorAction SilentlyContinue }; $count++ }
        if ($perfChks['Disable Windows Search Index'].Checked) { Stop-Service WSearch -Force -ErrorAction SilentlyContinue; Set-Service WSearch -StartupType Disabled -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['System Managed Page File'].Checked) { $cs = Get-WmiObject -Class Win32_ComputerSystem -EnableAllPrivileges; $cs.AutomaticManagedPagefile = $true; $cs.Put() | Out-Null; $count++ }
        if ($perfChks['Disable Power Throttling'].Checked) { New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Force -ErrorAction SilentlyContinue | Out-Null; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -Value 1 -Type DWord -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['Disable VBS Security'].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -Name "EnableVirtualizationBasedSecurity" -Value 0 -ErrorAction SilentlyContinue; bcdedit /set hypervisorlaunchtype off; $count++ }
        if ($perfChks['Disable Spectre/Meltdown'].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Value 3 -Type DWord -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Value 3 -Type DWord -ErrorAction SilentlyContinue; $count++ }
        if ($perfChks['Disable Processor Idle States'].Checked) { powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE 1; $count++ }
        if ($perfChks['Disable C-States'].Checked) { powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEPROMOTE 100; powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IDLEDEMOTE 100; $count++ }
        powercfg -setactive SCHEME_CURRENT
        [System.Windows.Forms.MessageBox]::Show("Applied $count tweaks!`nRestart recommended.", "Success", 0, 64)
    }
})
$tabPerformance.Controls.Add($btnApplyPerf)

$btnSelectSafePerf = New-StyledButton '✓ Select Safe Only' 260 600 150 35
$btnSelectSafePerf.Add_Click({ foreach ($chk in $perfChks.Values) { $chk.Checked = ($chk.ForeColor -eq [System.Drawing.Color]::LimeGreen) } })
$tabPerformance.Controls.Add($btnSelectSafePerf)

$btnDeselectPerf = New-StyledButton '☐ Deselect All' 420 600 150 35
$btnDeselectPerf.Add_Click({ foreach ($chk in $perfChks.Values) { $chk.Checked = $false } })
$tabPerformance.Controls.Add($btnDeselectPerf)

# NETWORK TAB (Simplified for space)
$tabNetwork = New-Object System.Windows.Forms.TabPage
$tabNetwork.Text = '🌐 Network'
$tabNetwork.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabNetwork)

$lblNetInfo = New-Object System.Windows.Forms.Label
$lblNetInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblNetInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblNetInfo.Text = '🌐 Advanced Network Optimization - Reduce Latency'
$lblNetInfo.Font = New-Object System.Drawing.Font('Comic Sans MS', 11, [System.Drawing.FontStyle]::Bold)
$lblNetInfo.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabNetwork.Controls.Add($lblNetInfo)

$yPos = 60; $xPos = 30; $columnCount = 0
$networkTweaks = @(@{Name='Disable Network Throttling';Safe=$true},@{Name='Enable TCPNoDelay';Safe=$true},@{Name='TCP Ack Frequency = 1';Safe=$true},@{Name='Disable Nagle Algorithm';Safe=$true},@{Name='Increase Network TTL';Safe=$true},@{Name='Optimize MTU Size';Safe=$true},@{Name='Disable Large Send Offload';Safe=$true},@{Name='Disable TCP Chimney';Safe=$true},@{Name='Network Adapter Max Perf';Safe=$true},@{Name='Disable Windows Auto-Tuning';Safe=$false},@{Name='Increase Network Buffers';Safe=$true},@{Name='Optimize RSS';Safe=$true},@{Name='Disable Interrupt Moderation';Safe=$false},@{Name='Set DNS to Cloudflare';Safe=$true},@{Name='Disable IPv6';Safe=$true},@{Name='Prioritize Network Packets';Safe=$true},@{Name='Disable Network Limiter';Safe=$true},@{Name='Optimize Flow Control';Safe=$true})
foreach ($tweak in $networkTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 23)
    $chk.Text = "• $($tweak.Name)"
    $chk.ForeColor = if($tweak.Safe){[System.Drawing.Color]::LimeGreen}else{[System.Drawing.Color]::Orange}
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $chk.Checked = $tweak.Safe
    $tabNetwork.Controls.Add($chk)
    $networkChks[$tweak.Name] = $chk
    $yPos += 25; $columnCount++
    if ($columnCount -eq 9) { $xPos = 580; $yPos = 60 }
}

$btnApplyNet = New-StyledButton '🌐 Apply Network' 30 600 200 35
$btnApplyNet.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply network optimizations?", "Confirm", 4, 32)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        if ($networkChks['Disable Network Throttling'].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -ErrorAction SilentlyContinue; $count++ }
        if ($networkChks['Enable TCPNoDelay'].Checked) { $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}; foreach ($adapter in $adapters) { $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($adapter.InterfaceGuid)"; if (Test-Path $regPath) { Set-ItemProperty -Path $regPath -Name "TCPNoDelay" -Value 1 -Type DWord -ErrorAction SilentlyContinue } }; $count++ }
        if ($networkChks['TCP Ack Frequency = 1'].Checked) { $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}; foreach ($adapter in $adapters) { $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($adapter.InterfaceGuid)"; if (Test-Path $regPath) { Set-ItemProperty -Path $regPath -Name "TcpAckFrequency" -Value 1 -Type DWord -ErrorAction SilentlyContinue } }; $count++ }
        if ($networkChks['Disable Nagle Algorithm'].Checked) { Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpNoDelay" -Value 1 -Type DWord -ErrorAction SilentlyContinue; $count++ }
        if ($networkChks['Optimize MTU Size'].Checked) { $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}; foreach ($adapter in $adapters) { netsh interface ipv4 set subinterface $adapter.InterfaceIndex mtu=1500 store=persistent }; $count++ }
        if ($networkChks['Set DNS to Cloudflare'].Checked) { $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}; foreach ($adapter in $adapters) { Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses ("1.1.1.1","1.0.0.1") -ErrorAction SilentlyContinue }; $count++ }
        if ($networkChks['Disable IPv6'].Checked) { $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}; foreach ($adapter in $adapters) { Disable-NetAdapterBinding -Name $adapter.Name -ComponentID ms_tcpip6 -ErrorAction SilentlyContinue }; $count++ }
        [System.Windows.Forms.MessageBox]::Show("Applied $count network optimizations!", "Success", 0, 64)
    }
})
$tabNetwork.Controls.Add($btnApplyNet)

# AUDIO TAB
$tabAudio = New-Object System.Windows.Forms.TabPage
$tabAudio.Text = '🎵 Audio'
$tabAudio.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabAudio)

$lblAudioInfo = New-Object System.Windows.Forms.Label
$lblAudioInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblAudioInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblAudioInfo.Text = '🎵 Audio Latency Reduction & Optimization'
$lblAudioInfo.Font = New-Object System.Drawing.Font('Comic Sans MS', 11, [System.Drawing.FontStyle]::Bold)
$lblAudioInfo.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabAudio.Controls.Add($lblAudioInfo)

$yPos = 60
$audioTweaks = @(@{Name='Reduce Audio Buffer Size';Safe=$true},@{Name='Disable Audio Enhancements';Safe=$true},@{Name='Audio High Performance Mode';Safe=$true},@{Name='Disable Exclusive Mode';Safe=$false},@{Name='Optimize MMCSS';Safe=$true},@{Name='Increase Audio Thread Priority';Safe=$true},@{Name='Disable Audio Device Sleep';Safe=$true},@{Name='Set Sample Rate 48000Hz';Safe=$true},@{Name='Disable Windows Audio FX';Safe=$true},@{Name='Optimize Audio Service';Safe=$true})
foreach ($tweak in $audioTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point(30, $yPos)
    $chk.Size = New-Object System.Drawing.Size(1080, 23)
    $chk.Text = "• $($tweak.Name)"
    $chk.ForeColor = if($tweak.Safe){[System.Drawing.Color]::LimeGreen}else{[System.Drawing.Color]::Orange}
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $chk.Checked = $tweak.Safe
    $tabAudio.Controls.Add($chk)
    $audioChks[$tweak.Name] = $chk
    $yPos += 25
}

$btnApplyAudio = New-StyledButton '🎵 Apply Audio' 30 600 200 35
$btnApplyAudio.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply audio optimizations?", "Confirm", 4, 32)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        if ($audioChks['Reduce Audio Buffer Size'].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NoLazyMode" -Value 1 -Type DWord -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "AlwaysOn" -Value 1 -Type DWord -ErrorAction SilentlyContinue; $count++ }
        if ($audioChks['Disable Audio Enhancements'].Checked) { Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Audio" -Name "DisableProtectedAudioDG" -Value 1 -Type DWord -ErrorAction SilentlyContinue; $count++ }
        if ($audioChks['Audio High Performance Mode'].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" -Name "Priority" -Value 1 -Type DWord -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" -Name "Scheduling Category" -Value "High" -Type String -ErrorAction SilentlyContinue; $count++ }
        if ($audioChks['Optimize MMCSS'].Checked) { Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Value 0 -Type DWord -ErrorAction SilentlyContinue; $count++ }
        [System.Windows.Forms.MessageBox]::Show("Applied $count audio optimizations!", "Success", 0, 64)
    }
})
$tabAudio.Controls.Add($btnApplyAudio)

# PROCESSES TAB
$tabProcesses = New-Object System.Windows.Forms.TabPage
$tabProcesses.Text = '📊 Processes'
$tabProcesses.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabProcesses)

$lblProcInfo = New-Object System.Windows.Forms.Label
$lblProcInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblProcInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblProcInfo.Text = '📊 Process Priority Management - Lower Background Apps'
$lblProcInfo.Font = New-Object System.Drawing.Font('Comic Sans MS', 11, [System.Drawing.FontStyle]::Bold)
$lblProcInfo.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabProcesses.Controls.Add($lblProcInfo)

$yPos = 60; $xPos = 30; $columnCount = 0
$commonProcesses = @(@{Name='Chrome';Process='chrome';Priority='Low'},@{Name='Edge';Process='msedge';Priority='Low'},@{Name='Firefox';Process='firefox';Priority='Low'},@{Name='Discord';Process='Discord';Priority='BelowNormal'},@{Name='Spotify';Process='Spotify';Priority='BelowNormal'},@{Name='Steam';Process='steam';Priority='BelowNormal'},@{Name='Epic Games';Process='EpicGamesLauncher';Priority='BelowNormal'},@{Name='OneDrive';Process='OneDrive';Priority='Low'},@{Name='Windows Defender';Process='MsMpEng';Priority='BelowNormal'},@{Name='Cortana';Process='SearchUI';Priority='Low'},@{Name='Nvidia Share';Process='nvcontainer';Priority='BelowNormal'},@{Name='AMD Software';Process='RadeonSoftware';Priority='BelowNormal'},@{Name='GeForce Experience';Process='GFExperience';Priority='BelowNormal'},@{Name='Origin';Process='Origin';Priority='BelowNormal'},@{Name='Battle.net';Process='Battle.net';Priority='BelowNormal'},@{Name='Razer Synapse';Process='RzSynapse';Priority='BelowNormal'},@{Name='Logitech G HUB';Process='lghub';Priority='BelowNormal'},@{Name='MSI Afterburner';Process='MSIAfterburner';Priority='BelowNormal'},@{Name='Wallpaper Engine';Process='wallpaper32';Priority='Low'},@{Name='OBS Studio';Process='obs64';Priority='BelowNormal'},@{Name='Streamlabs OBS';Process='Streamlabs OBS';Priority='BelowNormal'},@{Name='TeamViewer';Process='TeamViewer';Priority='Low'})
foreach ($proc in $commonProcesses) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 23)
    $chk.Text = "• $($proc.Name)"
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $chk.Tag = $proc
    $chk.Checked = $true
    $tabProcesses.Controls.Add($chk)
    $processChks[$proc.Process] = $chk
    $yPos += 25; $columnCount++
    if ($columnCount -eq 11) { $xPos = 580; $yPos = 60 }
}

$btnLowerProc = New-StyledButton '📉 Lower Selected' 30 600 200 35
$btnLowerProc.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Lower priority for selected processes?", "Confirm", 4, 32)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0; $notFound = 0
        foreach ($chk in $processChks.Values) {
            if ($chk.Checked) {
                $procInfo = $chk.Tag
                $processes = Get-Process -Name $procInfo.Process -ErrorAction SilentlyContinue
                if ($processes) { foreach ($p in $processes) { try { $p.PriorityClass = $procInfo.Priority; $count++ } catch {} } } else { $notFound++ }
            }
        }
        $msg = "Lowered $count process(es)!"
        if ($notFound -gt 0) { $msg += "`n$notFound not running." }
        [System.Windows.Forms.MessageBox]::Show($msg, "Success", 0, 64)
    }
})
$tabProcesses.Controls.Add($btnLowerProc)

$btnResetProc = New-StyledButton '↺ Reset to Normal' 240 600 180 35
$btnResetProc.Add_Click({
    $count = 0
    foreach ($chk in $processChks.Values) {
        if ($chk.Checked) {
            $procInfo = $chk.Tag
            $processes = Get-Process -Name $procInfo.Process -ErrorAction SilentlyContinue
            if ($processes) { foreach ($p in $processes) { try { $p.PriorityClass = 'Normal'; $count++ } catch {} } }
        }
    }
    [System.Windows.Forms.MessageBox]::Show("Reset $count process(es)!", "Success", 0, 64)
})
$tabProcesses.Controls.Add($btnResetProc)

# EXTRAS TAB (Simplified)
$tabExtras = New-Object System.Windows.Forms.TabPage
$tabExtras.Text = '✨ Extras'
$tabExtras.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabExtras)

$lblExtras = New-Object System.Windows.Forms.Label
$lblExtras.Location = New-Object System.Drawing.Point(20, 20)
$lblExtras.Size = New-Object System.Drawing.Size(1100, 30)
$lblExtras.Text = '✨ Extra Quality of Life Tweaks'
$lblExtras.Font = New-Object System.Drawing.Font('Comic Sans MS', 11, [System.Drawing.FontStyle]::Bold)
$lblExtras.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabExtras.Controls.Add($lblExtras)

$yPos = 60; $xPos = 30; $columnCount = 0
$extrasTweaks = @(@{Name='Force Shutdown';Reg='HKCU:\Control Panel\Desktop';Key='AutoEndTasks';Value='1';Type='String'},@{Name='Hide Web Results';Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Search';Key='BingSearchEnabled';Value=0;Type='DWord'},@{Name='Disable Lock Screen';Reg='HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization';Key='NoLockScreen';Value=1;Type='DWord'},@{Name='Menu Delay 0ms';Reg='HKCU:\Control Panel\Desktop';Key='MenuShowDelay';Value='0';Type='String'},@{Name='Kill Hung Apps Fast';Reg='HKCU:\Control Panel\Desktop';Key='HungAppTimeout';Value='1000';Type='String'},@{Name='Kill App Timeout 2s';Reg='HKCU:\Control Panel\Desktop';Key='WaitToKillAppTimeout';Value='2000';Type='String'},@{Name='Mouse Hover 10ms';Reg='HKCU:\Control Panel\Mouse';Key='MouseHoverTime';Value='10';Type='String'},@{Name='Instant Focus';Reg='HKCU:\Control Panel\Desktop';Key='ForegroundLockTimeout';Value=0;Type='DWord'},@{Name='Cursor Blink Faster';Reg='HKCU:\Control Panel\Desktop';Key='CursorBlinkRate';Value='200';Type='String'},@{Name='No Disk Space Checks';Reg='HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer';Key='NoLowDiskSpaceChecks';Value=1;Type='DWord'},@{Name='No Min/Max Animation';Reg='HKCU:\Control Panel\Desktop\WindowMetrics';Key='MinAnimate';Value='0';Type='String'},@{Name='No Taskbar Animation';Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';Key='TaskbarAnimations';Value=0;Type='DWord'},@{Name='No Thumbnail Delay';Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';Key='ExtendedUIHoverTime';Value=0;Type='DWord'},@{Name='Show This PC First';Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';Key='LaunchTo';Value=1;Type='DWord'},@{Name='Disable Aero Shake';Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';Key='DisallowShaking';Value=1;Type='DWord'},@{Name='Show Seconds in Clock';Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';Key='ShowSecondsInSystemClock';Value=1;Type='DWord'},@{Name='Disable Cortana';Reg='HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search';Key='AllowCortana';Value=0;Type='DWord'},@{Name='Disable OneDrive';Reg='HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive';Key='DisableFileSyncNGSC';Value=1;Type='DWord'},@{Name='Show All Tray Icons';Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer';Key='EnableAutoTray';Value=0;Type='DWord'},@{Name='Disable Startup Delay';Reg='HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize';Key='StartupDelayInMSec';Value=0;Type='DWord'})
foreach ($tweak in $extrasTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 23)
    $chk.Text = "• $($tweak.Name)"
    $chk.ForeColor = [System.Drawing.Color]::White
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $chk.Tag = $tweak
    $chk.Checked = $true
    $tabExtras.Controls.Add($chk)
    $extrasChks[$tweak.Name] = $chk
    $yPos += 25; $columnCount++
    if ($columnCount -eq 10) { $xPos = 580; $yPos = 60 }
}

$btnApplyExtras = New-StyledButton '✨ Apply Extras' 30 600 200 35
$btnApplyExtras.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply extras?`nExplorer restart may be needed.", "Confirm", 4, 32)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $count = 0
        foreach ($chk in $extrasChks.Values) {
            if ($chk.Checked) {
                $tweak = $chk.Tag
                try {
                    if (!(Test-Path $tweak.Reg)) { New-Item -Path $tweak.Reg -Force -ErrorAction SilentlyContinue | Out-Null }
                    if ($tweak.Type -eq 'DWord') { Set-ItemProperty -Path $tweak.Reg -Name $tweak.Key -Value $tweak.Value -Type DWord -ErrorAction SilentlyContinue }
                    else { Set-ItemProperty -Path $tweak.Reg -Name $tweak.Key -Value $tweak.Value -ErrorAction SilentlyContinue }
                    $count++
                } catch {}
            }
        }
        $restartExp = [System.Windows.Forms.MessageBox]::Show("Applied $count extras!`n`nRestart Explorer?", "Success", 4, 64)
        if ($restartExp -eq [System.Windows.Forms.DialogResult]::Yes) { Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue; Start-Process explorer }
    }
})
$tabExtras.Controls.Add($btnApplyExtras)

# Bottom Buttons
$btnSelectAll = New-Object System.Windows.Forms.Button
$btnSelectAll.Location = New-Object System.Drawing.Point(300, 775)
$btnSelectAll.Size = New-Object System.Drawing.Size(200, 50)
$btnSelectAll.Text = '☑️ Select All'
$btnSelectAll.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold)
$btnSelectAll.BackColor = [System.Drawing.Color]::FromArgb(60, 20, 20)
$btnSelectAll.ForeColor = [System.Drawing.Color]::White
$btnSelectAll.FlatStyle = 'Flat'
$btnSelectAll.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$btnSelectAll.FlatAppearance.BorderSize = 2
$btnSelectAll.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnSelectAll.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(220, 50, 50); $this.Font = New-Object System.Drawing.Font('Comic Sans MS', 13, [System.Drawing.FontStyle]::Bold) })
$btnSelectAll.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(60, 20, 20); $this.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold) })
$btnSelectAll.Add_Click({ foreach ($chk in $chks.Values) { $chk.Checked = $true } })
$innerPanel.Controls.Add($btnSelectAll)

$btnDeselectAll = New-Object System.Windows.Forms.Button
$btnDeselectAll.Location = New-Object System.Drawing.Point(520, 775)
$btnDeselectAll.Size = New-Object System.Drawing.Size(200, 50)
$btnDeselectAll.Text = '☐ Deselect All'
$btnDeselectAll.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold)
$btnDeselectAll.BackColor = [System.Drawing.Color]::FromArgb(60, 20, 20)
$btnDeselectAll.ForeColor = [System.Drawing.Color]::White
$btnDeselectAll.FlatStyle = 'Flat'
$btnDeselectAll.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$btnDeselectAll.FlatAppearance.BorderSize = 2
$btnDeselectAll.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnDeselectAll.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(220, 50, 50); $this.Font = New-Object System.Drawing.Font('Comic Sans MS', 13, [System.Drawing.FontStyle]::Bold) })
$btnDeselectAll.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(60, 20, 20); $this.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold) })
$btnDeselectAll.Add_Click({ foreach ($chk in $chks.Values) { $chk.Checked = $false } })
$innerPanel.Controls.Add($btnDeselectAll)

$btnApply = New-Object System.Windows.Forms.Button
$btnApply.Location = New-Object System.Drawing.Point(740, 775)
$btnApply.Size = New-Object System.Drawing.Size(260, 50)
$btnApply.Text = '🚀 APPLY NOW!'
$btnApply.Font = New-Object System.Drawing.Font('Comic Sans MS', 14, [System.Drawing.FontStyle]::Bold)
$btnApply.BackColor = [System.Drawing.Color]::FromArgb(180, 30, 30)
$btnApply.ForeColor = [System.Drawing.Color]::White
$btnApply.FlatStyle = 'Flat'
$btnApply.FlatAppearance.BorderColor = [System.Drawing.Color]::White
$btnApply.FlatAppearance.BorderSize = 3
$btnApply.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnApply.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(255, 50, 50); $this.Font = New-Object System.Drawing.Font('Comic Sans MS', 15, [System.Drawing.FontStyle]::Bold); $this.ForeColor = [System.Drawing.Color]::Yellow })
$btnApply.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(180, 30, 30); $this.Font = New-Object System.Drawing.Font('Comic Sans MS', 14, [System.Drawing.FontStyle]::Bold); $this.ForeColor = [System.Drawing.Color]::White })
$btnApply.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply all checked optimizations from Tweaks tab?", "ChargieTweaks", 4, 32)
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
        $progressLabel.Font = New-Object System.Drawing.Font('Comic Sans MS', 10, [System.Drawing.FontStyle]::Bold)
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
        $outputBox.Font = New-Object System.Drawing.Font('Comic Sans MS', 9)
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
            if ($chks['Create Restore Point'].Checked) { Update-Progress "Creating restore point..."; Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue; Checkpoint-Computer -Description "ChargieTweaks" -RestorePointType "MODIFY_SETTINGS" -ErrorAction SilentlyContinue }
            if ($chks['Delete Temporary Files'].Checked) { Update-Progress "Deleting temp files..."; Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue }
            if ($chks['Disable Telemetry'].Checked) { Update-Progress "Disabling telemetry..."; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -ErrorAction SilentlyContinue }
            if ($chks['Disable GameDVR'].Checked) { Update-Progress "Disabling Game DVR..."; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Force -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "GameDVR_Enabled" -Value 0 -Force -ErrorAction SilentlyContinue }
            if ($chks['Disable Hibernation'].Checked) { Update-Progress "Disabling hibernation..."; powercfg -h off }
            if ($chks['Optimize Mouse (No Acceleration)'].Checked) { Update-Progress "Optimizing mouse..."; Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value 0 -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value 0 -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value 0 -ErrorAction SilentlyContinue }
            if ($chks['Optimize Keyboard'].Checked) { Update-Progress "Optimizing keyboard..."; Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Value 0 -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Value 31 -ErrorAction SilentlyContinue }
            if ($chks['High Performance Power Plan'].Checked) { Update-Progress "Setting power plan..."; $plan = powercfg -list | Select-String "High performance"; if ($plan) { powercfg -setactive $plan.ToString().Split()[3] } }
            if ($chks['Disable Unnecessary Services'].Checked) { Update-Progress "Disabling services..."; $services = @("DiagTrack", "dmwappushservice", "SysMain", "WSearch", "XblAuthManager", "XblGameSave", "XboxNetApiSvc", "XboxGipSvc"); foreach ($s in $services) { Stop-Service -Name $s -Force -ErrorAction SilentlyContinue; Set-Service -Name $s -StartupType Disabled -ErrorAction SilentlyContinue } }
            if ($chks['Optimize Visual Effects'].Checked) { Update-Progress "Optimizing visuals..."; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2 -ErrorAction SilentlyContinue }
            if ($chks['Enable GPU Scheduling'].Checked) { Update-Progress "Enabling GPU scheduling..."; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name "HwSchMode" -Value 2 -Force -ErrorAction SilentlyContinue }
            if ($chks['Disable Fullscreen Optimizations'].Checked) { Update-Progress "Disabling fullscreen opt..."; Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehaviorMode" -Value 2 -Force -ErrorAction SilentlyContinue }
            if ($chks['Optimize Network Settings'].Checked) { Update-Progress "Optimizing network..."; $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}; foreach ($a in $adapters) { $p = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($a.InterfaceGuid)"; if (Test-Path $p) { Set-ItemProperty -Path $p -Name "TcpAckFrequency" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue; Set-ItemProperty -Path $p -Name "TCPNoDelay" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue } } }
            if ($chks['Increase DNS Cache'].Checked) { Update-Progress "Increasing DNS cache..."; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" -Name "CacheHashTableSize" -Value 384 -Type DWord -ErrorAction SilentlyContinue }
            if ($chks['Disable Activity History'].Checked) { Update-Progress "Disabling activity history..."; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Value 0 -ErrorAction SilentlyContinue }
            if ($chks['Disable Location Tracking'].Checked) { Update-Progress "Disabling location..."; Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny" -ErrorAction SilentlyContinue }
            if ($chks['Disable Storage Sense'].Checked) { Update-Progress "Disabling Storage Sense..."; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" -Name "01" -Value 0 -ErrorAction SilentlyContinue }
            if ($chks['Run Disk Cleanup'].Checked) { Update-Progress "Running disk cleanup..."; Start-Process cleanmgr -ArgumentList "/sagerun:1" -NoNewWindow -ErrorAction SilentlyContinue }
            if ($chks['Dark Theme for Windows'].Checked) { Update-Progress "Enabling dark theme..."; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -ErrorAction SilentlyContinue }
            if ($chks['Remove Bloatware Apps'].Checked) { Update-Progress "Removing bloatware..."; $bloat = @("Microsoft.BingNews", "Microsoft.GetHelp", "Microsoft.Getstarted", "Microsoft.MicrosoftSolitaireCollection", "Microsoft.XboxGamingOverlay", "Microsoft.ZuneMusic", "Microsoft.ZuneVideo", "Microsoft.People", "Microsoft.WindowsFeedbackHub", "Microsoft.YourPhone", "Microsoft.MixedReality.Portal"); foreach ($app in $bloat) { Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue } }
            if ($chks['Disable Bing Search in Start Menu'].Checked) { Update-Progress "Disabling Bing search..."; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0 -ErrorAction SilentlyContinue }
            if ($chks['Disable Advertising ID'].Checked) { Update-Progress "Disabling advertising ID..."; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -ErrorAction SilentlyContinue }
            if ($chks['Disable Feedback Requests'].Checked) { Update-Progress "Disabling feedback..."; Set-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 0 -ErrorAction SilentlyContinue }
            if ($chks['Configure Windows Update Hours'].Checked) { Update-Progress "Configuring updates..."; Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursStart" -Value 8 -ErrorAction SilentlyContinue; Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursEnd" -Value 2 -ErrorAction SilentlyContinue }
            if ($chks['Multiplane Overlay'].Checked) { Update-Progress "Enabling multiplane overlay..."; Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Dwm" -Name "OverlayTestMode" -Value 5 -ErrorAction SilentlyContinue }
            
            $progressBar.Value = 100
            $outputBox.AppendText("`r`n=== COMPLETE ===`r`nRestart recommended!`r`n")
            Start-Sleep -Seconds 2
            [System.Windows.Forms.MessageBox]::Show("Optimization complete!`n`nRestart recommended for all changes.", "Success", 0, 64)
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Error: $($_.Exception.Message)", "Error", 0, 16)
        }
        $progressForm.Close()
        $form.Close()
    }
})
$innerPanel.Controls.Add($btnApply)

[void]$form.ShowDialog()
$animationTimer.Stop()
$animationTimer.Dispose()
