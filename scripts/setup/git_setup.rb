# Setup git on your machine!
class GitSetup
  VERSION = 1.0
  SILENT_CONFIG = [
    %w(global core.excludesfile "~/.gitignore"),
    %w(global core.editor "vim")
  ]

  # Run setup
  def initialize
    setup
  end

  # Set Git name
  def name
    prompt('Enter your name') do |name|
      git_config :global, 'user.name', quoted(name)
    end
  end

  # Set Git email
  def email
    prompt('Enter your email') do |email|
      git_config :global, 'user.email', quoted(email)
    end
  end

  private

  # Perform setup steps
  def setup
    puts "Git setup v#{VERSION}"
    puts
    SILENT_CONFIG.each do |level, conf, value|
      git_config level, conf, value
    end
    public_methods(false).each do |method|
      send method
    end
    puts
    puts 'Setup completed!'
  end

  # Prompt for user input
  def prompt(*args)
    print(*args, ': ')
    input = (gets || '').chomp
    yield input if block_given?
  end

  # Quotes a string
  def quoted(str)
    '"' << str.to_s << '"'
  end

  # Runs git shell command
  def git(*args)
    puts 'Command error' unless system 'git ' << args.join(' ')
  end

  # Runs git config shell command
  def git_config(level, *args)
    git "config --#{level}", *args
  end
end

GitSetup.new
