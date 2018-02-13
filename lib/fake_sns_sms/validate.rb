require 'phonelib'

module FakeSnsSms
  def self.is_valid_sms?(params)
    self.has_required_params?(params) && self.valid_phone_number?(params[:PhoneNumber])
  end

  def self.has_required_params?(params)
    params[:PhoneNumber] && params[:MessageStructure] && params[:Message]
  end

  def self.valid_phone_number?(pn)
    phone_number = Phonelib.parse(pn)
    phone_number.full_e164 == pn
  end
end
