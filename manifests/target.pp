class ansiblecore::target ($ssh_key_pub = '') {

	include ansiblecore::mainuser
	file { '/home/ansible/.ssh/authorized_keys':
		ensure => present,
		owner   => 'ansible',
		group  => 'ansible',
		mode   => '0600',
		content => $ssh_key_pub,
		}
	file { '/etc/sudoers.d/ansible':
		ensure  =>      present,
		content => 	'ansible        ALL=(ALL)       NOPASSWD: ALL',
		}
}
