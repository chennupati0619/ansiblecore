class ansiblecore::master ($ansiblecore = 'ansible'){
	include ansiblecore::mainuser
	package { 'ansible':
		name	=>	$ansiblecore,
		ensure	=>	installed,
		}
	file { '/home/ansible/.ssh/id_rsa':
		ensure  =>      present,
		owner   =>      ansible,
                group   =>      ansible,
		mode	=>	'0600',
		source	=>	"puppet:///modules/ansiblecore/id_rsa",
		}
	file { '/home/ansible/.ssh/id_rsa.pub':
		ensure  =>      present,
		owner   =>      ansible,
                group   =>      ansible,
		mode	=>	'0644',
		source	=>	"puppet:///modules/ansiblecore/id_rsa.pub",
		}
	}
