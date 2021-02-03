class UsersController < ApplicationController

    def create
        emailCheck = User.find_by(email: params[:email])
        if emailCheck.present?
            render json: {status: 400, message: "Email is exits"}, status: 400
        else
            user = User.new
            user.first_name = params[:first_name]
            user.last_name = params[:last_name]
            user.email = params[:email]
            user.password = params[:password]
            if user.save
                render json: {status: 200, message: "success"}, status: 200
            else
                render json: {status: 400, message: "Email format is wrong"}, status: 400
            end
        end
    end

    def login
        emailCheck = User.find_by(email: params[:email])

        if emailCheck.present?
            if emailCheck.password === params[:password]
                render json: {token: "token 123", data: emailCheck}, status: 200
            else
                render json: {message: "Email or Password is invalid"}, status: 400
            end
        else
            render json: {message: "Email or Password is invalid"}, status: 400
        end
    end
end
