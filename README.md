## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/Project_1_ELK_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat, Metricbeat and Packetbeat.

filebeat-playbook.yml
metricbeat-playbook.yml
packetbeat-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
- Beats in Use
- Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

- Load Balancers distribute the web traffic amongst the 3 web machines and prevent denial of service attacks. The implementation of a Jump Box protects the servers from the open web.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files with Filebeat and system performance with Metricbeat.

The configuration details of each machine may be found below.


| Name                 | Function  | ID Address         | Operating System  |
|----------------------|-----------|--------------------|-------------------|
| Jump-Box-Provisioner | Gateway   | 10.1.0.5           | Ubuntu Linux 18.04|
| Web-1                | DVWA      | 10.1.0.6           | Ubuntu Linux 18.04|
| Web-2                | DVWA      | 10.1.0.7           | Ubuntu Linux 18.04|
| Web-3                | DVWA      | 10.1.0.10          | Ubuntu Linux 18.04|
| ELK-Stack-JB         | Monitoring| 10.3.0.4           | UbuntuServer 18.04|


## ELK Server Configuration
The ELK VM exposes an Elastic Stack instance. **Docker** is used to download and manage an ELK container.

Rather than configure ELK manually, we opted to develop a reusable Ansible Playbook to accomplish the task. This playbook is duplicated below.


To use this playbook, one must log into the Jump Box, then issue: `ansible-playbook install_elk.yml elkservers`. This runs the `install_elk.yml` playbook on the `ELK-Stack-JB` host.

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

- 73.13.134.150

Machines within the network can only be accessed by Jump-Box.

The ELK machine (10.3.0.4) is accessible through the JumpBox which has an IP of 10.1.0.5. 

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses |
|----------------------|---------------------|----------------------|
| Jump-Box-Provisioner | No                  | Personal PC Public IP|
| Web-1                | No                  | 10.1.0.5             |
| Web-2                | No                  | 10.1.0.5             |
| Web-3                | No                  | 10.1.0.5             |
| ELK-Stack-JB         | No                  | Personal IP, 10.1.0.5|


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...

- Ansible can be deployed/redeployed, scaled and automated easily and efficiently because it is a lightweight container.

The playbook implements the following tasks:
- Install docker.io
- Increase memory on the ELK VM
- Install python-pip module
- Install Docker python module
- Download and Install web container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.1.0.6
- Web-2 10.1.0.7
- Web-3 10.1.0.10

We have installed the following Beats on these machines:
- filebeat-7.4.0-amd64.deb
- metricbeat-7.4.0-amd64.deb
- packetbeat-7.4.0-amd64.deb

These Beats allow us to collect the following information from each machine:
- Filebeat is a lightweight shipper used to transmit centralized log data to Kibana. It monitors and collects log events and forwards them to Elasticsearch/Logstash where it is indexed and cataloged, to allow search queries and then display as visualizations and/or dashboards.

- Metricbeat is a lightweight shipper that is used to help monitor your servers by periodically collecting metrics from the services and OS running on the server.

- Packetbeat is a real-time network packet analyzer similar to Wireshark that is used with elasticsearch to monitor applications providing visibility between the servers of your network.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the all the contents of Ansible folder file to /etc/ansible using the following commands:

 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/ansible.cfg
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/hosts

-Create the directories "files" and "roles" using mkdir files and mkdir roles
- The ansible directory should now have 2 directories; "files" and "roles' as well as two text files, "ansible.cfg" and
  "hosts"
-In the directory /etc/ansible/files download the config file using:
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/files/filebeat-config.yml
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/files/metricbeat-config.yml
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/files/packetbeat-config.yml
- Navigate to /etc/ansible/roles/ and run the following commands:
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/roles/WebVMSetup.yml
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/roles/filebeat-playbook.yml
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/roles/install_elk.yml
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/roles/metricbeat-playbook.yml
 - curl https://github.com/lsantos83/Project-1-Elk-Stack/blob/556c14f32a84ac2353d7dd34c1f57ea3b403e5ba/Ansible/roles/packetbeat-playbook.yml

- The files directory contains the config files for file, metric and packet beats.
- The roles directory contains all the playbook files needed to configure this ELK Stack as well as the DVWM's.
- The playbook needed to configure the Web VM's located at /etc/ansible/roles/WebVMSetup.yml.
- Create 2-3 VM's intended to be the DVWM's.
- Update the /etc/ansible/hosts file to include the private IP addresses of the newly created Web VM's under   [webservers].
- Run the WebVMSetup.yml playbook to configure the Web VM's using $>ansible-playbook WebVMSetup.yml
- Run filebeat-playbook.yml, metricbeat-playbook.yml and packetbeat-playbook.yml playbooks located in /etc/ansible/roles   to install the beats applications on the Web VM's using the command $>ansible-playbook ___beat-playbook.yml. 
- Create a VM intended to be the ELK Stack Monitoring VM.
- Update the /etc/ansible/hosts file to include the private IP address of the ELK VM under [elkservers].
- Navigate to /etc/ansible/roles and run the install_elk.yml playbook to configure to ELK VM.
- Navigate to 52.167.3.53:5601 (Public IP of ELK VM: Port 5601) to check that the installation worked as expected. You should now see the Kibana homepage.
