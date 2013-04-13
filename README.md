Project Mgmt
============

Project manager for social networks

Installation
------------

* Clone repository onto machine with Ruby and Rails. 
* Create a Facebook app. Copy the App ID and App Secret into the supplied facebook.yml as in the comment. 
* Place supplied file 'facebook.yml' in '/\<repository_name\>/config/'
* Back on Facebook, on the 'Apps > \<project_name\> > Basic' page, click 'Website with Facebook Login' and enter `http://<your-domain>:3000`
* Click 'App on Facebook' and enter `http://<your-domain>:3000/pages/authorize`
* You may wish to disable Sandbox Mode to let non-developers test the app.
* Click 'Save Changes'
* In app directory run `rails s -e production`.
* Point web browser to http://\<your-domain\>:3000

_OR_

* go to http://walen.me:3002 to try out the app


Notes
-----

This app does not work with HTTPS, so to accept an invitation through Facebook, one must disable forced HTTPS in 'Account Settings > Security > Secure Browsing'.

Tested on Linux x86 with Ruby 2.0.0p0 and Rails 3.2.13.
