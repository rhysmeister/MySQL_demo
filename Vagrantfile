Vagrant.configure("2") do |config|
    HOSTS=2
    (1..HOSTS).each do |host_id|
        config.vm.box = "puppetlabs/centos-6.6-64-nocm"
        config.vm.define "mysql#{host_id}" do |mysql|
            mysql.vm.hostname = "mysql#{host_id}"
            mysql.vm.network "private_network", ip: "192.168.13.#{100+host_id}"
            mysql.vm.boot_timeout = 300
            mysql.vm.provider "virtualbox" do |v|
                v.name = "mysql#{host_id}"
                v.memory = 4096
            end
    	  if host_id == HOSTS
          mysql.vm.provision :ansible do |ansible|
            	ansible.limit = "all" # Connect to all machines
              ansible.playbook = "mysql.yaml"
          end
        end
      end
    end
end
