require 'csv'
require 'json'

table = CSV.parse(File.read("data.csv"), headers: true)


headers = Hash.new

table.headers.each { |header|
        headers[header] = '';
}

table.each { |row|

  info = row["Additional Info"]
  if (info) then 
      oInfo = eval(info)
      oInfo.each { |tuple|
     
        colname = "_" + tuple[0].to_s;

        if tuple[1].class == Hash then
#         tuple[1].each { |kvp|
#           header = colname + "." + kvp[0]
#           row[header] = kvp[1]  
#           headers[header] = '';
#        }       
        else
          row[colname] = tuple[1]
          headers[colname] = '';
        end  
      }
  end 
}

newTable = CSV::Table.new([])
table.each { |row|
  newTable << CSV::Row.new(headers.keys, row.fields)
}




newTable.delete("Additional Info")
print newTable 



