require 'phonelib'

module FakeSnsSms
  def self.is_valid_sms?(params)
    return false unless self.has_required_params(params)
    return false unless self.valid_phone_number?(params[:PhoneNumber])
    return true
  end

  def self.has_required_params(params)
    return false unless params[:PhoneNumber] && params[:MessageStructure] && params[:Message]
    return true
  end

  def self.valid_phone_number?(pn)
    phone_number = Phonelib.parse(pn)
    p phone_number.full_e164
    p pn
    return false unless phone_number.full_e164 == pn
    return true
  end
end