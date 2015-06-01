# GoodData Ruby Cookbook

Examples on how to use [gooddata-ruby](https://github.com/gooddata/gooddata-ruby). You can browse the cookbook by chapters, or see the [whole cookbook](http://sdk.gooddata.com/gooddata-ruby-examples/) deployed at sdk microsite.

## Rake commands
### Build the cookbook from source

    rake build

This generates `book.html` with the complete cookbook and a directory for each chapter for easy browsing on github.

### Deploy the cookbook to sdk microsite
You need to have write permissions to gooddata/gooddata-ruby-examples repository to do this.

    rake deploy

This does `rake build` and pushes the new cookbook version to the `gh-pages` branch. The branch contains only one file - `index.html` which is the generated cookbook. We use [jekyll](http://jekyllrb.com/) integrated to github to display the cookbook at url http://sdk.gooddata.com/gooddata-ruby-examples. The ruby cookbook is referenced from the main jekyll repository [gooddata.github.com](https://github.com/gooddata/gooddata.github.com)


## How to contribute

1. Fork it 
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Make whatever changes you want to make in the `book_src` directory
4. Run `rake build` to build the cookbook, check `book.html` if everything is OK
4. Commit your changes (`git commit -am 'Add some recipe'`). Include changes in the generated chapters as well.
5. Push the branch to your fork (`git push origin my-new-feature`)
6. Create a new Pull Request
7. Wait until you see results of your jenkins build in the pull request comments. It should pass successfully.
8. Someone will merge your changes and deploy a new cookbook version.


