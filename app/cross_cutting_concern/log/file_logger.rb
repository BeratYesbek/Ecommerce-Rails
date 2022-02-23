
module Log 
    module FileLogger
        require 'json'
        def log_file
            logger = Logger.new("log/log_#{controller_name}.log")
            log = {
                parameters: params,
                current_user: current_user,
                date_time: DateTime.now,
                method: action_name,
                controller: controller_name,
                remote_ip: request.remote_ip,
                ip: request.ip,
                request: request.original_url,
                request_fullpath: request.fullpath
            }
    
            logger.info(log.to_json)
        end

        def log_error_to_file(exception)
            logger = Logger.new("log/log_error_#{controller_name}.log")
            log = {
                parameters: params,
                current_user: current_user,
                date_time: DateTime.now,
                method: action_name,
                controller: controller_name,
                remote_ip: request.remote_ip,
                ip: request.ip,
                request: request.original_url,
                request_fullpath: request.fullpath,
                exception: exception.message,
                exception_detail: exception.backtrace
            }
    
            logger.error(log.to_json)
        end
    end
end
