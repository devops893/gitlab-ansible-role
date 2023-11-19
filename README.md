## Requirements

## Variables

### Non-secret

```yaml
gitlab:
  # Host to listen on
  host: gitlab.smartshell.dev
  # Primary gitlab url
  url: https://gitlab.smartshell.dev
  # Optional. True by default
  redirect_http_to_https: true
  # Gitlab apt package
  # Import does not work in 14.6.0-ce.0 14.5.2-ce.0 14.5.1-ce.0 14.5.0-ce.0 14.4.4-ce.0 14.4.3-ce.0 14.3.6-ce.0
  package: gitlab-ce=14.9.5-ce.0
  tls_certificate:
    # Where to take TLS certificate from
    src: /etc/gitlab/gitlab.smartshell.dev.crt
    # Just copy or create link?
    create_link: true
    # Is src from remote (on instance being configured) or exists on ansible controller
    remote_src: true
  tls_key:
    src: /etc/gitlab/gitlab.smartshell.dev.key
    create_link: true
    remote_src: true
  # Content of this files will be templated and included in gitlab.rb
  config_part_template_paths:
  - templates/gitlab/ldap_config_part.rb.j2  
  # Backups dir
  backup_path: /var/backups/gitlab
  # How many days to store job logs. 30 by default
  ci_logs_lifetime: 30  
```  

### Secret

```yaml
gitlab: 
  # root user password
  root_password: PASSWORD
  # Optional. Required for migration from cloud Gitlab
  # https://docs.gitlab.com/ee/integration/gitlab.html
  api_id: LALALA
  api_secret: LALALA
```