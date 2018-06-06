# Redmine Risk Management

V0.0.4 (5-Jun-2018)


## About

Risk management is a plugin for [Redmine](http://www.redmine.org/) (a project management web application), allowing to manage the risks for a given project.

## Installation

1. Download tarball
2. cd {redmine_root}/plugins/; mkdir redmine_risk_management
3. Extract files to {redmine_root}/plugins/redmine_risk_management/
4. rake redmine:plugins:migrate NAME=redmine_risk_management RAILS_ENV={Environment}

## How to use

First you can create custom status going to the plugin administration page.

![redmine_rm_risks screenshot](https://raw.githubusercontent.com/imaginary-cloud/redmine_risk_management/redmine-3.4.5-fixes/Screenshot_risks.png)

To create a risk for a project you need to click in Risks tab under the project detail page. 


![redmine_rm_status screenshot](https://raw.githubusercontent.com/imaginary-cloud/redmine_risk_management/redmine-3.4.5-fixes/Screenshot_risks.png)

## Keywords

Risk Management, Risk, Impact, Management, Redmine, Plugin

## Support

Support will only be given to the following versions or above:

* Redmine version                2.6.10
* Ruby version                   2.2.0
* Rails version                  3.2.22

Note: Redmine 2.6.5 does not support Ruby 2.2. Redmine 2.6.6 supports it (#19652). [Link](http://www.redmine.org/projects/redmine/wiki/RedmineInstall/252#Requirements)

## License

Copyright © 2010-2018 [Imaginary Cloud](https://www.imaginarycloud.com). This library is licensed under the MIT license.

## About Imaginary Cloud

![alt text](https://s31.postimg.cc/nwi7gpouz/Imaginary_Cloud.jpg)

We apply our own Product Design Process to bring great digital products to life. Visit [our website](https://www.imaginarycloud.com) to find out about our other projects or [contact us](https://www.imaginarycloud.com/contacts) if there's an idea that you want to turn into an outstanding product, we'll take it from there!

