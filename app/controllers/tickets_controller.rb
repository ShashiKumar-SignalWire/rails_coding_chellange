require 'net/http'
class TicketsController < ApplicationController
    def create
         response ={}
         status_code=422
        if(params[:user_id].nil?)
            response[:success] = false 
            response[:message] = "Please provide user_id param"
        elsif(params[:title].nil? || params[:title].empty?)
            response[:success] = false 
            response[:message] = "Please provide title param"
        elsif (params[:tags].nil? || params[:tags].length > 5 )
            response[:success] = false 
            response[:message] = "We accept upto 5 tags in a request"
        else
            @ticket = Ticket.new(:user_id => params[:user_id], :title => params[:title])
            if @ticket.save
                begin
                    params[:tags].each do |c_tag|
                        @ticket.tag.create(:tag=> c_tag)
                    end
                    @tags =Tag.all.group(:tag).order("1 desc").count.first
                    response[:success] = true
                    response[:message] ="Ticket created"
                    if @tags.length > 0
                        puts @tags
                        uri = URI('https://webhook.site/0618378d-b6ea-4d4c-a892-0140153dd8b1')
                        res = Net::HTTP.post_form(uri, 'tag_name' => @tags[0],'count' => @tags[1])
                        puts res.body
                    end
                    status_code=200
                rescue => e
                    puts e
                    response[:success] = false 
                    response[:message] = "Something went worng please try again after sometime"
                    status_code=500
                end
                
            else
                response[:success] = false 
                response[:message] = "Something went worng please try again after sometime"
                status_code=500
            end
        end
        render json: response,:status => status_code
    end

end
