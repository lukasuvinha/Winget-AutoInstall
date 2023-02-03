#!powershell

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$isAdmin = [System.Security.Principal.WindowsPrincipal]::new([System.Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
    if (!$isAdmin) {
        Write-Host "Este script precisa ser executado com privilégios de administrador."
        $arguments = "& '" + $myinvocation.mycommand.definition + "'"
        Start-Process powershell -Verb runAs -ArgumentList $arguments
    exit
}

$winget = Get-Command winget -ErrorAction SilentlyContinue
if ($winget) {
    $programs = @(
        "WhatsApp",
        "Windows Terminal",
        "Adobe Acrobat",
        "Samsung Printer Experience",
        "Anydesk",
        "Google Chrome",
        "Mozilla Firefox",
        "Opera",
        "WinRAR",
        "7-Zip",
        "Revo Uninstaller",
        "VC Redist 2008",
        "VC Redist 2010",
        "VC Redist 2012",
        "VC Redist 2013",
        "VC Redist 2015",
        "DotNet SDK 6",
        "DotNet SDK 5",
        "DotNet SDK 3.1"
    )
    
    function VerifyProgramAndSpace {
        param(
            [string]$programName,
            [int]$requiredSpaceMB
        )
    
        # Verifica se o programa está instalado
        $installed = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $programName }
        if (!$installed) {
            Write-Output "$programName não está instalado."
            return
        }
    
        # Verifica se há espaço suficiente disponível
        $freeSpace = (Get-WmiObject -Class Win32_LogicalDisk | Where-Object { $_.DeviceID -eq "C:" }).FreeSpace
        $freeSpaceMB = [int]($freeSpace / 1MB)
        if ($freeSpaceMB -lt $requiredSpaceMB) {
            Write-Output "Não há espaço suficiente disponível. Espaço livre: $freeSpaceMB MB. Espaço necessário: $requiredSpaceMB MB."
            return
        }
    
        Write-Output "$programName está instalado e há espaço suficiente disponível."
    }

    $userChoices = @{}
    foreach ($program in $programs) {
    $answer = Read-Host "Deseja instalar o $($program)? (S/n)"
    while ($answer.ToUpper() -ne "S" -and $answer.ToUpper() -ne "N" -and $answer -ne "") {
        $answer = Read-Host "Entrada inválida. Por favor, digite S ou N"
    }
    $userChoices[$program] = $answer.ToUpper() -eq "S"
    }

    $installSilently = Read-Host "Deseja instalar os programas silenciosamente? (S/n)"
    while ($installSilently.ToUpper() -ne "S" -and $installSilently.ToUpper() -ne "N" -and $installSilently -ne "") {
        $installSilently = Read-Host "Entrada inválida. Por favor, digite S ou N"
    }
    $installSilently = $installSilently.ToUpper() -eq "S"

    $installInteractive = Read-Host "Deseja instalar os programas interativamente? (S/n)"
    while ($installInteractive.ToUpper() -ne "S" -and $installInteractive.ToUpper() -ne "N" -and $installInteractive -ne "") {
        $installInteractive = Read-Host "Entrada inválida. Por favor, digite S ou N"
    }
    $installInteractive = $installInteractive.ToUpper() -eq "S"

    function Install-ProgramFromWingetOrMsStore {
      param(
        [string]$program
      )
      $result = winget install $program -quiet
      if ($result -eq $null) {
        msix install -n $program
      }
    }
    
    foreach ($program in $programs) {
      Install-ProgramFromWingetOrMsStore -program $program
    }
    
    # Instala os programas escolhidos pelo usuário
    foreach ($program in $programs) {
        if ($userChoices[$program]) {
            if ($installSilently) {
                winget install --silent "$program"
            }
            elseif ($installInteractive) {
                winget install "$program"
            }
            else {
                Write-Host "Modo de instalação não especificado para $program"
            }
        }
    }
}

else {
Write-Host "winget não está instalado ou não está configurado."
}    

#winget upgrade --all --include-unknown

pause