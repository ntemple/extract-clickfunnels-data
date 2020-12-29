require 'csv'

class UploadsController < ApplicationController
  def create
    puts "Hello World"
    f = params['csv']
    table = CSV.parse(f.read(), headers: true)
  
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

    render(body: newTable, content_type: "text/csv", content_disposition: "attachment; filename=\"export.csv\"");
  end
end


