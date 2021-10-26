echo "Generating Root Certificate ..."

echo "Please note that the next steps are optional and could be skipped!"
printf "\n"

printf "Please enter the name of your country ... "
read country_name
printf "\n"

printf "Please enter the name of state or province ... "
read province_name
printf "\n"

printf "Please enter the name of locality ... "
read locality_name
printf "\n"


printf "Please enter the name of organisation ... "
read org_name
printf "\n"

printf "Please enter the name of organisational Unit ... "
read org_unit_name
printf "\n"

printf "Please enter the root common name ... "
read root_name
printf "\n"

printf "Please enter the organisation email address ... "
read org_email
printf "\n"

echo "
[req]
default_bits       = 2048
distinguished_name = req_distinguished_name
default_md         = sha256
prompt			   = no

[req_distinguished_name]
countryName                = ${countryName:-'CN'}
stateOrProvinceName        = ${province_name:-'Some State'}
localityName               = ${locality_name:-'Some Locality'}
organizationName           = ${org_name:-'Some Organization'}
organizationalUnitName     = ${org_unit_name:-'Some Unit'}
commonName                 = ${root_name:-'Root Common Name'}
emailAddress			   = ${org_email:-'root@email.em'}
" >> root.cnf


openssl genrsa -out root.key 2048
openssl req -x509 -new -key root.key -days 10000 -out root.crt -config root.cnf
echo "Root certificate generated..."

echo "
[req]
default_bits       = 2048
distinguished_name = req_distinguished_name
x509_extensions    = v3_req
default_md         = sha256
prompt			   = no

[req_distinguished_name]
countryName                = ${countryName:-'CN'}
stateOrProvinceName        = ${province_name:-'Some State'}
localityName               = ${locality_name:-'Some Locality'}
organizationName           = ${org_name:-'Some Organization'}
organizationalUnitName     = ${org_unit_name:-'Some Unit'}
commonName                 = 127.0.0.1
emailAddress			   = ${org_email:-'some@email.em'}

[v3_req]
subjectAltName = @alt_names

[alt_names]
IP.1 = 127.0.0.1
DNS.1 = localhost
" >> ca.cnf

openssl genrsa -out ca.key 2048
openssl req -out ca.csr -newkey rsa:2048 -nodes -keyout ca.key -config ca.cnf -extensions v3_req
openssl x509 -req -in ca.csr -CA root.crt -CAkey root.key -CAcreateserial -out ca.crt -days 9999 -extfile ca.cnf -extensions v3_req
openssl x509 -in ca.crt -noout -text

rm -rf ../../ssl-certificates
mkdir -p ../../ssl-certificates/certs
mkdir -p ../../ssl-certificates/keys
cp ca.crt ../../ssl-certificates/certs/
cp ca.key ../../ssl-certificates/keys/

echo "Moving generated ssl certificates to separate directory in current folder ..."
mkdir generated-ssl-certificates
mv *.csr *.crt *.cnf *.key *.srl ./generated-ssl-certificates
