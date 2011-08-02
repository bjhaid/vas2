require 'switchvox'
  class Switchvox_hangup
    def hang(
      switchvox = Switchvox::Base.new("10.10.20.240", 'admin', 'Passw0rd'    , {:debug     => true})
      hangup = switchvox.request("switchvox.currentCalls.hangUp", {
      "current_call_id" => switchvox
    })
       hangup.calls.call
    end
  end

