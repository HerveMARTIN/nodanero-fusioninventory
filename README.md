# fusioninventory

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with fusioninventory](#setup)
    * [What fusioninventory affects](#what-fusioninventory-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with fusioninventory](#beginning-with-fusioninventory)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This puppet module installs and configures fusion inventory agent in RHEL and Debian

## Module Description

Installs fusion inventory agents and configures the agent service or cron scripts that runs daily to update inventory database.

## Setup

### What fusioninventory affects

fusion-inventoryagent
cron


### Beginning with fusioninventory

    puppet module install nodanero-fusioninventory

## Usage

  class { 'fusioninventory':
         server_url  => 'http://localhost/glpi/plugin/fusioninventory'
  }

# Use cron scripts instead of service
  class { 'fusioninventory':
    cronscript_enable => true ,
    service => false,
    server_url  => 'http://localhost/glpi/plugin/fusioninventory'
  }



## Reference

* class fusioninventory : Installs and configures
* class fusioninventory::cronscript: Sets a cronjob
* class fusioninventory::install: Installs
* class fusioninventory::params: Configurations Parameters
* class fusioninventory::service: Sets the init service


## Limitations

Tested in Debian and Rhel

## Development

Github repository

   git clone https://github.com/nodanero/nodanero-fusioninventory fusioninventory

Building module

   sudo puppet module build . --verbose

Testing json:

   http://jsonlint.com/
