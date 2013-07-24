class Dorder
  include Mongoid::Document
  include Mongoid::Timestamps

  
  field :applicant
  field :tel
  field :usetime
  field :usereason
  field :device_name
  field :opinion 
  field :returntime
  field :situation
  field :keeper 
  field :device_id
end
