## Apache Benchmark

`ab -t 60 http://127/0/0/1:3000/`

"apache bench" tool. 

output:

```
> ab -t 60 http://127.0.01:3000/
This is ApacheBench, Version 2.3 <$Revision: 1826891 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.01 (be patient)
Finished 2379 requests


Server Software:        WEBrick/1.3.1
Server Hostname:        127.0.01
Server Port:            3000

Document Path:          /
Document Length:        11464 bytes

Concurrency Level:      1
Time taken for tests:   60.012 seconds
Complete requests:      2379
Failed requests:        0
Total transferred:      29480568 bytes
HTML transferred:       27272856 bytes
Requests per second:    39.64 [#/sec] (mean)
Time per request:       25.226 [ms] (mean)
Time per request:       25.226 [ms] (mean, across all concurrent requests)
Transfer rate:          479.73 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.3      0       6
Processing:    14   25  10.8     23     157
Waiting:       13   25  10.8     23     157
Total:         14   25  10.9     23     157

Percentage of the requests served within a certain time (ms)
  50%     23
  66%     26
  75%     27
  80%     28
  90%     33
  95%     41
  98%     53
  99%     69
 100%    157 (longest request)
```

the percentage chart is cool. 

Figure out how to do this in ThreatSim?

```
ab -c 10 -t 20 http://127.0.01:3000/
```

10 concurrent users

```
> ab -c 10 -t 20 http://127.0.01:3000/
This is ApacheBench, Version 2.3 <$Revision: 1826891 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.01 (be patient)
Finished 772 requests


Server Software:        WEBrick/1.3.1
Server Hostname:        127.0.01
Server Port:            3000

Document Path:          /
Document Length:        11464 bytes

Concurrency Level:      10
Time taken for tests:   20.018 seconds
Complete requests:      772
Failed requests:        190
   (Connect: 0, Receive: 0, Length: 190, Exceptions: 0)
Non-2xx responses:      190
Total transferred:      7429314 bytes
HTML transferred:       6836778 bytes
Requests per second:    38.57 [#/sec] (mean)
Time per request:       259.302 [ms] (mean)
Time per request:       25.930 [ms] (mean, across all concurrent requests)
Transfer rate:          362.43 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.4      0       8
Processing:    34  254  60.1    242     495
Waiting:       33  249  59.7    236     495
Total:         34  254  60.1    242     495

Percentage of the requests served within a certain time (ms)
  50%    242
  66%    267
  75%    283
  80%    294
  90%    334
  95%    369
  98%    422
  99%    463
 100%    495 (longest request)
```

requests per second is important. 

## Siege

Generate a list of paths to hit:

```ruby
File.open("all_gems_urls.txt", "a+") do |file|
  Rubygem.find_each do |gem|
    file.puts "http://localhost:3000/gems/#{gem.name}"
  end
end

```
Run `siege`:

```
siege -c 32 -t 10S -f all_gems_urls.txt
```

If you get a lot of errors like:

```
[error] gzip transfer-encoding requires zlib (1056, 2908, 393216): Socket is already connected
```

The fix is as outlined [here](https://github.com/JoeDog/siege/issues/94):

```
brew uninstall siege
brew install zlib
brew install --build-from-source siege
```

That didn't work, so tried the instructions [farther down the thread](https://github.com/JoeDog/siege/issues/94#issuecomment-455023435)

```
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
brew uninstall siege
brew reinstall zlib
brew install --build-from-source siege
```

I got a warning:
```
macOS has only 16K ports available that won't be released until socket
TIME_WAIT is passed. The default timeout for TIME_WAIT is 15 seconds.
Consider reducing in case of available port bottleneck.
```
but then I could run siege successfully:

![success!](/images/2019-02-04 at 9.58 AM.jpg)


-----------------------------------

# Profiling

### ruby-prof


```
RAILS_ENV=production SECRET_KEY_BASE=fkjdf ruby-prof -m0.5 --mode=cpu --printer=flat_with_line_numbers bin/rails runner "puts 'hello world'"
```

The `printer=flat_with_line_numbers` is quite interesting. This is basically profiling our start-up time, and the output looks like so:

```
Measure Mode: cpu_time
Thread ID: 70152007924060
Fiber ID: 70152012258040
Total: 13.558808
Sort by: self_time

 %self      total      self      wait     child     calls  name
  2.63      0.650     0.357     0.000     0.293    10826   Gem::Version#<=>
    defined at:
      txmt://open?url=file:///Users/joshthompson/.rvm/rubies/ruby-2.3.5/lib/ruby/site_ruby/2.3.0/rubygems/version.rb&line=342

  2.10      0.988     0.284     0.000     0.703     1932   Array#select
    called from:
      Bundler::Definition#converge_rubygems_sources (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/definition.rb&line=645)
      Bundler::Definition#converge_locals (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/definition.rb&line=603)
      Bundler::Definition#specs_for (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/definition.rb&line=234)
      <Module::Bundler::GemHelpers>#select_best_platform_match (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/gem_helpers.rb&line=46)
      Bundler::Index#search_by_dependency (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/bundler-1.17.1/lib/bundler/index.rb&line=188)
      Gem::Specification#runtime_dependencies (txmt://open?url=file:///Users/joshthompson/.rvm/rubies/ruby-2.3.5/lib/ruby/site_ruby/2.3.0/rubygems/specification.rb&line=2408)
      <Class::Thor>#find_command_possibilities (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/thor-0.20.0/lib/thor.rb&line=469)
      Rails::Paths::Path#existent (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/railties-5.2.1/lib/rails/paths.rb&line=209)
      Rails::Initializable::Collection#tsort_each_child (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/railties-5.2.1/lib/rails/initializable.rb&line=49)
      NewRelic::Agent::Configuration::EnvironmentSource#collect_new_relic_environment_variable_keys (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/newrelic_rpm-5.4.0.347/lib/new_relic/agent/configuration/environment_source.rb&line=109)
      <Module::NewRelic::Agent::Instrumentation::Memcache>#supported_methods_for (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/newrelic_rpm-5.4.0.347/lib/new_relic/agent/instrumentation/memcache.rb&line=28)
      Rails::Paths::Path#existent_directories (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/railties-5.2.1/lib/rails/paths.rb&line=220)
      ActiveSupport::FileUpdateChecker#watched (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/activesupport-5.2.1/lib/active_support/file_update_checker.rb&line=102)
      MonitorMixin#mon_synchronize (txmt://open?url=file:///Users/joshthompson/.rvm/rubies/ruby-2.3.5/lib/ruby/2.3.0/monitor.rb&line=211)
      ActionDispatch::Routing::Mapper::Resources#name_for_action (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/actionpack-5.2.1/lib/action_dispatch/routing/mapper.rb&line=1789)

  1.41      0.374     0.191     0.000     0.183   124766  *Hash#[]
    called from:
      ActiveSupport::LazyLoadHooks#run_load_hooks (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/activesupport-5.2.1/lib/active_support/lazy_load_hooks.rb&line=49)
      Concurrent::Collection::NonConcurrentMapBackend#[] (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/concurrent-ruby-1.0.5/lib/concurrent/collection/map/non_concurrent_map_backend.rb&line=19)
      Concurrent::Concern::Dereferenceable#ns_set_deref_options (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/concurrent-ruby-1.0.5/lib/concurrent/concern/dereferenceable.rb&line=54)
      Concurrent::Delay#ns_initialize (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/concurrent-ruby-1.0.5/lib/concurrent/delay.rb&line=158)
      <Class::Thor>#desc (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/thor-0.20.0/lib/thor.rb&line=54)
      <Module::Thor::Base>#register_klass_file (txmt://open?url=file:///Users/joshthompson/.rvm/gems/ruby-2.3.5/gems/thor-0.20.0/lib/thor/base.rb&line=118)
      Kernel#require (txmt://open?url=file:///Users/joshthompson/.rvm/rubies/ruby-2.3.5/lib/ruby/site_ruby/2.3.0/rubygems/core_ext/kernel_require.rb&
```

# ruby-prof

add the `ruby-prof` gem to your `gemfile`, and `bundle`. 

update `config.ru` to add the `use Rack` line:

```ruby
require ::File.expand_path('../config/environment', __FILE__)
use Rack::RubyProf, :path => './tmp/profile'
run Gemcutter::Application
```

go check out `/tmp/profile`


-------------------------

# 06/24/19 RailsSpeed Workshop, Hyatt Denver



```ruby
# config/environments/development.rb

config.cache_classes = true
config.eager_load = true
config.public_file_server.enabled = true # 5.0 or more
config.serve_static_files = true # 4.2 or less
config.assets.compile = false
config.assets.digest = true
config.active_record.migration_error = false
```

Get big staging DB:

```shell
aws s3 cp s3://ts-staging-data/staging.sql.zip ~/Downloads
```

or SQLpro connect to `prodfeature` and export the entire DB (tables & data), import locally.

Find the account with the most target_email_addresses (for data)

```sql
SELECT count(*), accounts.id AS accounts_id, targets.*
FROM targets
INNER JOIN target_email_addresses tea ON tea.id = targets.target_email_address_id
INNER JOIN accounts ON accounts.id = tea.account_id
GROUP BY accounts.id
ORDER BY count(*) DESC
```


or, find the campaign_targets with the most activity:

```sql

```


## Commit changes in branch

Set ENV["PROFILE"]

```shell
rails s PROFILE=true 
```

```ruby
config.cache_classes = !!ENV["PROFILE"] # true
config.cache_classes = !ENV["PROFILE"] # false
```


## wrk

1 thread, 1 connection 

`wrk` cannot handle login/auth?

## ab

```
$ ab -t 10 http://127.0.0.1:3000/
```
results:

```
Benchmarking 127.0.0.1 (be patient)
Finished 690 requests


Server Software:
Server Hostname:        127.0.0.1
Server Port:            3000

Document Path:          /
Document Length:        101 bytes

Concurrency Level:      1
Time taken for tests:   10.007 seconds
Complete requests:      690
Failed requests:        0
Non-2xx responses:      690
Total transferred:      1380000 bytes
HTML transferred:       69690 bytes
Requests per second:    68.95 [#/sec] (mean)
Time per request:       14.503 [ms] (mean)
Time per request:       14.503 [ms] (mean, across all concurrent requests)
Transfer rate:          134.67 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       1
Processing:     8   14   6.3     12      49
Waiting:        8   14   6.2     12      48
Total:          8   14   6.3     13      49

Percentage of the requests served within a certain time (ms)
  50%     13
  66%     14
  75%     17
  80%     18
  90%     22
  95%     28
  98%     33
  99%     39
 100%     49 (longest request)
```

But I don't wanna profile what is basically our `http://localhost:3000/users/sign_in` page; I want the page _once a user has signed in_. How to stub this out?

https://work.stevegrossi.com/2015/02/07/load-testing-rails-apps-with-apache-bench-siege-and-jmeter/

https://makandracards.com/makandra/13757-using-apache-benchmark-ab-on-sites-with-authentication

I think this worked:

```shell
$ ab -t 1 -C '_ts_session_id=1374f9708600d2204e45cdc0bf56bbde;fd827a2c5655094bcce3748d6ee6d3e4=ImRhMDY1YjdjYjMwNGNjNWUxNzFkNDhjOGQ0YzA0OTIwIg%3D%3D--98c228cb35af1a269ee894c22540b81848e2ed09' http://127.0.0.1:3000/account/campaigns
```
Cookies retrieved per the above URL cookie retrieval:

![getting login](https://cl.ly/680352fa5a6b/2019-06-25%20at%207.51%20AM.jpg)

Validated, because `tail -f logs/development.log` prints lots of user details for the user corresponding to this cookie:

![user details](https://cl.ly/0a0b5c0afb1b/2019-06-25%20at%207.52%20AM.jpg)

You can validate that this cookies approach is working in the above logs, and also in Postman:

![postman cookies tab](https://cl.ly/092f8b6923a0/2019-06-25%20at%207.58%20AM.jpg)

![valid postman cookies](https://cl.ly/2ee7faffcffb/2019-06-25%20at%207.58%20AM.jpg)

And, if everything works, you can now make a `GET` to a resource that would normally return a login page!

![boom](https://cl.ly/b6ad5b3aba98/2019-06-25%20at%208.02%20AM.jpg)

Lastly, here's the output from AB with cookie auth, against `account/campaigns`:

```
> ab -t 10 -C '_ts_session_id=1374f9708600d2204e45cdc0bf56bbde;fd827a2c5655094bcce3748d6ee6d3e4=ImRhMDY1YjdjYjMwNGNjNWUxNzFkNDhjOGQ0YzA0OTIwIg%3D%3D--98c228cb35af1a269ee894c22540b81848e2ed09' http://127.0.0.1:3000/account/campaigns
This is ApacheBench, Version 2.3 <$Revision: 1826891 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient)
Finished 72 requests


Server Software:
Server Hostname:        127.0.0.1
Server Port:            3000

Document Path:          /account/campaigns
Document Length:        25391 bytes

Concurrency Level:      1
Time taken for tests:   10.062 seconds
Complete requests:      72
Failed requests:        40
   (Connect: 0, Receive: 0, Length: 40, Exceptions: 0)
Total transferred:      2013470 bytes
HTML transferred:       1828110 bytes
Requests per second:    7.16 [#/sec] (mean)
Time per request:       139.750 [ms] (mean)
Time per request:       139.750 [ms] (mean, across all concurrent requests)
Transfer rate:          195.42 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:    92  140 118.5    125    1127
Waiting:       92  140 118.5    125    1127
Total:         92  140 118.5    125    1127

Percentage of the requests served within a certain time (ms)
  50%    125
  66%    128
  75%    131
  80%    131
  90%    139
  95%    150
  98%    175
  99%   1127
 100%   1127 (longest request)
```

More from Postman: https://learning.getpostman.com/docs/postman/sending_api_requests/cookies/

## Benchmark: new codepath

```ruby
# benchmarks/my_benchmark.rb
local = User.first

class User < ActiveRecord::Base
  def name_faster
    sleep 1.2
    output = ""
    output << self.first_name.to_s.force_encoding("UTF-8") + " " if self.first_name
    output << self.last_name.to_s.force_encoding("UTF-8") + "" if self.last_name
    output.strip
  end
end


Benchmark.ips do |x|
  x.report ("master")          { local.name }
  x.report ("slower")          {local.name_faster}
  
  x.compare!
end
```

```shell
$ rails runner benchmarks/my_benchmark.rb
```

m
```ruby

campaign = Campaign.first

Benchmark.ips do |x|
  x.report ("v1")          { 
    Threatsim::Campaigns::GeographyDetails.new(campaign).geo_details
   }
  x.report ("v2")          { 
    Threatsim::Campaigns::GeographyDetails.new(campaign).v2_geo_details
   }
  
  x.compare!
end
```

results:

```shell
> rails runner benchmarks/my_benchmark.rb
Running via Spring preloader in process 84945
Warming up --------------------------------------
                  v1     3.000  i/100ms
                  v2    27.000  i/100ms
Calculating -------------------------------------
                  v1     83.879  (± 6.0%) i/s -    420.000  in   5.029952s
                  v2    278.119  (± 7.6%) i/s -      1.404k in   5.081285s

Comparison:
                  v2:      278.1 i/s
                  v1:       83.9 i/s - 3.32x  slower
```

# Prod-like data

Running the app in `development` slows 💩 down, big-time, by adding big-time overhead; it's possible you'll miss big gains in performance when you make improvements, if running in development mode. 



### Dump prod

(meh)

### Dump prod, over-write columns w/anonymized data

post results to s3 bucket, where everyone has access to that export

### Multi-tenant app

Get a single tenant (this is what we've done at Wombat; export heavy-used dev account)

### Have a good seed file

Most difficult, most maintenance


## Provisioning/servers (how many do I need)

M/M/C queue

One queue, many servers. 


# Profiling CPU

All profiling is a tradeoff. It's expensive to profile. 

Find hot-spots in code.

Make observactions -> make hypotheses -> develop predictions -> gather data to test predictions.

Watching instructions:

```shell
> ruby -e 'puts 1 + 1' --dump=insns
== disasm: #<ISeq:<main>@-e>============================================
0000 trace            1                                               (   1)
0002 putself
0003 putobject_OP_INT2FIX_O_1_C_
0004 putobject_OP_INT2FIX_O_1_C_
0005 opt_plus         <callinfo!mid:+, argc:1, ARGS_SIMPLE>, <callcache>
0008 opt_send_without_block <callinfo!mid:puts, argc:1, FCALL|ARGS_SIMPLE>, <callcache>
0011 leave
```


# Rack mini profiler

https://github.com/ruby-prof/ruby-prof

```ruby
# config.ru
use Rack::RubyProf, :path => './tmp/profile'
```
start server, check `tmp/profile`

```
$ open tmp/profile/backend-home-call_stack.html
```

Is this true?

![timezone](https://cl.ly/4e107544ac52/2019-06-24%20at%202.30%20PM.jpg)


If this is true, then we should but some benchmarking around this code?

```ruby
# app/controllers/application_controller.rb:54

def user_time_zone(&block)
  Time.use_zone(current_user.time_zone, &block)
end
```


Next big slow-down:

![eaching?](https://cl.ly/43f9bb1ebfbb/2019-06-24%20at%202.34%20PM.jpg)

```ruby
# app/controllers/account/campaigns_controller.rb:228
def load_clone_or_draft
  loader = ::Threatsim::Campaigns::Loader.new(permitted_params, current_user)
  @cloned_from_id = loader.cloned_from_id
  @campaign = loader.campaign
  @campaign.decorate
  @campaign_missing = loader.missing
  @campaign_template_language = loader.language
  load_training_types
  load_campaign_scheduler
end
```


# Memory Issues

```
$ pry
main:0> ObjectSpace.count_objects
=> => {:TOTAL=>181787,
 :FREE=>514,
 :T_OBJECT=>6785,
 :T_CLASS=>2405,
 :T_MODULE=>190,
 :T_FLOAT=>9,
 :T_STRING=>119596,
 :T_REGEXP=>917,
 :T_ARRAY=>20580,
 :T_HASH=>1467,
 :T_STRUCT=>320,
 :T_BIGNUM=>2,
 :T_FILE=>18,
 :T_DATA=>1716,
 :T_MATCH=>22,
 :T_COMPLEX=>1,
 :T_RATIONAL=>1,
 :T_SYMBOL=>153,
 :T_IMEMO=>22003,
 :T_NODE=>4718,
 :T_ICLASS=>370}
 
 main:0> GC.start
=> nil
main:0> GC
=> GC
main:0> GC.disable
=> false
main:0> GC.enable
=> true
```


## Allocated objects

`pp=profile-memory`


total allocated = x
total retained = x

retained objects survived GC 

allocated memory from all over the place. 