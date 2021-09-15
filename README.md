# SAMM Self Assessment


### So what is the Samm Self Assessment tool?

The Samm Self Assessment tool is an implementation of the OpenSAMM (http://www.opensamm.org) process wrapped together into a little Rails application. Its aim is to simplify the measurement of your organisation against OpenSAMM, and to assist in the construction of a roadmap, and subsequent tracking of progress down that roadmap.

### Why would you build this?

Well, simply put, we think that OpenSAMM is a great process to help organisations measure the maturity of security within their software development lifecycle. Plus, we wanted something lightweight that could be stood up on a standalone desktop (with Rails), or even hosted on the Internet (Heroku/EC2/etc)

### Okay, so why would I measure software security maturity?

Without this measurement trying to improve the state of security within your software development lifecycle is going to be difficult. As they say: You can't manage what you can't measure.


https://github.com/AsteriskLabs/ssa

---

## For testing in Vagrant

Requariments:

Vagrant 2.2.18

Virtua Box 6.0.24

No DHCP "VirtualBox Host-Only Ethernet Adapter", ip: 192.168.56.1/24, example:

![image](https://user-images.githubusercontent.com/16451776/133385223-80450892-f2be-46ce-8791-284be704ac89.png)

How use:

 - git clone https://github.com/Cyber-Dolphin/samm_sa_vagrant.git
 - cd samm_sa_vagrant && vagrant up
 
Open web browser http://192.168.56.50:3000

---

Rake can be used to generate a random value for you if you wish
 
 - rake secret


Enter the following into the file config/initializers/secret_token.rb
 
 - Ssa::Application.config.secret_token = "<RANDOM TOKEN>"
    

By default, registering a new account will require email validation, so update 'config/initializers/mail.rb' with appropriate settings.

Update 'config/initializers/devise.rb' with an appropriate 'from' email address

If you don't want users to have to validate their emails, update 'app/models/user.rb' and remove the ':confirmable' option.

