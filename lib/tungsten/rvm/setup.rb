require 'byebug'
library :rvm do
  lock '0.1.0'
  metadata :description, 'RVM for Tungsten'

  default :ruby_version, 'latest', 'Ruby version to install by default'

  phase :install do
    rvm_path = '/usr/local/rvm'
    if !test("[ -d #{rvm_path} ]")
      rvm_path = '~/.rvm'
    end
    SSHKit.config.command_map[:rvm] = "#{rvm_path}/bin/rvm"

    begin
      puts capture(:rvm, "version")
      puts capture(:rvm, "current")
      puts "RVM already installed"
    rescue => e
      execute(:gpg, "--keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB") rescue nil
      execute(:curl, "-sSL https://get.rvm.io | bash -s stable --gems=bundler") rescue nil
    end
  end

  phase :setup do
    rvm_path = '/usr/local/rvm'
    if !test("[ -d #{rvm_path} ]")
      rvm_path = '~/.rvm'
    end
    SSHKit.config.command_map[:rvm] = "#{rvm_path}/bin/rvm"

    if args[:ruby_version] === 'latest'
      execute(:rvm, "install ruby --latest --default")
    else
      execute(:rvm, "install #{args[:ruby_version]} --default")
    end
  end

  phase :check do
    rvm_path = '/usr/local/rvm'
    if !test("[ -d #{rvm_path} ]")
      rvm_path = '~/.rvm'
    end
    SSHKit.config.command_map[:rvm] = "#{rvm_path}/bin/rvm"

    begin
      puts capture(:rvm, "version")
      puts capture(:rvm, "current")
      puts "RVM already installed"
    rescue => e
      puts "RVM not installed"
    end
  end

  phase :uninstall do
    rvm_path = '/usr/local/rvm'
    if !test("[ -d #{rvm_path} ]")
      rvm_path = '~/.rvm'
    end
    SSHKit.config.command_map[:rvm] = "#{rvm_path}/bin/rvm"

    execute(:rm, "-rf #{rvm_path}")
  end
end
