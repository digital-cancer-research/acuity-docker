### Description
<hr>
Folder contains scripts for starting ACUITY application and enabling temporary SSL-protection (with self-signed SSL certificates) for Windows and Linux machines.

We assume launching ACUITY in two modes:
* cloud-based app on remote virtual machine (`Linux`) with Azure storage accounts and Azure SSO authentication set up available for multiple users 
* local start on your laptop or work station (on `Windows`) available only for you

<hr>

### Script types:

* `.sh` scripts are used for Unix environments (inc. Linux)
* `.bat` - scripts are used for machines running Windows

<hr>

## How to start ACUITY?

###### Step 1 - Database
You will need to <b> init your local database </b> both for cloud and for local modes. If you would like to connect to already deployed database, please refer to instructions on
[Wiki](https://github.com/digital-ECMT/acuity-docker/wiki/Applications-Spring-Configs#common-config) and edit datasource configuration. 

Otherwise, run `acuity-init-db-<your OS>` script from `init-local-DB` directory.

###### Step 2 - SSL
Install [SSL-certificates](https://github.com/digital-ECMT/acuity-docker/wiki/SSL-Certificates). We urge you to install licensed certificates for productions tasks. But for local starts and development you could temporarily
use self-signed ones. To generate and install them we have `install-SSL-for-local-start` directory with two scripts (for Windows or Unix):
* `install-SSL-certs-for-local-windows-start.bat` - generates certificates in `generated-ssl-certificates` folder , moves necessary to `acuity-docker/ssl-certificates` directory and imports `root.crt`
* `issue-SSL-certs-for-local-start.sh` - does everything above but not imports to trusted store. This script is not used to generate self-signed certs for remote server, but as a part of Windows script. For generating remote self-signed certs 
  [follow this](https://github.com/digital-ECMT/acuity-deployment-scripts/tree/master/remote-app-configuration/ssl)
   
<b>Note</b>: `.bat` script for Windows will use PowerShell to import generated `root.crt` to TrustedCertificate store to make your web browser happy about your certificates. In case you have no PowerShell 
 and would like to import these certs to Trusted Root Certificate Store follow [these instructions](https://github.com/digital-ECMT/acuity-docker/wiki/SSL-Certificates#importing-self-signed-certificate-to-trusted-store)  
###### Step 3 - START
   
#### Linux startup

We assume that you successfully deployed ACUITY (by using [deployment-scripts](https://github.com/digital-ECMT/acuity-deployment-scripts)) or configured application manually according 
to instructions on [ACUITY Wiki](https://github.com/digital-ECMT/acuity-docker/wiki)

* `acuity-start-unix.sh` `acuity-stop-unix.sh` - script shortcuts for starting and stopping ACUITY from your remote Linux VM \
  deployed in Azure Cloud (or else). You could edit their content to target type of `docker-compose.yml` file you need:
  * `docker-compose.yml`  - (default and recommended) file to download docker images from remote storage. Quick option to install ACUITY.
  * `docker-compose_building-mode.yml` file is used to start application from `.jar` `.war` files assembled \
    during `build-from-sources.sh` script execution
#### Windows startup
* `acuity-start-windows.bat` and `acuity-stop-windows.bat` are scripts for execution on Windows OS. Your application would start 
from `docker-compose` file and download ACUITY images from remote storage. Application will start in local-mode with no-security. 
These scripts should be used for local ACUITY's start on Windows.
