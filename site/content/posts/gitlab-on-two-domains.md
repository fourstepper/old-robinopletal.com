---
title: "Running Gitlab simultaneously on two domains"
date: 2022-11-24T16:11:21+02:00
draft: false
tags: ["tips", "git", "gitlab", "software"]
---

## The problem

So you have a Gitlab instance running and you are thinking about migrating it to a new domain, without breaking existing functionality (such as the registry, links in a broad, hard-to-batch-edit documentation etc.)

What you will probably find after a bit of searching is [this six year old feature request](https://gitlab.com/gitlab-org/gitlab/-/issues/15430) on the Gitlab issue tracker, from which you will quickly understand that this is not supported.

So, what to do?

## The solution

Gitlab, in the Omnibus installation, uses nginx for all of it's domain routing.

It also, luckily, allows the administrator to add a custom nginx config file and include it in the main `nginx.conf` - let's use that!

To the `gitlab.rb` file, add the following line:

```ruby
nginx['custom_nginx_config'] = 'include /etc/gitlab/nginx-extra.conf;'
```

This will add an include of an nginx configuration file that we will create right now.

It's contents will be something along the lines of:

```nginx
# web
server {
        listen 443 ssl http2;

        server_name legacydomain.example.com;

        server_tokens off;
        ssl_certificate /etc/ssl/certs/legacydomain.example.com/fullchain.cer;
        ssl_certificate_key /etc/ssl/certs/legacydomain.example.com/legacydomain.example.com.key;
        ssl_ciphers 'ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256';
        ssl_protocols  TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_session_cache  builtin:1000  shared:SSL:10m;
        ssl_session_timeout  5m;

        return 301 https://shinynewdomain.example.com$request_uri;
}
# registry
server {
        listen 443 ssl http2;
        server_name registry.legacydomain.example.com;

        server_tokens off;
        ssl_certificate /etc/ssl/certs/registry.legacydomain.example.com/fullchain.cer;
        ssl_certificate_key /etc/ssl/certs/registry.legacydomain.example.com/registry.legacydomain.example.com.key;
        ssl_ciphers 'ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256';
        ssl_protocols  TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_session_cache  builtin:1000  shared:SSL:10m;
        ssl_session_timeout  5m;

        return 301 https://registry.shinynewdomain.example.com$request_uri;
}
# pages
server {
        listen 80;
        listen 443 ssl http2;

        server_name ~^(?<subdomain>.*)\.gpages.legacydomain.example.com;

        server_tokens off;
        ssl_certificate /etc/ssl/certs/gpages.legacydomain.example.com/fullchain.cer;
        ssl_certificate_key /etc/ssl/certs/gpages.legacydomain.example.com/gpages.legacydomain.example.com.key;
        ssl_ciphers 'ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256';
        ssl_protocols  TLSv1.2;
        ssl_prefer_server_ciphers on;
        ssl_session_cache  builtin:1000  shared:SSL:10m;
        ssl_session_timeout  5m;

        return 301 https://$subdomain.gpages.shinynewdomain.example.com$request_uri;
}
```

After editing the file according to your needs, you should have a working redirect from the old legacy domain to your new domain :)
