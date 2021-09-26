# NOTES for MONTING SHARES

SMB/CIFS
sudo mount -t cifs -o username=serverUserName //192.168.1.114/filename /mount/point 
sudo mount -t cifs -o uid=<linuxuser>,username=<serveruser>,dom=<serverdomain> //server/folder /local/folder/
fstab file
//192.168.1.114/filename /mount/point cifs 0 0

NFS 
sudo mkdir /var/nfs/general -p
sudo chown nobody:nogroup /var/nfs/general
sudo nano /etc/exports
directory_to_share    client(share_option1,...,share_optionN)
$ sudo mount [NFS _IP]:/[NFS_export] [Local_mountpoint]

/var/nfs/general    client_ip(rw,sync,no_subtree_check)
/home               client_ip(rw,sync,no_root_squash,no_subtree_check)


sudo mount host_ip:/var/nfs/general /nfs/general
sudo mount host_ip:/home /nfs/home
. . .
host_ip:/var/nfs/general    /nfs/general   nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
host_ip:/home               /nfs/home      nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
192.168.72.136:/mnt/sharedfolder /mnt/client_sharedfolder nfs defaults 0 0
sudo umount -l {mountPoint}