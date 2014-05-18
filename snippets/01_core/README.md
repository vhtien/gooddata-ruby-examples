# Core Examples

## [connect.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/connect.rb)

Connect using username and password

### Description

Example how to connect to GoodData platform using username and password

### Running

```
ruby connect.rb
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
ruby connect_env_vars.rb
```

### Output

```
tomaskorcak@kx-mac gooddata-ruby-examples (master) $ ruby snippets/01_core/connect_env_vars.rb
Connecting as svarovsky+gem_tester@gooddata.com
Disconnecting
tomaskorcak@kx-mac gooddata-ruby-examples (master) $
```

## [handling_errors.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/handling_errors.rb)

Handle possible errors

### Description

Example how the possible errors can be catched and handled

### Running

```
ruby handling_errors.rb
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
ruby logging.rb
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
Merge branch 'master' of https://github.com/korczis/gooddata-ruby-examples
D, [2014-05-18T01:45:41.299510 #8035] DEBUG -- : DELETE https://secure.gooddata.com/gdc/account/login/4aaa93a56d61f9f86f077be3f0b761a3
D, [2014-05-18T01:45:41.652872 #8035] DEBUG -- : Response: 204 no content
tomaskorcak@kx-mac gooddata-ruby-examples (master) $
```
