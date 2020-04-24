---
layout: post
title:  "Turing Prep appendix: Troubleshooting Errors"
date:  2019-05-19 07:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-troubleshooting-guide
---

#### Index of this series:
- [Turing Prep Chapter 1: Make Mod 1 Easier Than It Otherwise Would Be]({{ site.baseurl }}{% link _posts/2019-05-09-turing_prework_01_intro.md %})
- [Turing Prep Chapter 2: Your first passing tests!]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_02_getting_the_right_files.md %})
- [Turing Prep Chapter 3: Video walk-through of a few of the mythical creatures, like `unicorn.rb`, `dragon.rb`, and `hobbit.rb`]({{ site.baseurl }}{% link _posts/2019-05-31-turing_prework_03_mythical_creatures.md%})
- [Turing Prep Chapter 4: Arrays, Hashes, and Nested Collections]({{ site.baseurl }}{% link _posts/2019-06-09-turing_prework_arrays_hashes_nested_collections.md %})
- [**Turing Prep appendix: Troubleshooting Errors**]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_troubleshooting.md %}) (This is what you're reading right now)

-------------------------------------------



# Troubleshooting Common Errors

Pretty much any time I hear the same question twice, I will try to add a section here for it, and make it as easily findable by future students as possible. Here's the questions I've got answered below:

- [`Traceback... cannot load such file -- pry`](#traceback-cannot-load-such-file----pry)
- [cannot open Atom from the Terminal](#cannot-open-atom-from-the-terminal)
- [`FSPathMakeRef`](#fspathmakeref-and-a-bunch-of-other-stuff)
- [`gem install pry` giving `ERROR... You don't have write permissions...`](#gem-install-pry-failing-with-you-do-not-have-permission)
- [Undefined method `pry`](#undefined-method-pry)
- [Add `pry` snippet in Atom](#add-pry-snippet-in-atom)


## `Traceback... cannot load such file -- pry`

This seems like an intimidating error message at first. 

It's not. The error just says:

> Dear user, you've asked me to import code to run these tests, but I cannot find the code you require. 
>
> The code I was looking for (and cannot find) is called `pry`

Pry is an amazing tool. You'll soon come to love it. In the mean time, just install it. It's a ruby "gem" so you use the `gem install <gem_name>` command.

In your terminal, run `gem install pry` and then run the tests again. 

## Cannot open Atom from the terminal

You may need to install the Atom Shell Commands. Atom makes it super easy to do this:

![install shell commands](/images/2018-09-14_turing_troubleshooting_01.jpg)

<!--more-->


## `FSPathMakeRef` and a bunch of other stuff

Here's an error one student saw:

`FSPathMakeRef(/Applications/Atom.app) failed with error -36.`

Googling around led here: https://github.com/atom/atom/issues/5222

One possible cause was the user's machine had two instances of `Atom.app` on it. (In this case, one was in the `Downloads` folder, the other in `Applications`. Delete one of them, try again.


## `gem install pry` failing with "you do not have permission"

If you get an error like this:

```console
ERROR:  While executing gem ... (Gem::FilePermissionError)
    You don't have write permissions for the /Library/Ruby/Gems/2.3.0 directory.
```

Don't worry. We'll sort you out. It'll take some work. 

First, lets see which installed version of Ruby your computer is trying to use:

```
$ which ruby
```

If you get something that looks like this:
```
/usr/bin/ruby
```

We'll need to fix it. Read on.

If you get something like one of these:

```
/Users/joshthompson/.rbenv/shims/ruby
/Users/joshthompson/.rvm/rubies/ruby-2.3.3/bin/ruby
```

You're in good shape. Stop reading this section. The rest of this fix will not apply to you.

### `which ruby` returns `/usr/bin/ruby`

This means you're using the version of Ruby that came installed on your laptop. You shouldn't be messing with this version of Ruby, so your system isn't letting you.

To use Ruby safely, you'll need to install some tool to manage Ruby's environment. `rbenv` is the most common tool for this: [https://github.com/rbenv/rbenv](https://github.com/rbenv/rbenv)

You should have `[homebrew](https://brew.sh/)` on your computer already. If you don't figure out how to install it.

If you have it, here's a summary [of the instructions for MacOS](https://github.com/rbenv/rbenv#homebrew-on-macos):

```shell
$ brew install rbenv
$ rbenv init
```

You'll possibly get a result that looks like this:

```
# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init -)"
```

We need to follow this instructions, which, translated, say:

> Please modify a configuration file on your laptop to include this line of code at the bottom of it.

To do that, we can run:

```
echo "eval '$(rbenv init -)'" >> ~/.zshrc && source ~/.zshrc
```

_You should be skeptical of blindly copy-pasting commands from strangers on the internet into your terminal. This command contains three different commands, the `echo`, `append`, and `source` commands. I recommend installing this [tldr tool](https://github.com/tldr-pages/tldr) to understand exactly what is happening here._

now do `gem install pry` again. If it works, success! You're done! 

If that _doesn't_ work, `rbenv` might not yet be installed, so lets make sure it's installed and working correctly. Do:

```
$ rbenv -v
```

You should get something like `rbenv 1.1.2` back.

Next, tell `rbenv` to install ruby 2.4.1:

```
$ rbenv install 2.4.1
```

And then set this version of ruby as the "global" version to use, until you tell it otherwise or a particular project specifies a different version:

```
$ rbenv global 2.4.1
```

You can now do `gem install pry`, and it will install the gem to the `2.4.1` version of Ruby, as managed by `rbenv`.

If you see this message:

```
# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init -)"
```

We need to follow this instructions, which, translated, say:

> Please modify a configuration file on your laptop to include this line of code at the bottom of it.

To do that, we can run:

```
echo "eval '$(rbenv init -)'" >> ~/.zshrc && source ~/.zshrc
```

All done! 

### `undefined method pry`

`undefined method 'pry' for #Binding:0x0007f8f980d39f8>`

When you try to hit a `pry` in your tests, you might type in something like:

```ruby
def test_12
  children = ["Sarah", "Owen", "Peter"]
  
  binding.pry # adding a pry
  one_string = children
  assert_equal "Sarah, Owen, Peter", one_string
end
```

And then you get an error like: 

> `undefined method 'pry' for #Binding:0x0007f8f980d39f8>`

The problem is ruby needs the `pry` gem to be available in the file where you're trying to use `binding.pry`. Here's how to do this:


## Add Pry snippet in Atom

We're going to make this happen with four presses, instead of 26.

So you can type `pry` and hit the `tab` key, and it'll auto-expand into the full snippet:

![pry all day](/images/2019-09-20-pry-04.gif)

Wahoo!


Also, this line of code is easy to make mistakes with. 

I can hardly type `require 'pry';binding,pry`. I mean `require "pry":bindingpry`...


Here's how to set this shortcut up:

1. Go to `Atom > Snippets`

![go to snippets](/images/2019-09-20-pry-03.jpg)

2. Paste this `pry` snippet shortcut into the `snippets.cson` file:

```cson
'.source.ruby':
  'require "pry"':
    'prefix': 'pry'
    'body': 'require "pry"; binding.pry'
```

It should look something like this:

![the whole .cson file](/images/2019-09-20-pry-05.jpg)

Save and close this file, and go back to your code, type `pry`, and hit `tab`. 👍


Want to know more about Atom's snippets? [Heres Atom's docs on snippets](https://flight-manual.atom.io/using-atom/sections/snippets/)




