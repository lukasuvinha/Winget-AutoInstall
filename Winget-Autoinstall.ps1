#!powershell


<### BLOCO QUE VERIFICA PRIVILEGIOS DE ADMINISTRADOR ###>
<# 
    $id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object System.Security.Principal.WindowsPrincipal($id)
    if (!$principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Este script precisa ser executado com privilégios de administrador."
    $arguments = "& '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    exit
    }
#>

<### LIBERAR POWERSHELL PARA EXECUÇÃO DE SCRIPTS ###>
Set-ExecutionPolicy Unrestricted -Scope Process

<### BLOCO PRINCIPAL DE EXECUÇÃO DO WINGET ###>
winget install revouninistaller.revouninstaller --accept-package-agreements --accept-source-agreements
winget install AnyDesk --force --accept-package-agreements --accept-source-agreements
winget install Microsoft.Office --accept-package-agreements --accept-source-agreements
winget install Google.Chrome --accept-package-agreements --accept-source-agreements
winget install Mozilla.Firefox --accept-package-agreements --accept-source-agreements
winget install Opera.Opera --accept-package-agreements --accept-source-agreements
winget install winrar --accept-package-agreements --accept-source-agreements
winget install 7zip.7zip --accept-package-agreements --accept-source-agreements
winget install 9NKSQGP7F2NH --accept-package-agreements --accept-source-agreements
winget install 9N0DX20HK701 --accept-package-agreements --accept-source-agreements
winget install XPDP273C0XHQH2 --accept-package-agreements --accept-source-agreements
winget install 9WZDNCRFHWGG --accept-package-agreements --accept-source-agreements
winget install Oracle.JavaRuntimeEnvironment --accept-package-agreements --accept-source-agreements
winget install Microsoft.VCRedist.2008.x64 --accept-package-agreements --accept-source-agreements
winget install Microsoft.VCRedist.2010.x64 --accept-package-agreements --accept-source-agreements
winget install Microsoft.VCRedist.2013.x64 --accept-package-agreements --accept-source-agreements
winget install Microsoft.VCRedist.2015+.x64 --accept-package-agreements --accept-source-agreements
winget install Microsoft.VCRedist.2012.x64 --accept-package-agreements --accept-source-agreements
winget install Microsoft.DotNet.SDK.6 --accept-package-agreements --accept-source-agreements
winget install Microsoft.DotNet.SDK.5 --accept-package-agreements --accept-source-agreements
winget install Microsoft.DotNet.SDK.3_1 --accept-package-agreements --accept-source-agreements
#winget install 9WZDNCRD29V9 --accept-package-agreements --accept-source-agreements
#winget install KeePassXCTeam.KeePassXC --accept-package-agreements --accept-source-agreements
#winget install dominikreichl.keepass --accept-package-agreements --accept-source-agreements

<#
    PACOTES DE ORIGEM DA MSSTORE
    9NKSQGP7F2NH = WHATSAPP
    9N0DX20HK701 = WINDOWS TERMINAL
    XPDP273C0XHQH2 = ADOBE ACROBAT
    9WZDNCRFHWGG =  SAMSUNG PRINTER EXPERIENCE
    9WZDNCRD29V9 = Office 365 ( ! DESATIVADO ! - script já está baixando o mesmo do WINGET)
#>

pause
