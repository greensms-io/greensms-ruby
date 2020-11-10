describe GreensmsRuby::Sms do
  it "Sends a SMS" do
    expect(GreensmsRuby::Sms.send_message({ user: "user", pass: "pass", to: "98765432102", txt: "This is my test message." }).code).to eql("200")
  end

  it "Check SMS status" do
    expect(GreensmsRuby::Sms.check_status({ user: "user", pass: "pass", id: "request_id here" }).code).to eql("200")
  end

  it "Sends a Viber SMS" do
    expect(GreensmsRuby::Viber.send_message({ user: "user", pass: "pass", to: "98765432102", txt: "This is my test message." }).code).to eql("200")
  end

  it "Check viber message status" do
    expect(GreensmsRuby::Viber.check_status({ user: "user", pass: "pass", id: "request_id here" }).code).to eql("200")
  end

  it "Make call" do
    expect(GreensmsRuby::Call.send_verification({ user: "user", pass: "pass", to: "98721079932" }).code).to eql("200")
  end

  it "Check call status" do
    expect(GreensmsRuby::Call.check_status({ user: "user", pass: "pass", id: "request_id here", to: "98721079932" }).code).to eql("200")
  end

  it "Make a payment" do
    expect(GreensmsRuby::Pay.payment({ user: "user", pass: "pass", to: "98721079932", amount: "999" }).code).to eql("200")
  end

  it "Check Payment status" do
    expect(GreensmsRuby::Pay.check_status({ user: "user", pass: "pass", id: "request_id here", to: "98721079932" }).code).to eql("200")
  end

  it "Send HLR message" do
    expect(GreensmsRuby::Hlr.send_message({ user: "user", pass: "pass", to: "98721079932" }).code).to eql("200")
  end

  it "Send HLR message" do
    expect(GreensmsRuby::Hlr.check_status({ user: "user", pass: "pass", to: "98721079932", id: "request_id here" }).code).to eql("200")
  end
  
  it "Send Voice message" do
    expect(GreensmsRuby::Voice.send_message({ lang: "en", user: "user", pass: "pass", to: "98721079932", text: "Test message" }).code).to eql("200")
  end

  it "Send Voice message" do
    expect(GreensmsRuby::Voice.check_status({ user: "user", pass: "pass", id: "request_id here" }).code).to eql("200")
  end

  it "Check balance" do
    expect(GreensmsRuby::Account.balance_check({ pass: "pass", user: "user" }).code).to eql("200")
  end

  it "Send Voice message" do
    expect(GreensmsRuby::Account.tariff_details({ user: "user", pass: "pass" }).code).to eql("200")
  end

  it "Send Voice message" do
    expect(GreensmsRuby::Account.get_access_token({ user: "user", pass: "pass" }).code).to eql("200")
  end

  it "Get number info" do
    expect(GreensmsRuby::Additional.number_info({ user: "user", pass: "pass" }).code).to eql("200")
  end

  it "Check server status" do
    expect(GreensmsRuby::Additional.server_status.code).to eql("200")
  end
end