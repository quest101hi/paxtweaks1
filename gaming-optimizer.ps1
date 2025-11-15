#Requires -RunAsAdministrator

<#
.SYNOPSIS
    Windows Gaming Performance Optimizer
.DESCRIPTION
    Optimizes Windows settings for maximum gaming performance
.NOTES
    Run this script as Administrator
    A system restart is recommended after running
#>

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Windows Gaming Performance Optimizer  " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Function to create restore point
function Create-RestorePoint {
    Write-Host "[*] Creating system restore point..." -ForegroundColor Yellow
    try {
        Enable-ComputerRestore -Drive "C:\"
        Checkpoint-Computer -Description "Before Gaming Optimization" -RestorePointType "MODIFY_SETTINGS"
        Write-Host "[✓] Restore point created successfully" -ForegroundColor Green
    } catch {
        Write-Host "[!] Could not create restore point: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to optimize keyboard settings
function Optimize-Keyboard {
    Write-Host "`n[*] Optimizing keyboard settings..." -ForegroundColor Yellow
    try {
        Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Value 0
        Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardSpeed" -Value 31
        Write-Host "[✓] Keyboard delay minimized and repeat rate maximized" -ForegroundColor Green
    } catch {
        Write-Host "[!] Error optimizing keyboard: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to optimize mouse settings
function Optimize-Mouse {
    Write-Host "`n[*] Optimizing mouse settings..." -ForegroundColor Yellow
    try {
        # Disable pointer precision (mouse acceleration)
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value 0
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value 0
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value 0
        
        # Set pointer speed to middle (10 out of 20)
        Set-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSensitivity" -Value 10
        
        Write-Host "[✓] Mouse acceleration disabled and sensitivity optimized" -ForegroundColor Green
    } catch {
        Write-Host "[!] Error optimizing mouse: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to set high performance power plan
function Set-HighPerformancePower {
    Write-Host "`n[*] Setting high performance power plan..." -ForegroundColor Yellow
    try {
        $plan = powercfg -list | Select-String "High performance"
        if ($plan) {
            $guid = $plan.ToString().Split()[3]
            powercfg -setactive $guid
            
            # Disable USB selective suspend
            powercfg -setacvalueindex $guid 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
            powercfg -setdcvalueindex $guid 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
            
            Write-Host "[✓] High performance power plan activated" -ForegroundColor Green
        } else {
            Write-Host "[!] High performance plan not found" -ForegroundColor Red
        }
    } catch {
        Write-Host "[!] Error setting power plan: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to disable unnecessary services
function Disable-UnnecessaryServices {
    Write-Host "`n[*] Disabling unnecessary services for gaming..." -ForegroundColor Yellow
    
    $servicesToDisable = @(
        "DiagTrack",                # Connected User Experiences and Telemetry
        "dmwappushservice",         # WAP Push Message Routing Service
        "SysMain",                  # Superfetch (can reduce performance on SSDs)
        "WSearch",                  # Windows Search
        "TabletInputService",       # Touch Keyboard and Handwriting Panel
        "Fax",                      # Fax Service
        "XblAuthManager",           # Xbox Live Auth Manager (disable if not using Xbox features)
        "XblGameSave",              # Xbox Live Game Save
        "XboxNetApiSvc",            # Xbox Live Networking Service
        "XboxGipSvc"                # Xbox Accessory Management Service
    )
    
    foreach ($service in $servicesToDisable) {
        try {
            $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
            if ($svc) {
                Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
                Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
                Write-Host "  [✓] Disabled: $service" -ForegroundColor Green
            }
        } catch {
            Write-Host "  [!] Could not disable: $service" -ForegroundColor Yellow
        }
    }
}

# Function to optimize Windows visual effects
function Optimize-VisualEffects {
    Write-Host "`n[*] Optimizing visual effects for performance..." -ForegroundColor Yellow
    try {
        # Set to "Adjust for best performance" with some tweaks
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Value 2
        
        # Disable animations
        Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value 0
        
        # Disable transparency
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0
        
        Write-Host "[✓] Visual effects optimized for performance" -ForegroundColor Green
    } catch {
        Write-Host "[!] Error optimizing visual effects: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to disable Game DVR and Game Bar
function Disable-GameDVR {
    Write-Host "`n[*] Disabling Game DVR and Game Bar..." -ForegroundColor Yellow
    try {
        # Disable Game Bar
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Force
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR" -Name "GameDVR_Enabled" -Value 0 -Force
        Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -Force
        
        # Disable Game Mode notifications
        if (!(Test-Path "HKCU:\Software\Microsoft\GameBar")) {
            New-Item -Path "HKCU:\Software\Microsoft\GameBar" -Force | Out-Null
        }
        Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -Value 0 -Force
        
        Write-Host "[✓] Game DVR and Game Bar disabled" -ForegroundColor Green
    } catch {
        Write-Host "[!] Error disabling Game DVR: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to optimize network settings
function Optimize-Network {
    Write-Host "`n[*] Optimizing network settings..." -ForegroundColor Yellow
    try {
        # Disable Nagle's Algorithm for reduced latency
        $adapters = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
        foreach ($adapter in $adapters) {
            $interfaceGuid = $adapter.InterfaceGuid
            $regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\$interfaceGuid"
            
            if (Test-Path $regPath) {
                Set-ItemProperty -Path $regPath -Name "TcpAckFrequency" -Value 1 -Type DWord -Force
                Set-ItemProperty -Path $regPath -Name "TCPNoDelay" -Value 1 -Type DWord -Force
            }
        }
        
        Write-Host "[✓] Network settings optimized for gaming" -ForegroundColor Green
    } catch {
        Write-Host "[!] Error optimizing network: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to disable Windows Update during gaming hours
function Configure-WindowsUpdate {
    Write-Host "`n[*] Configuring Windows Update..." -ForegroundColor Yellow
    try {
        # Set active hours (8 AM to 2 AM - 18 hour window)
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursStart" -Value 8
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "ActiveHoursEnd" -Value 2
        
        Write-Host "[✓] Windows Update configured with active hours" -ForegroundColor Green
    } catch {
        Write-Host "[!] Error configuring Windows Update: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to disable fullscreen optimizations globally
function Disable-FullscreenOptimizations {
    Write-Host "`n[*] Disabling fullscreen optimizations..." -ForegroundColor Yellow
    try {
        Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_DXGIHonorFSEWindowsCompatible" -Value 1 -Force
        Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_FSEBehaviorMode" -Value 2 -Force
        Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_HonorUserFSEBehaviorMode" -Value 1 -Force
        
        Write-Host "[✓] Fullscreen optimizations disabled" -ForegroundColor Green
    } catch {
        Write-Host "[!] Error disabling fullscreen optimizations: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Function to optimize GPU settings
function Optimize-GPU {
    Write-Host "`n[*] Optimizing GPU settings..." -ForegroundColor Yellow
    try {
        # Enable Hardware Accelerated GPU Scheduling if available
        $path = "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers"
        if (Test-Path $path) {
            Set-ItemProperty -Path $path -Name "HwSchMode" -Value 2 -Force
            Write-Host "[✓] Hardware-accelerated GPU scheduling enabled" -ForegroundColor Green
        }
    } catch {
        Write-Host "[!] Error optimizing GPU: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Main execution
Write-Host "This script will optimize your system for gaming performance." -ForegroundColor White
Write-Host "A system restart is recommended after completion.`n" -ForegroundColor White

$confirm = Read-Host "Do you want to proceed? (Y/N)"
if ($confirm -ne "Y" -and $confirm -ne "y") {
    Write-Host "`nOptimization cancelled." -ForegroundColor Yellow
    exit
}

Write-Host "`nStarting optimization...`n" -ForegroundColor Cyan

Create-RestorePoint
Optimize-Keyboard
Optimize-Mouse
Set-HighPerformancePower
Disable-UnnecessaryServices
Optimize-VisualEffects
Disable-GameDVR
Optimize-Network
Configure-WindowsUpdate
Disable-FullscreenOptimizations
Optimize-GPU

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "     Optimization Complete!              " -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "`n[!] Please restart your computer for all changes to take effect." -ForegroundColor Yellow
Write-Host "`nPress any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")