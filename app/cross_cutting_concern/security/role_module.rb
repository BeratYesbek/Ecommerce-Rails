
module Security
    module RoleModule
        @@admin = "admin"
        @@superadmin = "superadmin"
        @@user = "user"
        @@student = "student"
        @@human_resources = "humanresources"
    
        def self.all_roles
            [@@admin,@@superadmin,@@student,@@user,@@human_resources]
        end
    
        def self.only_human_resources
            [@@human_resources]
        end
    
        def self.only_admin_and_superadmin
            [@@admin,@@superadmin]
        end
    
        def self.super_admin
            [@@superadmin]
        end
    end
end
