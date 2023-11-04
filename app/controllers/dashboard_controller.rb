class DashboardController < ApplicationController
    def index
        if current_user.employee?
            # Lógica específica para empleados
            @job_offers = JobOffer.available
            render 'employee_dashboard'
        elsif current_user.employer?
            # Lógica específica para empleadores
            @replacement_requests = current_user.replacement_requests
            render 'employer_dashboard'
        end
    end
end

