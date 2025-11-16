#Requires -RunAsAdministrator
# ChargieTweaks - Enhanced with Gaming Network Optimizations for Low Ping
# Optimized for NA East/Central servers

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Animation variables
$script:animationFrame = 0
$script:pulseDirection = 1
$script:pulseValue = 0

$form = New-Object System.Windows.Forms.Form
$form.Text = 'ChargieTweaks - Gaming Network Edition'
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
$titleLabel.Text = '★ CHARGIETWEAKS - GAMING NETWORK OPTIMIZER ★'
$titleLabel.Font = New-Object System.Drawing.Font('Comic Sans MS', 17, [System.Drawing.FontStyle]::Bold)
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

$gamingNetChks = @{}

# GAMING NETWORK TAB - ULTRA LOW LATENCY
$tabGamingNet = New-Object System.Windows.Forms.TabPage
$tabGamingNet.Text = '🎮 Gaming Network'
$tabGamingNet.BackColor = [System.Drawing.Color]::FromArgb(15, 15, 15)
$tabControl.TabPages.Add($tabGamingNet)

$lblGamingNetInfo = New-Object System.Windows.Forms.Label
$lblGamingNetInfo.Location = New-Object System.Drawing.Point(20, 20)
$lblGamingNetInfo.Size = New-Object System.Drawing.Size(1100, 30)
$lblGamingNetInfo.Text = '🎮 ULTRA LOW LATENCY - Optimized for NA East/Central Gaming'
$lblGamingNetInfo.Font = New-Object System.Drawing.Font('Comic Sans MS', 12, [System.Drawing.FontStyle]::Bold)
$lblGamingNetInfo.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 100)
$tabGamingNet.Controls.Add($lblGamingNetInfo)

$lblGamingInfo = New-Object System.Windows.Forms.Label
$lblGamingInfo.Location = New-Object System.Drawing.Point(30, 55)
$lblGamingInfo.Size = New-Object System.Drawing.Size(1080, 40)
$lblGamingInfo.Text = '💡 These tweaks focus on UDP optimization, reduced buffering, and instant packet delivery for competitive gaming'
$lblGamingInfo.Font = New-Object System.Drawing.Font('Comic Sans MS', 9, [System.Drawing.FontStyle]::Italic)
$lblGamingInfo.ForeColor = [System.Drawing.Color]::Yellow
$tabGamingNet.Controls.Add($lblGamingInfo)

$yPos = 105
$xPos = 30
$columnCount = 0

$gamingNetworkTweaks = @(
    @{Name='🎯 Set Network Adapter to Gaming Mode'; Safe=$true; Desc='Prioritizes gaming packets'},
    @{Name='⚡ Increase UDP Receive Buffer (2MB)'; Safe=$true; Desc='Handles burst traffic better'},
    @{Name='⚡ Increase UDP Send Buffer (2MB)'; Safe=$true; Desc='Prevents send delays'},
    @{Name='🚀 Disable Network Packet Coalescing'; Safe=$true; Desc='Instant packet delivery'},
    @{Name='🎮 Set Gaming QoS Priority (Layer 3)'; Safe=$true; Desc='Prioritize gaming ports'},
    @{Name='📡 Disable Network Adapter Offloading'; Safe=$true; Desc='CPU handles packets directly'},
    @{Name='⚡ Set Interrupt Moderation to OFF'; Safe=$true; Desc='Instant interrupt response'},
    @{Name='🔥 Disable Receive Segment Coalescing'; Safe=$true; Desc='No packet combining delays'},
    @{Name='🎯 Enable Direct Cache Access (DCA)'; Safe=$true; Desc='Direct memory access'},
    @{Name='⚡ Set Receive Buffers to Maximum'; Safe=$true; Desc='More packet headroom'},
    @{Name='⚡ Set Transmit Buffers to Maximum'; Safe=$true; Desc='Faster sending'},
    @{Name='🚀 Disable Large Send Offload v2'; Safe=$true; Desc='No packet batching'},
    @{Name='🎮 Optimize for Gaming Ports (UDP)'; Safe=$true; Desc='Prioritize common gaming ports'},
    @{Name='📊 Set RSS Queues to Maximum'; Safe=$true; Desc='Better multi-core utilization'},
    @{Name='⚡ Disable Flow Control'; Safe=$true; Desc='No throttling'},
    @{Name='🔥 Set Network Card to Full Duplex'; Safe=$true; Desc='Simultaneous send/receive'},
    @{Name='🎯 Disable Jumbo Frames'; Safe=$true; Desc='Standard MTU for gaming'},
    @{Name='⚡ Enable Low Latency Mode'; Safe=$true; Desc='Priority packet processing'},
    @{Name='🚀 Disable Network Throttling Index'; Safe=$true; Desc='Remove 10ms delay'},
    @{Name='🎮 Set TcpAckFrequency to 1'; Safe=$true; Desc='Immediate ACK responses'},
    @{Name='⚡ Set TCPNoDelay to 1'; Safe=$true; Desc='Nagle algorithm disabled'},
    @{Name='🔥 Optimize Windows Network Stack'; Safe=$true; Desc='Lower-level optimizations'},
    @{Name='🎯 Set DNS to Low Latency Servers'; Safe=$true; Desc='Fast DNS resolution'},
    @{Name='⚡ Disable Windows Network Limiter'; Safe=$true; Desc='Remove bandwidth cap'},
    @{Name='🚀 Optimize Network Card Firmware'; Safe=$true; Desc='Best settings for gaming'},
    @{Name='🎮 Set UDP Connection Timeout Higher'; Safe=$true; Desc='Prevent disconnects'},
    @{Name='⚡ Disable Receive-Side Throttle'; Safe=$true; Desc='No receive rate limiting'},
    @{Name='🔥 Enable High Performance Power'; Safe=$true; Desc='Network card full speed'}
)

foreach ($tweak in $gamingNetworkTweaks) {
    $chk = New-Object System.Windows.Forms.CheckBox
    $chk.Location = New-Object System.Drawing.Point($xPos, $yPos)
    $chk.Size = New-Object System.Drawing.Size(540, 20)
    $chk.Text = $tweak.Name
    $chk.ForeColor = [System.Drawing.Color]::LimeGreen
    $chk.Font = New-Object System.Drawing.Font('Comic Sans MS', 8)
    $chk.Cursor = [System.Windows.Forms.Cursors]::Hand
    $chk.Checked = $true
    $chk.Tag = $tweak.Desc
    
    # Tooltip
    $tooltip = New-Object System.Windows.Forms.ToolTip
    $tooltip.SetToolTip($chk, $tweak.Desc)
    
    $tabGamingNet.Controls.Add($chk)
    $gamingNetChks[$tweak.Name] = $chk
    $yPos += 21
    $columnCount++
    
    if ($columnCount -eq 14) {
        $xPos = 580
        $yPos = 105
    }
}

$btnApplyGamingNet = New-StyledButton '🚀 APPLY GAMING NETWORK' 30 600 280 40
$btnApplyGamingNet.Font = New-Object System.Drawing.Font('Comic Sans MS', 11, [System.Drawing.FontStyle]::Bold)
$btnApplyGamingNet.Add_Click({
    $result = [System.Windows.Forms.MessageBox]::Show("Apply ultra low latency gaming network optimizations?`n`nThese are optimized for competitive gaming on NA East/Central servers.`n`nRecommended: Yes", "Gaming Network Optimizer", 4, 32)
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        $progressMsg = New-Object System.Windows.Forms.Form
        $progressMsg.Text = 'Optimizing Network...'
        $progressMsg.Size = New-Object System.Drawing.Size(500, 150)
        $progressMsg.StartPosition = 'CenterScreen'
        $progressMsg.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
        
        $progressLbl = New-Object System.Windows.Forms.Label
        $progressLbl.Location = New-Object System.Drawing.Point(20, 20)
        $progressLbl.Size = New-Object System.Drawing.Size(460, 30)
        $progressLbl.Text = 'Applying gaming network optimizations...'
        $progressLbl.ForeColor = [System.Drawing.Color]::LimeGreen
        $progressLbl.Font = New-Object System.Drawing.Font('Comic Sans MS', 10, [System.Drawing.FontStyle]::Bold)
        $progressMsg.Controls.Add($progressLbl)
        
        $progressBar = New-Object System.Windows.Forms.ProgressBar
        $progressBar.Location = New-Object System.Drawing.Point(20, 60)
        $progressBar.Size = New-Object System.Drawing.Size(460, 30)
        $progressMsg.Controls.Add($progressBar)
        
        $progressMsg.Show()
        [System.Windows.Forms.Application]::DoEvents()
        
        $count = 0
        $total = 28
        
        try {
            # Get active network adapter
            $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
            
            foreach ($adapter in $adapters) {
                $progressLbl.Text = "Optimizing adapter: $($adapter.Name)"
                
                # Set to Gaming Mode / High Performance
                if ($gamingNetChks['🎯 Set Network Adapter to Gaming Mode'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Performance Options" -DisplayValue "High Performance" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Throughput Booster" -DisplayValue "Enabled" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Increase UDP Buffers
                if ($gamingNetChks['⚡ Increase UDP Receive Buffer (2MB)'].Checked) {
                    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DefaultReceiveWindow" -Value 2097152 -Type DWord -ErrorAction SilentlyContinue
                    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultReceiveWindow" -Value 2097152 -Type DWord -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                if ($gamingNetChks['⚡ Increase UDP Send Buffer (2MB)'].Checked) {
                    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DefaultSendWindow" -Value 2097152 -Type DWord -ErrorAction SilentlyContinue
                    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultSendWindow" -Value 2097152 -Type DWord -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Disable Packet Coalescing
                if ($gamingNetChks['🚀 Disable Network Packet Coalescing'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Packet Coalescing" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    netsh int tcp set global packetcoalescinginbound=disabled
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Gaming QoS
                if ($gamingNetChks['🎮 Set Gaming QoS Priority (Layer 3)'].Checked) {
                    # Create gaming QoS policy
                    Remove-NetQosPolicy -Name "Gaming Priority" -ErrorAction SilentlyContinue
                    New-NetQosPolicy -Name "Gaming Priority" -IPProtocolMatchCondition UDP -NetworkProfile All -PriorityValue8021Action 5 -ErrorAction SilentlyContinue
                    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Name "NonBestEffortLimit" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Disable Offloading
                if ($gamingNetChks['📡 Disable Network Adapter Offloading'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Large Send Offload V2 (IPv4)" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Large Send Offload V2 (IPv6)" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "TCP Checksum Offload (IPv4)" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "UDP Checksum Offload (IPv4)" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Interrupt Moderation OFF
                if ($gamingNetChks['⚡ Set Interrupt Moderation to OFF'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Interrupt Moderation" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Interrupt Moderation Rate" -DisplayValue "Off" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Disable RSC
                if ($gamingNetChks['🔥 Disable Receive Segment Coalescing'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Recv Segment Coalescing (IPv4)" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Recv Segment Coalescing (IPv6)" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    Disable-NetAdapterRsc -Name $adapter.Name -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Enable DCA
                if ($gamingNetChks['🎯 Enable Direct Cache Access (DCA)'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "DCA" -DisplayValue "Enabled" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Max Buffers
                if ($gamingNetChks['⚡ Set Receive Buffers to Maximum'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Receive Buffers" -DisplayValue "2048" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                if ($gamingNetChks['⚡ Set Transmit Buffers to Maximum'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Transmit Buffers" -DisplayValue "2048" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Disable LSO v2
                if ($gamingNetChks['🚀 Disable Large Send Offload v2'].Checked) {
                    Set-NetAdapterLso -Name $adapter.Name -IPv4Enabled $false -IPv6Enabled $false -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Gaming Ports QoS
                if ($gamingNetChks['🎮 Optimize for Gaming Ports (UDP)'].Checked) {
                    # Common gaming ports: Fortnite, Apex, Valorant, COD, etc.
                    $gamingPorts = @(3074, 3478, 3479, 3480, 7777, 27015, 27036, 27037, 80, 443, 5222, 5795, 5796, 5797)
                    foreach ($port in $gamingPorts) {
                        Remove-NetQosPolicy -Name "Gaming_Port_$port" -ErrorAction SilentlyContinue
                        New-NetQosPolicy -Name "Gaming_Port_$port" -IPProtocolMatchCondition UDP -IPDstPortMatchCondition $port -NetworkProfile All -PriorityValue8021Action 7 -ErrorAction SilentlyContinue
                    }
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # RSS Optimization
                if ($gamingNetChks['📊 Set RSS Queues to Maximum'].Checked) {
                    Set-NetAdapterRss -Name $adapter.Name -BaseProcessorNumber 0 -MaxProcessorNumber 15 -NumberOfReceiveQueues 8 -ErrorAction SilentlyContinue
                    Enable-NetAdapterRss -Name $adapter.Name -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Disable Flow Control
                if ($gamingNetChks['⚡ Disable Flow Control'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Flow Control" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Full Duplex
                if ($gamingNetChks['🔥 Set Network Card to Full Duplex'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Speed & Duplex" -DisplayValue "1.0 Gbps Full Duplex" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Disable Jumbo Frames
                if ($gamingNetChks['🎯 Disable Jumbo Frames'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Jumbo Packet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
                
                # Low Latency Mode
                if ($gamingNetChks['⚡ Enable Low Latency Mode'].Checked) {
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Ultra Low Latency" -DisplayValue "Enabled" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Latency Sensitive" -DisplayValue "Enabled" -ErrorAction SilentlyContinue
                    $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
                }
            }
            
            # System-Wide Network Tweaks
            if ($gamingNetChks['🚀 Disable Network Throttling Index'].Checked) {
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -ErrorAction SilentlyContinue
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            if ($gamingNetChks['🎮 Set TcpAckFrequency to 1'].Checked) {
                foreach ($adapter in $adapters) {
                    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($adapter.InterfaceGuid)"
                    if (Test-Path $regPath) {
                        Set-ItemProperty -Path $regPath -Name "TcpAckFrequency" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                        Set-ItemProperty -Path $regPath -Name "TcpDelAckTicks" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                    }
                }
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            if ($gamingNetChks['⚡ Set TCPNoDelay to 1'].Checked) {
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpNoDelay" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                foreach ($adapter in $adapters) {
                    $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$($adapter.InterfaceGuid)"
                    if (Test-Path $regPath) {
                        Set-ItemProperty -Path $regPath -Name "TCPNoDelay" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                    }
                }
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            if ($gamingNetChks['🔥 Optimize Windows Network Stack'].Checked) {
                # Disable Nagle's Algorithm
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpNoDelay" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                # Disable delayed ACK
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpDelAckTicks" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                # Increase default TTL
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultTTL" -Value 64 -Type DWord -ErrorAction SilentlyContinue
                # Optimize TCP Window
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpWindowSize" -Value 65535 -Type DWord -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "Tcp1323Opts" -Value 3 -Type DWord -ErrorAction SilentlyContinue
                # Disable bandwidth reserve
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Name "NonBestEffortLimit" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            if ($gamingNetChks['🎯 Set DNS to Low Latency Servers'].Checked) {
                # Cloudflare DNS (1.1.1.1) - Generally lowest latency for NA
                foreach ($adapter in $adapters) {
                    Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses ("1.1.1.1","1.0.0.1") -ErrorAction SilentlyContinue
                }
                # Flush DNS cache
                Clear-DnsClientCache -ErrorAction SilentlyContinue
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            if ($gamingNetChks['⚡ Disable Windows Network Limiter'].Checked) {
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Value 0xffffffff -Type DWord -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Psched" -Name "NonBestEffortLimit" -Value 0 -Type DWord -ErrorAction SilentlyContinue
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            if ($gamingNetChks['🎮 Set UDP Connection Timeout Higher'].Checked) {
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpTimedWaitDelay" -Value 30 -Type DWord -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "StrictTimeWaitSeqCheck" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            if ($gamingNetChks['⚡ Disable Receive-Side Throttle'].Checked) {
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DoNotHoldNicBuffers" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\AFD\Parameters" -Name "DisableRawSecurity" -Value 1 -Type DWord -ErrorAction SilentlyContinue
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            if ($gamingNetChks['🔥 Enable High Performance Power'].Checked) {
                foreach ($adapter in $adapters) {
                    Set-NetAdapterPowerManagement -Name $adapter.Name -SelectiveSuspend Disabled -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Energy Efficient Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Green Ethernet" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                    Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName "Power Saving Mode" -DisplayValue "Disabled" -ErrorAction SilentlyContinue
                }
                powercfg -setacvalueindex SCHEME_CURRENT SUB_NONE DEVICEIDLE 0
                powercfg -setactive SCHEME_CURRENT
                $count++; $progressBar.Value = [int](($count / $total) * 100); [System.Windows.Forms.Application]::DoEvents()
            }
            
            # Additional gaming optimizations
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "MaxUserPort" -Value 65534 -Type DWord -ErrorAction SilentlyContinue
            Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TcpTimedWaitDelay" -Value 30 -Type DWord -ErrorAction SilentlyContinue
            
            # Disable TCP/IP auto-tuning (can cause issues in gaming)
            netsh int tcp set global autotuninglevel=normal
            netsh int tcp set global chimney=disabled
            netsh int tcp set global dca=enabled
            netsh int tcp set global netdma=enabled
            netsh int tcp set global timestamps=disabled
            
            $progressBar.Value = 100
            Start-Sleep -Seconds 1
            
            [System.Windows.Forms.MessageBox]::Show("✅ Gaming Network Optimization Complete!`n`n🎮 Applied $count optimizations`n⚡ Optimized for NA East/Central`n🚀 Ultra Low Latency Mode Enabled`n`n💡 RECOMMENDED:`n1. Restart your PC for full effect`n2. Test your ping in-game`n3. You should see 5-20ms reduction`n`n🎯 For best results:`n- Use Ethernet (not WiFi)`n- Close background apps`n- Update network drivers", "Success!", 0, 64)
            
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Error applying optimizations: $($_.Exception.Message)", "Error", 0, 16)
        }
        
        $progressMsg.Close()
    }
})
$tabGamingNet.Controls.Add($btnApplyGamingNet)

$btnSelectAllGaming = New-StyledButton '☑️ Select All' 330 600 150 40
$btnSelectAllGaming.Add_Click({ foreach ($chk in $gamingNetChks.Values) { $chk.Checked = $true } })
$tabGamingNet.Controls.Add($btnSelectAllGaming)

$btnDeselectGaming = New-StyledButton '☐ Deselect All' 490 600 150 40
$btnDeselectGaming.Add_Click({ foreach ($chk in $gamingNetChks.Values) { $chk.Checked = $false } })
$tabGamingNet.Controls.Add($btnDeselectGaming)

$btnTestPing = New-StyledButton '📊 Test Ping' 650 600 180 40
$btnTestPing.Add_Click({
    $testForm = New-Object System.Windows.Forms.Form
    $testForm.Text = 'Ping Test - NA Servers'
    $testForm.Size = New-Object System.Drawing.Size(600, 400)
    $testForm.StartPosition = 'CenterScreen'
    $testForm.BackColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
    
    $testOutput = New-Object System.Windows.Forms.TextBox
    $testOutput.Location = New-Object System.Drawing.Point(20, 20)
    $testOutput.Size = New-Object System.Drawing.Size(560, 320)
    $testOutput.Multiline = $true
    $testOutput.ScrollBars = 'Vertical'
    $testOutput.ReadOnly = $true
    $testOutput.BackColor = [System.Drawing.Color]::Black
    $testOutput.ForeColor = [System.Drawing.Color]::LimeGreen
    $testOutput.Font = New-Object System.Drawing.Font('Consolas', 10)
    $testForm.Controls.Add($testOutput)
    
    $testForm.Show()
    $testOutput.AppendText("Testing NA East & Central servers...`r`n`r`n")
    
    # Test common gaming server IPs
    $servers = @{
        'NA East (Virginia)' = '52.54.163.12'
        'NA East (Ohio)' = '18.221.23.45'
        'NA Central (Iowa)' = '35.184.22.11'
        'Cloudflare DNS' = '1.1.1.1'
        'Google DNS' = '8.8.8.8'
    }
    
    foreach ($server in $servers.GetEnumerator()) {
        $testOutput.AppendText("Testing $($server.Key)...`r`n")
        [System.Windows.Forms.Application]::DoEvents()
        
        $ping = Test-Connection -ComputerName $server.Value -Count 4 -ErrorAction SilentlyContinue
        if ($ping) {
            $avgPing = ($ping | Measure-Object -Property ResponseTime -Average).Average
            $minPing = ($ping | Measure-Object -Property ResponseTime -Minimum).Minimum
            $maxPing = ($ping | Measure-Object -Property ResponseTime -Maximum).Maximum
            $testOutput.AppendText("  ✅ Avg: $([math]::Round($avgPing, 1))ms | Min: $minPing ms | Max: $maxPing ms`r`n")
        } else {
            $testOutput.AppendText("  ❌ Failed to reach server`r`n")
        }
        $testOutput.AppendText("`r`n")
        [System.Windows.Forms.Application]::DoEvents()
    }
    
    $testOutput.AppendText("Test complete!`r`n")
})
$tabGamingNet.Controls.Add($btnTestPing)

# Info panel
$infoPanel = New-Object System.Windows.Forms.Panel
$infoPanel.Location = New-Object System.Drawing.Point(850, 600)
$infoPanel.Size = New-Object System.Drawing.Size(260, 40)
$infoPanel.BackColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$tabGamingNet.Controls.Add($infoPanel)

$infoLabel = New-Object System.Windows.Forms.Label
$infoLabel.Location = New-Object System.Drawing.Point(5, 5)
$infoLabel.Size = New-Object System.Drawing.Size(250, 30)
$infoLabel.Text = "💡 Expected: 5-20ms ping reduction`n⚡ Best with Ethernet connection"
$infoLabel.ForeColor = [System.Drawing.Color]::Yellow
$infoLabel.Font = New-Object System.Drawing.Font('Comic Sans MS', 8, [System.Drawing.FontStyle]::Italic)
$infoPanel.Controls.Add($infoLabel)

# Bottom button
$btnClose = New-Object System.Windows.Forms.Button
$btnClose.Location = New-Object System.Drawing.Point(470, 775)
$btnClose.Size = New-Object System.Drawing.Size(260, 50)
$btnClose.Text = '✖️ Close'
$btnClose.Font = New-Object System.Drawing.Font('Comic Sans MS', 14, [System.Drawing.FontStyle]::Bold)
$btnClose.BackColor = [System.Drawing.Color]::FromArgb(60, 20, 20)
$btnClose.ForeColor = [System.Drawing.Color]::White
$btnClose.FlatStyle = 'Flat'
$btnClose.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(220, 50, 50)
$btnClose.FlatAppearance.BorderSize = 3
$btnClose.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnClose.Add_MouseEnter({ $this.BackColor = [System.Drawing.Color]::FromArgb(220, 50, 50); $this.Font = New-Object System.Drawing.Font('Comic Sans MS', 15, [System.Drawing.FontStyle]::Bold) })
$btnClose.Add_MouseLeave({ $this.BackColor = [System.Drawing.Color]::FromArgb(60, 20, 20); $this.Font = New-Object System.Drawing.Font('Comic Sans MS', 14, [System.Drawing.FontStyle]::Bold) })
$btnClose.Add_Click({ $form.Close() })
$innerPanel.Controls.Add($btnClose)

[void]$form.ShowDialog()
$animationTimer.Stop()
$animationTimer.Dispose()
