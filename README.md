Using the free version of Tailscale with a YubiKey for authentication, I manage Windows hosts from WSL using Ansible and SSH public/private key authentication.

On each client, I only need to:

Create an administrator account.
Install and enable OpenSSH Server.
Configure the SSH public key for the administrator account.

This can be automated using PowerShell.

Then I simply add the client's Tailscale IP address to the Ansible inventory file and can securely manage the Windows computer over the Tailscale network.

Of course, you can further secure Windows by disabling SSH password authentication and allowing only public key authentication. 

You can also disable password authentication for your Windows administrator account and enable it again whenever you need it.
