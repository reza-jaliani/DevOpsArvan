Disk Management:
--------------------------

***Show the info of disk space:***

        df -h

***Show block devices:***

        lsblk

***Show volume groups of LVM:***

        sudo vgs

***Show physical volume of LVM:***

        sudo pvs

***Create physical volume and volume group:***

        sudo pvcreate
        sudo vgcreate

***Create logical volume:***

        lvcreate -L 10G -n my_logical_volume my_volume_group

