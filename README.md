# Habilitar subsistema Windows para Linux

Esta etapa só é necessária se o suporte WSL nunca foi ativado antes em sua máquina Windows

Abra um PowerShell com privilégios administrativos e execute este script para habilitar a plataforma WSL e VM em sua máquina.

Pode ser necessário ajustar a política de segurança (consulte o primeiro comando abaixo), porque os scripts do Powershell não são assinados digitalmente (https: /go.microsoft.com/fwlink/? LinkID = 135170):

# Opcional: Definir segurança para ignorar
```sh
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```
# Habilite o WSL
```sh
.\enableWSL.ps1
```
Isso levará alguns minutos. Se não estava habilitado antes, você precisa reiniciar o Windows.

É necessário reiniciar se algum dos dois recursos acima não tiver sido instalado antes.

Defina a versão WSL padrão para 2. 

Abra um PowerShell com privilégios administrativos:
```sh
.\installWSL2.ps1
```
# Baixe e instale o Ubuntu LTS (20.04)

Abra um novo PowerShell com privilégios administrativos e instale o Ubuntu LTS, se ainda não o tiver feito. 

Você precisa fornecer quatro argumentos. 

Se você não especificá-los na linha de comando, o script perguntará:

```
<wslName>            : Forneça um nome para o WSL que será criado (por exemplo, devbox)
<wslInstallationPath>: O diretório onde o disco vhdx do novo WSL está armazenado
<nome de usuário>    : O nome do usuário que é usado quando a distribuição WSL é iniciada sem -u
<installAllSoftware> : Use true|false. 
                       Informe true se todos os pacotes de software (ver Software Disponível) devem ser instalados.
                       Ou informe false se for instalar somente um sistema totalmente atualizado com o usuário configurado fornecido. 
```
Por exemplo, o comando pode ser o seguinte:
```sh
installUbuntuLTS.ps1 devbox D:\WSL2\devbox <usuário> true
```
# Pacote de Software Disponível

Se não quiser instalar todos os pacotes durante a criação inicial do WSL, você pode instalá-los imediatamente. 

Eles estão disponíveis aqui ./scripts. Estes estão disponíveis atualmente
```
- Ubuntu Base Package (git, make, unzip) (scripts/install/installBasePackage.sh)
- OpenVSCode Server   (scripts/install/installDocker.sh). 
  Ele é iniciado automaticamente quando você inicia e efetua login no WSL na porta 3000.
- docker & compose V2 (scripts/install/installDocker.sh)
- OpenJDK 11          (scripts/install/installOpenjdk.sh)
- Apache Maven        (scripts/install/installMaven.sh)
- Gradle              (scripts/install/installGradle.sh)
- n (node manager), Nodejs, npm & Typescript (scripts/install/installNodejs.sh
```				   
