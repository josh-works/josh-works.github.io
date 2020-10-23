---
layout: post
title:  "Refactoring practice: Get rid of `attr_accessors` in `ogre.rb` in 2 minutes"
description: "Refactor practice, in which we will refactor ogre.rb, learn more about Ruby, object-oriented design, and clean code"
crosspost_to_medium: false
date:  2020-01-27 06:00:00 -0700
categories: [programming]
tags: [mythical_creatures, refactoring, ruby, turing]
permalink: mythical-creature-refactor-ogre
image: /images_2020/turing-prep-series-cover.jpg
---

{% include turing_prework_index.md %}

More refactoring practice! 

I was reading [Practical Object Oriented Design in Ruby](https://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330), and then was looking at a Turing student's work on the [`ogre` mythical creature](https://github.com/turingschool/ruby-exercises/blob/master/mythical-creatures/test/ogre_test.rb) when I realized this was a perfect chance to explain a little about some principles of Object-Oriented Design.

Here's a quick **TWO MINUTE** walk-through:

<div class="container">
<iframe class="video" src="https://www.youtube.com/embed/Z_e7p8cDF1Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<!--more-->

Here's the code we're starting with:

```rb
class Ogre
  attr_reader :name, :home, :swings, :encounter_counter
  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @swings = 0
    @encounter_counter = 0
  end
  
  def encounter(human)
    @encounter_counter += 1
    human.encounter_counter += 1
    if human.notices_ogre?
      swing_at(human)
    end
  end
  
  def swing_at(human)
    @swings += 1
  end
  
  def apologize(human)
    human.encounter_counter = 0
    @swings = 0
  end
end

class Human
  attr_accessor :encounter_counter
  attr_reader :name
  def initialize(name = "Jane")
    @name = name
    @encounter_counter = 0
  end
  
  def notices_ogre?
    return @encounter_counter % 3 == 0
  end
  
  def knocked_out?
    return true if encounter_counter >= 3
    false
  end
end
```

All tests pass.

I made changes to any time the `Ogre` class changed the "internal state" of another object (aka the `Human` class)

Copy-paste the code into your editor, and make the changes yourself!


The finished refactored version:

_update: 👏 to [Gaby Mendez](https://github.com/gabichuelas) for catching an error I made in the refactored code!_

```ruby
class Ogre
  attr_reader :name, :home, :swings, :encounter_counter
  def initialize(name, home = "Swamp")
    @name = name
    @home = home
    @swings = 0
    @encounter_counter = 0
  end
  
  def encounter(human)
    @encounter_counter += 1
    human.increment_encounters
    if human.notices_ogre?
      swing_at(human)
    end
  end
  
  def swing_at(human)
    @swings += 1
    # Gaby pointed out that the human needed to actually get knocked unconscious
    # at a certain point. Duh! I added this line in response:
    human.knock_unconscious if swings % 2 == 0
  end
  
  def apologize(human)
    # Gaby pointed out an error, so in fixing it I am deviating from the 
    # finished code in the video walkthrough. 
    human.revive
    @swings = 0
  end
end

class Human
  attr_reader :name, :encounter_counter, :knocked_out
  def initialize(name = "Jane")
    @name = name
    @encounter_counter = 0
    @knocked_out = false
  end
  
  def increment_encounters
    @encounter_counter += 1
  end
  
  def revive
    @encounter_counter = 0
    @knocked_out = false
  end
  
  def knock_unconscious
    @knocked_out = true
  end
  
  def notices_ogre?
    encounter_counter % 3 == 0
  end
  
  def knocked_out?
    # updated this a bit too. Sorry for the confusion!!!!!
    knocked_out
  end
end
```

{% include turing_prework_index.md %}

