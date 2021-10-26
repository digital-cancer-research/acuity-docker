bash -c ./issue-SSL-certs-for-local-start.sh
PowerShell.exe -command "Import-Certificate -FilePath ./generated-ssl-certificates/root.crt -CertStoreLocation Cert:\CurrentUser\Root"
