# walk-through for these code snippets and such

`git clone` https://github.com/josh-works/josh-works.github.io/

`cd` into it, then into `code`. This readme is nested right there.

Write up the initial class:


```ruby
# class Bicycle, p 107
class Bicycle
  attr_reader :size, :tape_color
  
  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end
  
  def spares
    { chain: '10-speed',
      tire_sice: '23',
      tape_color: tape_color
    }
  end
end
```

run the test:

```
ruby test/poodr_ch_6_test.rb
```