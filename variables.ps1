<#
. Description
Varialbe begins with a dollar sign ($)
#>
$tagName = "nginx1.18"
$containerName = "web1-nginx1.18"
$port = 8080

docker build --tag $tagName .
if ($?) {
    docker run --name $containerName --detach -publish ${port}:80
}