require 'logger'

class LoggerFactory
  def self.build
    logger = Logger.new(STDOUT)
    if ENV['LOG_LEVEL'] && ENV['LOG_LEVEL'].downcase == 'debug'
      logger.level = Logger::DEBUG
    else
      logger.level = Logger::INFO
    end
    logger.formatter = proc do |severity, datetime, progname, msg|
      "[#{severity}]: #{msg}\n"
    end
    return logger
  end
end
