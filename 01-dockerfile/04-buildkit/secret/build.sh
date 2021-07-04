
echo 'WARMACHINEROX' > mysecret.txt

docker build --no-cache --progress=plain --secret id=mysecret,src=mysecret.txt .