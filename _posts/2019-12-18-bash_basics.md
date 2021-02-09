---
layout: post
title:  "Change your MAC address with a shell script"
description: "Sometimes I'm at a coffee shop and get locked out of the wifi, after an hour or two has passed. Rather than spending 2 minutes/week entering terminal commands, I thought it made sense to spend a few hours figuring out how to make it take one minute a week, instead, via AUTOMATION"
date:  2019-12-18 06:00:00 -0700
crosspost_to_medium: false
categories: [programming]
tags: [shell_scripts, bash]
permalink: shell-script-basics-change-mac-address
image: /images/2019-12-17-bash-basics-twitter-card.jpg
---

For a while, I've had notes from [Change or Spoof a MAC Address in Windows or OS X](https://www.online-tech-tips.com/computer-tips/how-to-change-mac-address/) saved, so if I am using a wifi connection that limits me to thirty minutes or an hour, I can "spoof" a new MAC address, and when I re-connect to the wifi, the Access Point thinks I'm on a new, unique device. 

For the record - when I'm posted up at a coffee shop for an extended period of time, I make sure to _buy products regularly_ in payment for my time. So, if you're spoofing your MAC address to use wifi for a longer period of time, maybe make sure to spend $5 or $10 when you run the script. 

Now, in case you think that I'm actually saving myself time here, I'm totally not. Here's why:

![XKCD Automation](https://imgs.xkcd.com/comics/automation.png "'Automating' comes from the roots 'auto-' meaning 'self-', and 'mating', meaning 'screwing'.")

_[XKCD: Automation](https://xkcd.com/1319/)_

And:

![XKCD Is it worth the time?](https://imgs.xkcd.com/comics/is_it_worth_the_time.png "Don't forget the time you spend finding the chart to look up what you save. And the time spent reading this reminder about the time spent. And the time trying to figure out if either of those actually make sense. Remember, every second counts toward your life total, including these right now.")

_[XKCD: Is it worth the time?](https://xkcd.com/1205/)_

Here's the steps, for someone who's on a MAC, to spoof your MAC address:

### Get your current MAC address

Hold down `option` key, click your wifi icon:

![wifi details](/images/2019-12-11-bash-basics-01.jpg)

### Figure out which adapter your machine is using to connect to the wifi

```shell
ifconfig en0 | grep ether # one of these will return a MAC address that matches
ifconfig en1 | grep ether # the value you saw when looking for your current
ifconfig en2 | grep ether # mac address.
ifconfig en3 | grep ether # Keep incrementing the `en0` value until you run out of 
                          # devices
```

Here's me working through the list:

![checking all ports](/images/2019-12-11-basic-bash-02.jpg)

For me, the very first result matched the MAC address I got from `option+click`ing the wifi network. 

That means I'll be using `en0` as the [E]ther[N]et adapter I'll update shortly. 

<!--more-->

### Generate a random new MAC address

A MAC address has a standard-looking format.

It looks like six blocks of two digits, which happen to be [hexadecimal representations](https://en.wikipedia.org/wiki/Hexadecimal) of `00000000` through `11111111`. 

Here's some randomly-generated MAC addresses:

```
e2:81:f6:f6:f9:e8
1f:24:37:47:d6:25
03:20:3f:48:46:ad
```

To generate a random string of characters that produces a [valid MAC address](http://sqa.fyicenter.com/1000208_MAC_Address_Validator.html), run:

```
openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
```

And boom. You've got a MAC address. 

Now we need to update our current MAC address to this new MAC address.

### Set current mac address to temporary/new MAC address

You can use `ifconfig` to set the ethernet address (is that interchangable with the MAC address?) to the randomly-generated string you got from the `openssl` command:

```shell
# you need to sudo it, unfortunately. No quotes around the mac address
sudo ifconfig en0 ether xx:xx:xx:xx:xx:xx

# here's the full command
sudo ifconfig en0 ether 8c:85:90:5a:79:56
```

And with that, you can re-connect to the wifi network, and it _should_ recognize you as a new device, and let you onto the network. 

Here's what I first ended up with:

```shell
#!/bin/bash

echo "Hi! lets change our mac address."
echo "Step 1: hold down option key, click wifi logo. Note the mac address"
echo "Step 2: click 'disconnect from network' "
echo "Step 3: note which ethernet adapter lines up with the mac address you just saw"

en0=$( ifconfig en0 | grep ether )
en1=$( ifconfig en1 | grep ether )
en2=$( ifconfig en2 | grep ether )
en3=$( ifconfig en3 | grep ether )
en4=$( ifconfig en4 | grep ether )
en5=$( ifconfig en5 | grep ether )

echo en0 is: $en0
echo en1 is: $en1
echo en2 is: $en2
echo en3 is: $en3
echo en4 is: $en4
echo en5 is: $en5

read -p 'Step 4: Enter which ethernet device lined up with the given mac address: ' ether_adapter
export ether_adapter=$ether_adapter

mac=$( openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/.$//" )
export mac=$mac

echo "btw, here's the new mac address we're going to use: $mac"
echo "OK, we will change the mac address associated with: $ether_adapter"

old_mac=$( ifconfig $ether_adapter | grep ether )

echo "The old value was: $old_mac"

sudo ifconfig $ether_adapter ether $mac

new_mac=$( ifconfig $ether_adapter | grep ether )

echo "The new value is: $new_mac"
echo "go ahead and re-connect to the wifi. You should be able to join the network."
```

Believe it or not, this script was far from perfect. 

First off, not all randomly-generated mac addresses are valid, even though they were passing an online mac address validator I was testing against. [AskUbuntu](https://askubuntu.com/a/536221) nicely shared what was going on.

I didn't want to deal with manually building a valid MAC address; I just noticed that about 2 out of 3 attempts to change my mac address, using the above script, the MAC address didn't change.

So, my next version of this script pulls the `generate mac address` and `set current mac address to generated mac address` steps into a function, and keeps calling the function until the mac address has changed.

Why be elegant and precise when you can brute force a crappy solution?

Here's my finished "solution":

```shell
#!/bin/bash
# skipping some lines
read -p 'Step 4: Which device lined up would you like to change? (hit return for en0) ' ether_adapter

if [ -z $ether_adapter ]
then
  ether_adapter="en0"
fi

export ether_adapter=$ether_adapter

generate_and_set_new_mac_address() {
  mac=$( openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/./0/2; s/.$//")
  export mac=$mac
  echo "OK, we will change the mac address associated with: $ether_adapter"

  old_mac=$( ifconfig $ether_adapter | grep ether )

  echo "The old value was: $old_mac"
  sudo ifconfig $ether_adapter ether $mac

  new_mac=$( ifconfig $ether_adapter | grep ether )
  echo "The new value is: $new_mac"
}
echo $new_mac
echo $old_mac

while [ "$new_mac" == "$old_mac" ]
do
  echo "not the same"
  generate_and_set_new_mac_address
done

echo "go ahead and re-connect to the wifi. You should be able to join the network."
```

and this seems to work pretty well:

![success](/images/2019-12-17-bash_script_success.jpg)

I hope that in the near future, I'll look at this bash script and have many ways to improve it. For now, it'll do the trick. 

### Feb 9, 2021 update

Following [this tweet](https://twitter.com/serent/status/1359208380435361792) by `@serent`, I updated the script a little. To generate a valid MAC address:

```diff
@@ -160,7 +162,7 @@ fi
 export ether_adapter=$ether_adapter

 generate_and_set_new_mac_address() {
-  mac=$( openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/.$//" )
+  mac=$( openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/./0/2; s/.$//")
   export mac=$mac
   echo "OK, we will change the mac address associated with: $ether_adapter"
```

There's other pain points in the script. I'll fix them at some point.

### Related Reading

- [Hacker News comments from 2021 on this post](https://news.ycombinator.com/item?id=26060152#26060229)
- [Bash Scripting Tutorial](https://ryanstutorials.net/bash-scripting-tutorial/bash-script.php)
- [Change or Spoof a MAC Address in Windows or OS X](https://www.online-tech-tips.com/computer-tips/how-to-change-mac-address/)
- [Resolution to `[: too many arguments` error](https://stackoverflow.com/questions/13781216/meaning-of-too-many-arguments-error-from-if-square-brackets)
- [AskUbuntu: "Can't change my mac address - can't assign requested address"](https://askubuntu.com/questions/423530/cant-change-my-mac-address-cant-assign-requested-address/536221)
