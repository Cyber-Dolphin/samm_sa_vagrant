net="192.168.56."

NODE="node-"

DISTR="ubuntu/bionic64"

servers=[
  {
    :hostname => NODE + "samm",
    :ip => net + "50",
    :distrib => DISTR,
    :share_disable => true,
    :vbguest => false,
    :script => "./scripts/install.sh",
    :mem => "2048",
    :cpu => 2
  }
]

Vagrant.configure(2) do |config|
    
	servers.each do |machine|

		config.vm.define machine[:hostname] do |node|
            
            node.vm.synced_folder '.', '/vagrant', disabled: machine[:share_disable]
            
            node.vbguest.auto_update = machine[:vbguest]
			        
            node.vm.box = machine[:distrib]

			node.vm.hostname = machine[:hostname]
            
            node.vm.boot_timeout = 1000
            
            node.vm.provision "shell", path: machine[:script], privileged: false
  
            node.vm.network "private_network", ip: machine[:ip], name: "VirtualBox Host-Only Ethernet Adapter"

			node.vm.provider "virtualbox" do |vb|
				  
                                  vb.memory = machine[:mem]
  
                                  vb.cpus = machine[:cpu]
			end      
		end
	end
end