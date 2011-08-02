require 'switchvox'
class IncomingsController < ApplicationController
  def index
   @incoming = Incoming.all

  end 
#the new method creates a record of the calls in database, queries sugarCRM for records matching the caller's phone number and publishes the data via the messaging server(faye)
  def new
    @incoming = Incoming.create({:exten_number => params[:exten_number], :cid_number => params[:cid_number]})
   begin
     @contact = Sugar.find_by_phone_fax(params[:cid_number]) || Sugar.find_by_phone_mobile(params[:cid_number]) || Sugar.find_by_phone_other(params[:cid_number]) || Sugar.find_by_phone_work(params[:cid_number])
   rescue
     @contact = Sugar.find_by_phone_fax(params[:cid_number]) || Sugar.find_by_phone_mobile(params[:cid_number]) || Sugar.find_by_phone_other(params[:cid_number]) || Sugar.find_by_phone_work(params[:cid_number])
   end

     
      if @incoming.update_attributes(params[:incoming])
       require 'eventmachine'
       #the IP address for the machine hosting the faye messaging server should be passed here
       faye = Faye::Client.new('http://10.10.5.96:9292/faye')
       unless @contact.nil?
         EM.run {
           faye.publish("/incomings", {'exten_id' => "#{@incoming.exten_number}", 'caller_id' =>  "#{@contact.id}", 'caller_name' =>  "#{@contact.account_name}", 'caller_number' => "#{@incoming.cid_number}" })
       }
       else
          EM.run {
            faye.publish("/incomings", {"exten_id" => "#{@incoming.exten_number}", "caller_number" => "#{@incoming.cid_number}", "caller_name" => "no details exists for this user"})
          }
       end

            


      end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incoming }
    end
  end

  def create
    @incoming = Incoming.new(params[:incoming])
  end

  # GET /incomings/1
  # GET /incomings/1.xml

  def call
      Switchvox_call.calling(params[:dial_number])
  end
  

    def update
  end
end
