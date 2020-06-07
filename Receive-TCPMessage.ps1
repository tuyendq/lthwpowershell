#
# Source: https://riptutorial.com/powershell/example/18117/tcp-listener
#
Function Receive-TCPMessage {
    Param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [int] $Port
    )
    Process {
        Try {
            # Setup end point and start listening
            $EndPoint = New-Object System.Net.IPEndPoint([ipaddress]::any, $Port)
            $Listener = New-Object System.Net.Sockets.TcpListener $EndPoint
            Write-Host "Start listening...."
            $Listener.Start()

            # Wait for an incoming connection
            $data = $Listener.AcceptTcpClient()

            # Strem setup
            $stream = $data.GetStream()
            $bytes = New-Object System.Byte[] 1024

            # Read data from stream and write it to host
            while (($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0) {
                $EncodedText = New-Object System.Text.ASCIIEncoding
                $data = $EncodedText.GetString($bytes, 0, $i)
                Write-Output $data
            }

            # Close TCP connection and stop listening
            $stream.Close()
            $Listener.Stop()
        }
        Catch {
            "Received Message failed with: `n" + $Error[0]
        }
    }
}

# To test this function in Powershell
# Use dot-source to load this powershell function
# ===============================
# PS > . .\Receive-TCPMessage.ps1
# PS > $msg = Receive-TCPMessage -Port 13000
# ===============================