require 'faye'
require 'eventmachine'
require 'switchvox'
class ExterncallController < ApplicationController
    #this method handles the outbound call sent via ajax request
   def new
    @externcall = Externcall.create({:a => params[:a], :b => params[:b]})
    if @externcall.update_attributes(params[:externcall])
     Switchvox_call.calling(@externcall.a, @externcall.b)
    end
  end
end
