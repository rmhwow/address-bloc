 require_relative "entry.rb"
 require "csv"
 
 class AddressBook
   attr_accessor :entries

   def initialize
     @entries = []
   end
   
   def add_entry(name, phone, email)
 # #9
     index = 0
     @entries.each do |entry|
 # #10
       if name < entry.name
         break
       end
       index += 1
     end
 # #11
     @entries.insert(index, Entry.new(name, phone, email))
   end

   def remove_entry(name)
     @entries.delete_if {|entry| entry.name == name}
   end

   def import_from_csv(file_name)
         csv_text = File.read(file_name)
     csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
 # #8
     csv.each do |row|
       row_hash = row.to_hash
       add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
     end
   end
   def binary_search(name)
     lower = 0
     upper = entries.length - 1

 # #2
     while lower <= upper
 # #3
       mid = (lower + upper) / 2
       mid_name = entries[mid].name
 
 # #4
       if name == mid_name
         return entries[mid]
       elsif name < mid_name
         upper = mid - 1
       elsif name > mid_name
         lower = mid + 1
       end
     end
     return nil
   end
 end

