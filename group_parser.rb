# group_parser
# Created by Nate Miller on 2010-02-25.

class GroupParser
  
  attr_reader :groups
  
  def initialize(file)
    @config_file = file
    @groups = {}
    validate_file
    parse
  end
  
  private
  
  def validate_file
    unless File.readable?(@config_file)
      raise Errno::EACCES, "#{@config_file} is not readable" 
    end
  end
  
  def parse
    group = nil
    open(@config_file).each do |line|
      line.strip!
      unless line.match(/^\#.*/)
        if line.match(/\[(.*)\]/)
          group = $1
          @groups["#{group}"] = []
          # TODO: add syntax check, non-commented text should always start with [.*]
        else
          unless line == ''
            @groups["#{group}"] << line
          end
        end
      end
    end
  end
  
end