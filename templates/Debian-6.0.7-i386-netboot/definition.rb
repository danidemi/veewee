#Thanks to Fletcher Nichol - https://github.com/fnichol

Veewee::Definition.declare({
  :cpu_count => '1',
  :memory_size=> '256',
  :disk_size => '10140', :disk_format => 'VDI', :hostiocache => 'on',
  :os_type_id => 'Debian',
  :virtualbox => { :vm_options => [
                                   'hwvirtex' => 'off',
                                   'nestedpaging' => 'off',
                                   'natdnshostresolver1' => 'on'
                                  ]
                          },
  :iso_file => "debian-6.0.7-i386-netinst.iso",
  :iso_src => "",
  :iso_download_instructions => "- You need to download this manually as the ISO is no more directly downloadable\n"+
  "Visit http://cdimage.debian.org/cdimage/archive/6.0.7/i386/ and download it via torrent or jigdo",
  :iso_md5 => "6ebdb31269a3eaaf72fca0ed2f6ba29b",
  :iso_download_timeout => "1000",
  :boot_wait => "10", :boot_cmd_sequence => [
     '<Esc>',
     'install ',
     'preseed/url=http://%IP%:%PORT%/preseed.cfg ',
     'debian-installer=en_US ',
     'auto ',
     'locale=en_US ',
     'kbd-chooser/method=us ',
     'netcfg/get_hostname=%NAME% ',
     'netcfg/get_domain=vagrantup.com ',
     'fb=false ',
     'debconf/frontend=noninteractive ',
     'console-setup/ask_detect=false ',
     'console-keymaps-at/keymap=us ',
     '<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => "10000",
  :kickstart_file => "preseed.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "halt -p",
  :postinstall_files => [
    "base.sh",
    "vagrant.sh",
    "virtualbox.sh",
    #"vmfusion.sh",
    "ruby.sh",
    "puppet.sh",
    "chef.sh",
    "cleanup-virtualbox.sh",
    "cleanup.sh",
    "zerodisk.sh"
  ],
  :postinstall_timeout => "10000"
})
