### Part V - advanced OOP

class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s
        attr_reader attr_name
        attr_reader attr_name + '_history'
        puts "feo"
        puts attr_name+"_history"
        
        puts @bar
        class_eval %Q{
          def #{attr_name}= (attr_name)
            @attr_name = attr_name
            if (@attr_name==nil)
              @attr_name+'_history'=Array.new
              @attr_name+"_history".push nil
            else
              @attr_name+'_history'.push attr_name  
            end            
          end
          def #{attr_name}
            @attr_name
          end
        }
    end
end