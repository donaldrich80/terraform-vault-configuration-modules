
# About

A collection of simple modules for configuring many of the auth frontends and secret backends of Hashicorp Vault. Designed to both simplify and demystify the process of Vault configuration/setup. They aren't guaranteed to be production ready, but they are useful as templates blocks to build out more complex configurations.

# Module List

## Auth

Most of these modules mount their backend at the default path

### Approle

Simple approle, mounts backend and creates an included identity and alias

## Certificate Authority

Sets up a root and intermediate certificate authority using internally generated certificates.

## Gitlab-CI

Sets up jwt authentication bound to url and user email, read policy, identity, and alias. Works with self-hosted instances as well. The only credential needed is VAULT_ADDR.

## OIDC

### Gitlab

SSO with Gitlab credentials

### Transit Auto Unseal

This is not fully functional, it appears it isnt possible to create wrapped tokens using Terraform. It accomplishes everything before that though.

### Userpass

Sets up a user and password with an associated identity and alias. Simple yet utilitarian.

## Audit

Sets up audit endpoints

## Identity

Simple modules to bulk import identities and groups, these aren't very functional or useful to me.

## Policies

This is pretty much a archive of fairly simple policies that I dont use but dont want to dispose of. However the "god" policy is very useful. It is trying to mimic root permissions without using the root token.

## Secrets

### KV

This is without a doubt one of the most fulfilling modules to figure out (and just as useful). The most logical way to populate the folder structure of kv storage is with a folder structure of secrets. However, after scouring thd internet I wasn't able to find a method out there to do it. Then I figured out enough Terraform to figure out a way.

This module recursively scans a folder structure for json files and writes them mounted at the auth path. Each folder must contain no more than one json file, and json files and subfolders cannot coexist.

### SSH

Both OTP and Certificate varieties. They are simple but offer a few useful customizable options. Would definately like to get these more functional/restrictive.

### Token

Generic token endpoint, however basically every parameter is able to be modified.


https://github.com/hashicorp/vault-guides
