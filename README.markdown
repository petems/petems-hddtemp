# hddtemp Puppet Module
[![Build Status](https://secure.travis-ci.org/petems/petems-hddtemp.svg)](https://travis-ci.org/petems/petems-hddtemp)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with hddtemp](#setup)
    * [What hddtemp affects](#what-hddtemp-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with hddtemp](#beginning-with-hddtemp)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This Puppet module is designed to facilitate the installation and configuration of [hddtemp](https://savannah.nongnu.org/projects/hddtemp/).

## Module Description

The primary scope includes installing the package on the system and populating the init script with the appropriate devices.

At this time only sd* devices are correctly autoconfigured. IDE devices are **not supported** and must be manually configured.

This module is based on [brentschler/hddtemp](https://forge.puppet.com/brentschler/hddtemp), but updated with acceptance tests and a few of my opinionated changes.

## Setup

### What hddtemp affects

By default, this module will:
* Install the hddtemp package
* Configure the config file (eg. /etc/sysconfig/hddtemp)
* Set up and enable the hddtemp service.

### Beginning with hddtemp

Most of hddtemp's setup is handled by the package itself.

Configuration is mainly configured in `/etc/sysconfig/hddtemp`.

Full docs are avaliable here: https://savannah.nongnu.org/projects/hddtemp/

## Usage

This module includes a single class:
```puppet
include '::hddtemp'
```

You'll more than likely want to provide the appropriate values for your setup.

To change the port that hddtemp runs on (the default is 7634)
```puppet
class { '::hddtemp':
  listen_port => '9999',
}
```

## Limitations

* This module is currently only used on an HP Gen 8 Ubuntu 16.04 box, so mainly tested with that setup

## Development

If you'd like to other features or anything else, check out the contributing guidelines in CONTRIBUTING.md.
