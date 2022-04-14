class ansiblecore::mainuser {
	
	exec { 'del':
		command => 'userdel -r ansible',
		path   => '/usr/sbin:/usr/bin',
		onlyif => 'test ! -f /home/ansible',
		}
        user { 'ansible':
                ensure  =>      present,
                uid     =>      '9004',
                managehome =>   true,
                home    =>      '/home/ansible',
                shell   =>      '/bin/bash',
                }
        file { '/home/ansible/.ssh':
                ensure  =>      'directory',
                owner   =>      ansible,
                group   =>      ansible,
                mode    =>      '0700',
                }

}
