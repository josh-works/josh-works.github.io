---
layout: post
title:  "How To Take Back Your Attention On The Internet with uBlock"
date:  2018-01-21 01:00:00 -0700
crosspost_to_medium: false
categories: [habits, goals, tools]
tags: [hard things, habits, goals, minimalism, willpower, clutter]
permalink: take-back-your-attention
---

_note: this page has 17Mb of gifs and images. I don't really want to take the time to manually trim the gifs from >3Mb/each to <1Mb each, so I didn't. If you're on mobile, or trying to conserve data, you might want to come back to this one later._

I value my attention and focus. I resent *strongly* when someone tries to take it away from me.

Someone tries to derail my attention pretty much any time I browse the internet. Little pop-ups, auto-playing videos, click-baity headlines, etc.

I've settled on a pretty good system for blocking annoying crap on the internet.

Here's the elements on a few different websites that _I_ visit regularly, with the elements I'm going to remove highlighted.

We're going to take this:

![crappy twitter](/images/2018-01-18-twitter-01.png)

To this:

![better twitter](/images/2018-01-18-twitter-02.jpg)

I've got some special "rules" for twitter at the bottom of this post. The key is to know you may have to use wildcards in your CSS rules to catch all instances of a thing you want to block, like:

```
twitter.com##li[id^="stream-item-who_to_follow_entry"]
```

<!--more-->

And bad LinkedIn:

![bad linkedin](/images/2018-01-18-linkedin-01.jpg)

To less-bad LinkedIn:

![good linkedin](/images/2018-01-18-linkedin-02.jpg)


Bad Comcast email login: (which I never use)

![bad xfinity](/images/2018-01-20-xfinity_01.jpg)

To better:

![less bad xfinity](/images/2018-01-20-xfinity_02.jpg)

Inside the above email account. I'm already paying them money, why must I be assaulted with further ads?

![bad comcast](/images/2018-01-20-xfinity_03.jpg)

I love StackOverflow. I couldn't do my job without it. But even StackOverflow has unwanted cruft on its pages.

I didn't get a screenshot of the worst offender - the "Hot Network Questions", where popular questions from entirely unrelated topics are listed. Questions like

- "Why does Yoda age so slowly in the newest Star Wars"
- "Short story where the protagonist is unknowingly the demon Beelzebub"

These are distracting and unwelcome. With uBlock, I can remove them all, forever.

![Stack Overflow](/images/2018-01-21_so_01.jpg)

# Install uBlock to permanently delete all this crap

First, you'll need [uBlock Origin](https://github.com/gorhill/uBlock). It it is basically a tool that sits between your browser and the internet, and if any scripts are calling resources that match anything in a blacklist, it keeps the resource from loading.

From uBlock's own description:

> uBlock Origin is **NOT** an "ad blocker": [it is a wide-spectrum blocker](https://github.com/gorhill/uBlock/wiki/Blocking-mode) -- which happens to be able to function as a mere "ad blocker". The default behavior of uBlock Origin when newly installed is to block ads, trackers and malware sites -- through [_EasyList_](https://easylist.github.io/#easylist), [_EasyPrivacy_](https://easylist.github.io/#easyprivacy), [_Peter Lowe’s ad/tracking/malware servers_](https://pgl.yoyo.org/adservers/policy.php), various lists of [malware](http://www.malwaredomainlist.com/) [sites](http://www.malwaredomains.com/), and uBlock Origin's [own filter lists](https://github.com/uBlockOrigin/uAssets/tree/master/filters).


It's a powerful tool. Install it for:

- [Firefox](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
- [Chrome](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
- [Safari's comically complicated install process (nevermind. You have to reinstall every time you restart safari. Don't use safari. Use  Firefox instead)](https://github.com/el1t/uBlock-Safari#ublock-originfor-safari)
- [Microsoft Edge](https://www.microsoft.com/en-us/store/p/app/9nblggh444l4?rtc=1)


Do you have it installed? You should see a little icon in your browser with a number on it now.

![ublock in browser](/images/2018-01-21_ublock_01.jpg)

(By the way, that badge with a 50 on it is the number of scipts and resources uBlock is disabling _by default_ on this domain.)

## Using uBlock

I'm on [denverpost.com](https://www.denverpost.com/2018/01/21/colorado-10-lane-highway-autonomous-vehicle-lane-traffic/)

Here's how we choose and block page elements.

Lets first pick that header-bar asking me to turn on browser notifications:

![gif of uBlock in action](/images/2018-01-21_ublock_02.gif)

_gif of ublock in action_

What I'm doing is:

1. Click the uBlock menu icon
2. Select the "element picker" tool. (it looks like an eye dropper)
3. Mouseover the page until I've "selected" the portion of the page I want to remove. (uBlock highlights the current page node that the rule would apply to)
4. Click that element of the page
5. When I click, a very hard-to-see menu pops up in the bottom right corner of the page. I then move my mouse over to it, and click the "create" button.

At that point, uBlock finds that element of the page and deletes it. Forever.

A brief technical aside of what's going on:

The page is represented to the user as a continuous document, but the underlying structure is a "Document Object Model", and every page element is a "node" that exists mostly-independently of any other node on the page. We're using uBlock to highlight the nodes of the DOM, and when we select one, uBlock says "ok, this here node... I'll just remove it from the DOM".

Lets remove more nodes. I really don't like email/subscribe popups, so I always delete them.

![remove the subscribe notification](/images/2018-01-21_ublock_03.gif)

_gif of removing subscribe popup_

"Trending" news is just a way of saying

> you're not here to read these articles, but other people are clicking on them and we hope you'll do the same.

So, remove it:

![remove the sidebar](/images/2018-01-21_ublock_04.gif)

_gif of removing the sidebar_

The final version is quite a bit more peaceful and less disruptive and attention-grabbing than the origional website.

Oh, and these rules usually apply to "promoted" content that's inserted in your "feed". Just find the promoted node, select it, and delete it. This usually will apply to *all* promoted posts in your feed, so it's a great way to get spam out of whatever long list you are scrolling through. (Facebook/Instagram/Twitter).

## A few surprises that can happen with uBlock

Since uBlock by default disables many unwanted scripts and resources, it can introduce some unexpected behavior on websites. If a website isn't behaving exactly as expected, turn off uBlock and see if the resource loads.

For example, some websites use untrustworthy javascript redirects to track your movement to third-party websites. if those redirects rely on untrusted third-party resources, they won't be loaded on the page. Ditto for some kinds of form submission behavior, image/video resources, etc.

So, turning off uBlock is very easy:

- Click the uBlock menu icon
- click the blue "power" icon
- Click the "refresh page" button

uBlock will not block anything on this page now. To turn it back on, repeat the above steps.

![turning off ublock](/images/2018-01-21_ublock_05.gif)

_gif of temporarily disabling uBlock_

If you accidentally delete an element you didn't intend (like, the main content of the page, for example!) you'll have to remove the "page rule" you just created.

This is very easy.

![deleting wrong element](/images/2018-01-21_ublock_06.jpg)

_picture of where the article is *supposed* to be_

- click uBlock menu icon
- click "open the dashboard"
- navigate to the "my filters" tab
- delete the bottom line from that list of rules. A line beginning with `!` is a comment describing the next line, which is the "rule" that uBlock actually reads and applies to the page.
- click "apply changes"
- go back to the website (it's tab is still open) and refresh the page.

![fixing a bad delete](/images/2018-01-21_ublock_07.gif)

_gif of removing the bad page rule_


# Is ublock *really* necessary?

> OK, Josh, this is a lot of work to _individually delete page nodes_ just to "preserve" my attention? I can read articles without worrying about the rest of the sidebars. Don't you think this is overkill?

I don't think it's overkill.

A while back, [I wrote about a book called _Deep Work_, and the profound impact it had on me]({{ site.baseurl }}{% link _posts/2016-10-24-i-quit.md %}). I stepped off of social media completely, and made efforts to trim away other distractions in my life.

Since taking these steps, I've become sensitive and more attuned to when I'm subjected to unwilling sources of distraction. It's as if my "someone is trying to influence me" radar got much stronger.

I suspect that if you start using uBlock to remove annoying elements from pages, you'll start developing a stronger radar for when someone is trying to monetize your attention, and and then you'll block those elements, but then become even more attuned to those unwanted influences, and then block them, and on and on.

It is worth pointing out that _this very website_ is devoid of those sorts of elements I find annoying. No popups, no sidebar content, no click-baity headlines. If you want to share one of these posts on social media, you have to do it the old school way. Copy and paste the URL into your platform of choice.

Note how clean the URL is: `https://josh.works/post-title`. Positively peaceful.

The only metric I pay attention to is email subscribers. Someone subscribing via email is basically the highest endorsement of trust I can imagine. I'm extremely judicious in subscribing to other people's websites, so I value other people trusting me with their email address.

# Detail on Twitter

A few more thoughts on Twitter. Here's its most recent ugly UI

![before](/images/2019-07-17-before.jpg)

And after its fixed:

![After](/images/2019-07-17-after.jpg)

Twitter is tricky about ads/follow suggestions it injects into your stream. Because the root node ID is unique to you/the user the add wants you to follow, you need to use a little wild-carding to catch-and-delete these all. 

First, here's what the rules look like for deleting individual ads. These entries are useless, as once the long string of digets at the end changes, the ad won't be caught by uBlock.

```
twitter.com###stream-item-who_to_follow_entry-955359935176437758
twitter.com###stream-item-who_to_follow_entry-953442336767381502
twitter.com###stream-item-who_to_follow_entry-955359935176437758
```

Here's the rule I have in uBlock, that just catches all of these, no matter what the actual element id is:

```
twitter.com##li[id^="stream-item-who_to_follow_entry"]

// Here's some other twitter rules that might be helpful

```

Go forth and retain more of your attention!

### Related Resources

- [Use uBlock Origin to remove any element from a page permanently, _ghacks.net_](https://www.ghacks.net/2017/02/21/ublock-origin-how-to-remove-any-element-from-a-page-permanently/)
- [Willpower is over-rated. Build systems to ensure desired behavior, _Vox.com_](https://www.vox.com/science-and-health/2018/1/15/16863374/willpower-overrated-self-control-psychology)
- [Is there any way to hide promoted tweets from the twitter feed with uBlock Origin? (Reddit)](https://www.reddit.com/r/uBlockOrigin/comments/6g4jvt/is_there_any_way_to_hide_promoted_tweets_from_the/)