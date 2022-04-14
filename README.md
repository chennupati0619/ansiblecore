# ansiblecore

Welcome to ansiblecore. A module written to play along with Ansible, for more details on free content written by author on Ansible, please refer: (#https://learningtechnix.wordpress.com/category/automation/ansible/)

## Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with ansiblecore](#setup)
3. [Usage](#usage)

## Description

For those who are looking for a clean ansible installation in their environment. For this a preferable setup is RHEL / CentOS 7 based machines.

Here we do not need to care about keys as the module will itself populate auto generated keys on both Ansible master and target nodes.

*** Note: If on any node it found home of ansible anything other than /home/ansible, it will delete the user and recreate the user. ***

## Setup

In this example code you will find numerous machines, where following are important:

- ldapmas.technix.com --> ANSIBLE MASTER
- master.lab.example.com --> ANSIBLE CLIENT

## Usage

```puppet
class { 'ansiblecore::master': }
class { 'ansiblecore::target': }
```
On Ansible controller node hiera file add below hiera code

```yaml
ansiblecore::master::ansiblecore: 'ansible'
```

Similar puppet code

```puppet
package { 'ansible':
                name    =>      'ansible',
                ensure  =>      installed,
                }
```

On ansible taret node add below hiera value

```yaml
classes:
- ansiblecore::target
```
