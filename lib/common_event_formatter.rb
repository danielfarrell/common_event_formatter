require "logger"
require "json"

class CommonEventFormatter < Logger::Formatter
  VERSION = "0.1.2"

  def call(severity, time, progname, msg)
    create_event({:level => severity, :time => time, :host => hostname, :app => pwd, :pname => (progname || $0), :msg => msg2str(msg)})
  end

  def create_event(hash)
    hash.merge(process_hash).to_json + "\n"
  end

  private
  def pwd
    Dir.pwd.split('/').last
  end

  def process_hash
    {:pid => Process.pid, :ppid => Process.ppid, :uid => Process.uid, :gid => Process.gid}
  end

  def hostname
    ENV["HOSTNAME"] || `hostname`
  end
end
