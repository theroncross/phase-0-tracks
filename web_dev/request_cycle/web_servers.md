##LINUX (UNIX) Design Philosophy
1. Do one thing and do it well (DOTADIW)
2. UNIX is based on small, simple, clear, general modules or elements
3. These modules are designed to play well with other modules
4. Each module should take in text, filter it in some way, and push the resulting text out
5. More complex programs result from 'piping' these modules to one another
6. Don't write your own code if better, previously tested code already exists

##VPS
A Virtual Private Server is some memory on a remote computer that can run its own operating system. As the 'owner' of the VPS, you can install any software you want and use it as if it were a stand alone computer.

##Root Users
###Reasons not to log in as the root user
1. root has full write privileges. There is no safety net to prevent damaging core functionality.
2. Some malicious software is only effective when run from root
3. you can acquire root privileges on an as needed basis with sudo

