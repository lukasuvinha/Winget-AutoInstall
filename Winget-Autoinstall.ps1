#!powershell

<### LIBERAR POWERSHELL PARA EXECUCAO DE SCRIPTS ###>
Set-ExecutionPolicy Unrestricted -Scope Process

<### BLOCO PRINCIPAL DE EXECUCAO DO WINGET ###>
    winget install AnyDesk --force --accept-source-agreements --accept-package-agreements 
    winget install revouninstaller.revouninstaller  --accept-source-agreements --accept-package-agreements
    winget install geeksoftwareGmbH.PDF24Creator --accept-source-agreements --accept-package-agreements
    winget install ente-io.auth-desktop --accept-source-agreements --accept-package-agreements
    winget install VideoLAN.VLC --accept-source-agreements --accept-package-agreements
    winget install 9WZDNCRFJBH4 --accept-source-agreements --accept-package-agreements
    winget install 9PM860492SZD --force  --accept-source-agreements --accept-package-agreements
    winget install 9WZDNCRFHVN5 --accept-source-agreements --accept-package-agreements
    winget install Microsoft.Teams  --accept-source-agreements --accept-package-agreements
    #winget install Microsoft.Office  --accept-source-agreements --accept-package-agreements
    winget install Google.Chrome  --accept-source-agreements --accept-package-agreements
    winget install Mozilla.Firefox  --accept-source-agreements --accept-package-agreements
    #winget install Opera.Opera  --accept-source-agreements --accept-package-agreements
    #winget install winrar  --accept-source-agreements --accept-package-agreements
    winget install 7zip.7zip  --accept-source-agreements --accept-package-agreements
    winget install 9NKSQGP7F2NH  --accept-source-agreements --accept-package-agreements
    #winget install 9N0DX20HK701  --accept-source-agreements --accept-package-agreements
    winget install XPDP273C0XHQH2  --accept-source-agreements --accept-package-agreements
    winget install 9WZDNCRFHWGG  --accept-source-agreements --accept-package-agreements
    winget install Oracle.JavaRuntimeEnvironment  --accept-source-agreements --accept-package-agreements
    winget install Microsoft.VCRedist.2008.x64  --accept-source-agreements --accept-package-agreements
    winget install Microsoft.VCRedist.2010.x64  --accept-source-agreements --accept-package-agreements
    winget install Microsoft.VCRedist.2013.x64  --accept-source-agreements --accept-package-agreements
    winget install Microsoft.VCRedist.2015+.x64  --accept-source-agreements --accept-package-agreements
    winget install Microsoft.VCRedist.2012.x64  --accept-source-agreements --accept-package-agreements
    winget install Microsoft.DotNet.SDK.6  --accept-source-agreements --accept-package-agreements
    winget install Microsoft.DotNet.SDK.5  --accept-source-agreements --accept-package-agreements
    winget install Microsoft.DotNet.SDK.3_1  --accept-source-agreements --accept-package-agreements
    #winget install 9WZDNCRD29V9  --accept-source-agreements --accept-package-agreements
    #winget install XP89DCGQ3K6VLD  --accept-source-agreements --accept-package-agreements
    winget install KeePassXCTeam.KeePassXC  --accept-source-agreements --accept-package-agreements

<#  
    ##PACOTES DE ORIGEM DA MSSTORE

    9PM860492SZD   =  PC Manager (CCleaner da Microsoft, sim ele existe!)	
    9NKSQGP7F2NH   =  WHATSAPP
    9N0DX20HK701   =  WINDOWS TERMINAL
    XPDP273C0XHQH2 =  ADOBE ACROBAT
    9WZDNCRFHWGG   =  SAMSUNG PRINTER EXPERIENCE
    9WZDNCRD29V9   =  Office 365 ( ! DESATIVADO ! - script já está baixando o mesmo do WINGET)
    XP89DCGQ3K6VLD =  PowerToys (Desativado por ser um software utilitario avançado demais para o nivel de usuário médio do escritório :D)

#>

<### BLOCO DE INSTALACAO VIA " Invoke-WebRequest " ###>

$destination = "$env:USERPROFILE\Downloads\"

ping -n 3 https://drivers.certisign.com.br

# Baixar os arquivos
#Invoke-WebRequest -Uri "https://github.com/thedoggybrad/Paint3DArchive/releases/download/b2/2024.2410.13017.0.AppxBundle" -OutFile "$destination\Paint3D.AppxBundle"
#Invoke-WebRequest -Uri "https://download.microsoft.com/download/4/5/9/4590E1BD-CDA7-41F1-86A1-CB8005DDDF96/PTB/SSCERuntime_x64-PTB.exe" -OutFile "$destination\SSCERuntime_x64-PTB.exe"

ping -n 3 https://github.com/SasaDermanovic/2024-Winget-Setup-Guide-Windows-10-LTSC
#Invoke-WebRequest -Uri "https://github.com/SasaDermanovic/2024-Winget-Setup-Guide-Windows-10-LTSC/archive/refs/heads/main.zip" -OutFile "$destination\"
Invoke-WebRequest -Uri "https://github.com/SasaDermanovic/2024-Winget-Setup-Guide-Windows-10-LTSC/archive/refs/heads/main.zip" `
    -OutFile "$destination\main.zip" `
    -Headers @{"User-Agent"="Mozilla/5.0"}

ping -n 3 https://github.com/R-YaTian/LTSC-Add-MicrosoftStore-2021_2024
#Invoke-WebRequest -Uri "https://github.com/R-YaTian/LTSC-Add-MicrosoftStore-2021_2024/archive/refs/heads/main.zip" -OutFile "$destination\"
Invoke-WebRequest -Uri "https://github.com/R-YaTian/LTSC-Add-MicrosoftStore-2021_2024/archive/refs/heads/main.zip" `
    -OutFile "$destination\main.zip" `
    -Headers @{"User-Agent"="Mozilla/5.0"}

    
#Invoke-WebRequest -Uri "" -OutFile "$destination\"

pause

#.:: Incluir: DCTFWEB, RECEITANET, GIA, SPEDFISCAL
