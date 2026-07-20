# reboot_if_no_users

Reboots a Windows computer only when there are no interactive users logged on.

## Variables

```yaml
reboot_timeout: 900
```

## Example

```yaml
- hosts: windows
  gather_facts: false

  roles:
    - reboot_if_no_users
```
