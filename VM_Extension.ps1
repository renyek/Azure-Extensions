#Initialize and format RAW disks
$RAWDisks = Get-Disk | Where-Object PartitionStyle -eq 'raw'
$DataDiskNr = 1

foreach ($RAWDisk in $RAWDisks){
    $DiskName = 'DataDisk-' + $DataDiskNr
    $RAWDisk | Initialize-Disk -PartitionStyle GPT -PassThru | `
    New-Partition -AssignDriveLetter -UseMaximumSize | `
    Format-Volume -FileSystem NTFS -NewFileSystemLabel $DiskName -Confirm:$false
    $DataDiskNr = $DataDiskNr + 1 
}
