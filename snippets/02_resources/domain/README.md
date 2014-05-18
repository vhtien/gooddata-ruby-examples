# Domain

## [domain_users.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/02_resources/domain/domain_users.rb)

### Description

Lists domain users.

### Running

```
ruby send_invitation.rb
```

### Output

```
Connecting as svarovsky+gem_tester@gooddata.com ...
[#<GoodData::AccountSettings:0x007fb4a206f5c8
  @json=
   {"accountSetting"=>
     {"companyName"=>"GoodData",
      "country"=>nil,
      "created"=>"2014-02-20 21:30:30",
      "firstName"=>"Gem",
      "lastName"=>"Testing user",
      "login"=>"svarovsky+gem_tester@gooddata.com",
      "phoneNumber"=>"12345",
      "position"=>nil,
      "timezone"=>nil,
      "updated"=>"2014-05-18 10:05:08",
      "links"=>
       {"projects"=>
         "/gdc/account/profile/4aaa93a56d61f9f86f077be3f0b761a3/projects",
        "self"=>"/gdc/account/profile/4aaa93a56d61f9f86f077be3f0b761a3"},
      "email"=>"svarovsky+gem_tester@gooddata.com",
      "authenticationModes"=>[]}}>
]
Disconnecting ...
```