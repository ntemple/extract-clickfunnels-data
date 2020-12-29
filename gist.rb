require 'csv'
require 'json'


table = CSV.parse(File.read("CF-All-12-3-2020.csv"), headers: true)

table.each { |row|
    info = row["Additional Info"]
      if (info) then
            oInfo = eval(info) # unsafe, see article notes
                
                puts oInfo.to_json # output hash as JSON
                  end
}        
