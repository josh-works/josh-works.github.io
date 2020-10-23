---
layout: post
title:  "Turing Prep Chapter 4: Arrays, Hashes, and Nested Collections"
date:  2019-06-09 06:00:00 -0700
crosspost_to_medium: false
categories: [turing]
tags: [programming, turing]
permalink: turing-backend-prep-arrays-hashes-nested-collections
image: /images_2020/turing-prep-series-cover.jpg
---

{% include turing_prework_index.md %}

So far, we've covered some [string manipulation]({{ site.baseurl }}{% link _posts/2019-05-19-turing_prework_02_getting_the_right_files.md %}) and did a few [mythical creatures]({{ site.baseurl }}{% link _posts/2019-05-31-turing_prework_03_mythical_creatures.md %}). 

You totally don't have to look through the screencasts in the order I've listed below. I just wanted to call out array/hash manipulation on its own page.

[You can also look through the whole playlist](https://www.youtube.com/playlist?list=PLziI1EoC2-jdfrIdeqUNHYVTnq99uVm6I).

## Array Manipulation Exercises

These are from `ruby-exercises/data-types/collections/arrays.rb`

<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/RUnd1Uu0AyE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<!--more-->


I'll add more screencasts for the other files in this directory soon:

```
> tree collections
collections
├── README.md
├── advanced_nested_collections
│   ├── nesting.rb               // done
│   └── nesting_test.rb          // done
├── arrays.rb                    // done, what you're reading right now
├── hashes.rb                    // coming soon
└── nested_collections.rb        // coming soon
```

As I've mentioned before, I would recommend you try to stay _ahead_ of me in this video. If you get stuck on making a test pass for more than a few minutes, check that spot of the video, then carry on.

This video is so long because I go into excruciating detail on each test, not just showing the given method that works, but showing how I would google for the right answers if I didn't know them. 

Googling is a skill. Get good at it. :)

#### Here's an index of timestamps/what's covered at that location for this Array manipulation video. 

- [1:10 - How to use this video](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=1m10s)
- [2:05 - test_0](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=2m05s)
- [2:28 - test_1](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=2m28s)
- [3:05 - test_2](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=3m05s)
- [3:35 - using "pry" for the first time in this file](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=3m35s)
- [4:53 - test_22](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=4m53s)
- [8:33 - test_3](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=8m33s)
- [9:20 - Anki flashcard post I mention]({{ site.baseurl }}{% link _posts/2017-06-06-memorizing-programming-with-anki.md %})
- [10:12 - test_4](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=10m12s)
- [14:10 - test_a](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=14m10s)
- [15:18 - test_5](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=15m18s)
- [18:17 - test_b](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=18m17s)
- [18:36 - test_c](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=18m36s)
- [19:08 - test_6](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=19m08s)
- [21:33 - test_7](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=21m33s)
- [23:02 - test_8](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=23m02s)
- [27:04 - test_9](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=27m04s)
- [30:19 - test_10](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=30m19s)
- [30:59 - test_11](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=30m59s)
- [31:41 - why read the docs?](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=31m41s)
- [32:37 - test_12](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=32m37s)
- [34:58 - test_13](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=34m58s)
- [36:05 - test_14](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=36m05s)
- [38:10 - suggested next steps](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=38m10s)
- [38:46 - write down Array methods in a notebook.](https://www.youtube.com/watch?v=RUnd1Uu0AyE&t=38m46s)


## Advanced Nested Collections

Inside the `collections` directory, there's _another_ directory, `advanced_nested_collections`; this is well worth your time to play around with. 

Here's a walk-through:

<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/9AaElA4elDU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

I cover a lot of things in the video; here's the index:

- [0:04 - The "tree" command: https://github.com/MrRaindrop/tree-cli](https://www.youtube.com/watch?v=9AaElA4elDU&t=0m04s)
- [0:14 - `cd` to the target file](https://www.youtube.com/watch?v=9AaElA4elDU&t=0m14s)
- [1:10 - the importance of process over specific answers](https://www.youtube.com/watch?v=9AaElA4elDU&t=1m10s)
- [1:54 - I probably won't be coming up with the "best" solutions, and that's OK](https://www.youtube.com/watch?v=9AaElA4elDU&t=1m54s)
- [2:50 - Copying relative and absolute file paths to the clipboard](https://www.youtube.com/watch?v=9AaElA4elDU&t=2m50s)
- [3:15 - run all tests, all skipped](https://www.youtube.com/watch?v=9AaElA4elDU&t=3m15s)
- [3:23 - def test_list_of_olive_garden_employees](https://www.youtube.com/watch?v=9AaElA4elDU&t=3m23s)
- [3:33 - exploring the `stores` object in Pry](https://www.youtube.com/watch?v=9AaElA4elDU&t=3m33s)
- [4:29 - Start with other hash exercises; if you've not done any, this isn't a good starting point.](https://www.youtube.com/watch?v=9AaElA4elDU&t=4m29s)
- [4:50 - test_pancake_ingredients](https://www.youtube.com/watch?v=9AaElA4elDU&t=4m50s)
- [5:42 - using .keys](https://www.youtube.com/watch?v=9AaElA4elDU&t=5m42s)
- [6:30 - dealing with array of hashes](https://www.youtube.com/watch?v=9AaElA4elDU&t=6m30s)
- [7:26 - test_rissotto_price](https://www.youtube.com/watch?v=9AaElA4elDU&t=7m26s)
- [8:33 - test_big_mac_ingredients](https://www.youtube.com/watch?v=9AaElA4elDU&t=8m33s)
- [9:52 - using .find; I used it wrong. Better usage examples: https://www.youtube.com/watch?v=2tTMAPT7rcw, https://apidock.com/ruby/Enumerable/find. Sorry.](https://www.youtube.com/watch?v=9AaElA4elDU&t=9m52s)
- [10:40 - I'm still using it wrong. super sorry.](https://www.youtube.com/watch?v=9AaElA4elDU&t=10m40s)
- [11:10 - Find is an Enumerable method, not Array method, which is why I had to look in a different spot in the docs](https://www.youtube.com/watch?v=9AaElA4elDU&t=11m10s)
- [12:39 - test_list_of_restaurants](https://www.youtube.com/watch?v=9AaElA4elDU&t=12m39s)
- [13:39 - test_list_of_dishes_names_for_olive_garden](https://www.youtube.com/watch?v=9AaElA4elDU&t=13m39s)
- [14:20 - using .map for first time.](https://www.youtube.com/watch?v=9AaElA4elDU&t=14m20s)
- [15:30 - convert .map to .each, per instructions](https://www.youtube.com/watch?v=9AaElA4elDU&t=15m30s)
- [15:45 - using `continue` in pry to move to next item in list](https://www.youtube.com/watch?v=9AaElA4elDU&t=15m45s)
- [16:20 - difference between .each and .map](https://www.youtube.com/watch?v=9AaElA4elDU&t=16m20s)
- [18:43 - test_list_of_employees_across_all_restaurants](https://www.youtube.com/watch?v=9AaElA4elDU&t=18m43s)
- [21:13 - using ruby docs to get unstuck](https://www.youtube.com/watch?v=9AaElA4elDU&t=21m13s)
- [22:10 - using .each with TWO arguments in block instead of one.](https://www.youtube.com/watch?v=9AaElA4elDU&t=22m10s)
- [23:44 use .concat to avoid nested arrays](https://www.youtube.com/watch?v=9AaElA4elDU&t=23m44s)
- [25:29 test_list_of_all_ingredients_across_all_restaurants](https://www.youtube.com/watch?v=9AaElA4elDU&t=25m29s)
- [32:29 test_full_menu_price_for_olive_garden](https://www.youtube.com/watch?v=9AaElA4elDU&t=32m29s)
- [37:13 test passes. Lets refactor, giving .reduce a shot! 😱](https://www.youtube.com/watch?v=9AaElA4elDU&t=37m13s)
- [41:14 test_full_menu_for_olive_garden](https://www.youtube.com/watch?v=9AaElA4elDU&t=41m14s)
- [48:38 I accidentally broke the prior test; fixing it](https://www.youtube.com/watch?v=9AaElA4elDU&t=48m38s)
- [50:02 test_full_menu_price_for_olive_garden](https://www.youtube.com/watch?v=9AaElA4elDU&t=50m02s)
- [53:51 it works! refactoring to use .reduce](https://www.youtube.com/watch?v=9AaElA4elDU&t=53m51s)
- [1:03:00 explaining a gotcha with .reduce](https://www.youtube.com/watch?v=9AaElA4elDU&t=1h03m00s)


-------------------

When you're done, consider taking a look at some of the more advanced refactoring guides:

{% include turing_prework_index.md %}