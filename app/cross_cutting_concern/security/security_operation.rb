module Security
    module SecurityOperation
    
        def check_user_roles(roles)
            if  roles.kind_of?(Array)
                #["superadmin"] => roles
              @user_roles =  UserRole.where(user: current_user)
              @user_roles.each do |i|
                if roles.include? i.role.name
                    return;
                end
              end
    
            else
                raise Exception.new "You must give an array paramater"
            end
            render json: {message: "You have no auth...."},status: 401
        end
    
    end
end
