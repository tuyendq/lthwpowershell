$fqdn = "1.practicehabits.net"
$ipaddr = "173.82.212.40"
$port = 80
$conn = New-Object System.Net.Sockets.TcpClient($ipaddr, $port)
if ($conn.Connected) {Write-Host "Success"} else {Write-Host "Failed"}