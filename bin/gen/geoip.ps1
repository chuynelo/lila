New-Item -ItemType Directory -Force -Path data | Out-Null

(New-Object Net.WebClient).DownloadFile('http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz', 'data\\GeoLite2-City.mmdb.gz')

$fileStreamRead = [IO.File]::OpenRead('data\\GeoLite2-City.mmdb.gz')
$decompressedFileStream = [IO.File]::Create('data\\GeoLite2-City.mmdb')
$compressionMode = [IO.Compression.CompressionMode] "Decompress"
$gzipStream = New-Object IO.Compression.GZipStream -ArgumentList $fileStreamRead, $compressionMode
$gzipStream.CopyTo($decompressedFileStream)
$gzipStream.Close()
$decompressedFileStream.Close()
$fileStreamRead.Close()
