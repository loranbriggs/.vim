### Symlink vimrc

    ln -s ~/.vim/vimrc ~/.vimrc

### Run bundle

Open vim and run:

    :BundleInstall

### Compile Command-T

Compare the output of `ruby -v` and `vim --version | grep ruby` and switch
to the correct version using `rvm` and then from the Command-T dirctory inside `.vim/bundle` execute:

    rake make

Vim should be ready to go!
