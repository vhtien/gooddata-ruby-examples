# Core Examples

## [connect.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/connect.rb)

Connect using username and password

### Description

Example how to connect to GoodData platform using username and password

### Running

```
bundle exec ruby connect.rb
```

### Output

```
tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby snippets/01_core/connect.rb
Connecting as svarovsky+gem_tester@gooddata.com
Disconnecting
tomaskorcak@kx-mac gooddata-ruby-examples (master) $
```

## [connect_env_vars.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/connect_env_vars.rb)

Connect using username and password from environment variables

### Description

Example how to connect to GoodData platform using username and password loaded from environment variables

### Running

```
bundle exec ruby connect_env_vars.rb
```

### Output

```
tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby snippets/01_core/connect_env_vars.rb
Connecting as svarovsky+gem_tester@gooddata.com
Disconnecting
tomaskorcak@kx-mac gooddata-ruby-examples (master) $
```

## [current_user.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/current_user.rb)

Access current user

### Description

Example how to access current user.

### Running

```
bundle exec ruby current_user.rb
```

### Output

```
Connecting as svarovsky+gem_tester@gooddata.com ...
#<GoodData::AccountSettings:0x007fd051c8ace8
 @json=
  {"accountSetting"=>
    {"country"=>nil,
     "firstName"=>"Gem",
     "ssoProvider"=>nil,
     "timezone"=>nil,
     "position"=>nil,
     "authenticationModes"=>[],
     "companyName"=>"GoodData",
     "login"=>"svarovsky+gem_tester@gooddata.com",
     "email"=>"svarovsky+gem_tester@gooddata.com",
     "created"=>"2014-02-20 21:30:30",
     "updated"=>"2014-05-18 10:05:08",
     "lastName"=>"Testing user",
     "phoneNumber"=>"12345",
     "links"=>
      {"self"=>"/gdc/account/profile/4aaa93a56d61f9f86f077be3f0b761a3",
       "projects"=>
        "/gdc/account/profile/4aaa93a56d61f9f86f077be3f0b761a3/projects"}}}>
Disconnecting ...
```

## [handling_errors.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/handling_errors.rb)

Handle possible errors

### Description

Example how the possible errors can be catched and handled

### Running

```
bundle exec ruby handling_errors.rb
```

### Output

```
tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby snippets/01_core/handling_errors.rb
Connecting as svarovsky+gem_tester@gooddata.com
ERROR:
401 Unauthorized: {"parameters":[],"component":"Account::Login::AuthShare","message":"Bad Login or Password!"}
Disconnecting
tomaskorcak@kx-mac gooddata-ruby-examples (master) $
```

## [logging.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/logging.rb)

Verbose logging output.

### Description

Example how to turn on verbose logging output

### Running

```
bundle exec ruby logging.rb
```

### Output

```
tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby snippets/01_core/logging.rb
Connecting as svarovsky+gem_tester@gooddata.com ...
D, [2014-05-18T01:45:39.554043 #8035] DEBUG -- : GoodData#connect
I, [2014-05-18T01:45:39.554182 #8035]  INFO -- : Connecting to GoodData...
D, [2014-05-18T01:45:39.554226 #8035] DEBUG -- : Logging in...
D, [2014-05-18T01:45:39.554379 #8035] DEBUG -- : POST https://secure.gooddata.com/gdc/account/login, payload: {"postUserLogin"=>{"login"=>"*********************************", "password"=>"**********", "remember"=>1}}
D, [2014-05-18T01:45:40.174723 #8035] DEBUG -- : Response: {"userLogin"=>{"profile"=>"/gdc/account/profile/4aaa93a56d61f9f86f077be3f0b761a3", "state"=>"/gdc/account/login/4aaa93a56d61f9f86f077be3f0b761a3"}}
D, [2014-05-18T01:45:40.174795 #8035] DEBUG -- : Getting authentication token...
D, [2014-05-18T01:45:40.174822 #8035] DEBUG -- : GET https://secure.gooddata.com/gdc/account/token
D, [2014-05-18T01:45:40.476549 #8035] DEBUG -- : Response: {}
D, [2014-05-18T01:45:40.476671 #8035] DEBUG -- : GET https://secure.gooddata.com/gdc/account/profile/4aaa93a56d61f9f86f077be3f0b761a3

....

Disconnecting ...
D, [2014-05-18T01:45:41.299421 #8035] DEBUG -- : GoodData#disconnect
D, [2014-05-18T01:45:41.299510 #8035] DEBUG -- : DELETE https://secure.gooddata.com/gdc/account/login/4aaa93a56d61f9f86f077be3f0b761a3
D, [2014-05-18T01:45:41.652872 #8035] DEBUG -- : Response: 204 no content
tomaskorcak@kx-mac gooddata-ruby-examples (master) $
```

## [version.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/version.rb)

Show GoodData Ruby gem version.

### Description

Example how to show version of GoodData Ruby gem version used

### Running

```
bundle exec ruby version.rb
```

### Output

```
tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby version.rb
GoodData.verion = '0.6.2'
tomaskorcak@kx-mac gooddata-ruby-examples (master) $
```
