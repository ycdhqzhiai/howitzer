require 'spec_helper'
require "#{lib_path}/howitzer/utils/email"
require "#{lib_path}/howitzer/utils/log"

describe Email do
  let(:recipient){ 'first_tester@gmail.com' }
  let(:message) do
    {
        'body-plain' => 'test body footer',
        'stripped-html' => "<p> test body </p> <p> footer </p>",
        'stripped-text' => 'test body',
        'From' => "Strong Tester <tester@gmail.com>",
        'To' => recipient,
        'Received' => "by 10.216.46.75 with HTTP; Sat, 5 Apr 2014 05:10:42 -0700 (PDT)",
        'sender' => 'tester@gmail.com',
        'attachments' => []
    }
  end
  let(:message_subject){ 'test subject' }
  let(:mail_address){ double }
  let(:email_object){ Email.new(message) }
  before do
    stub_const('Email::SUBJECT', message_subject)
    allow(settings).to receive(:mailgun_key)
    allow(settings).to receive(:mailgun_domain)
  end

  describe '#new' do
    context 'when Email instance receive message and add create @message variable that' do
      it { expect(email_object.instance_variable_get(:@message)).to eql message}
    end
  end

  describe '.find_by_recipient' do
  end

  describe '.find' do
  end

  describe '#plain_text_body' do
    it { expect(email_object.plain_text_body).to eql message['body-plain'] }
  end
  
  describe '#html_body' do
    it { expect(email_object.html_body).to eql message['stripped-html'] }
  end

  describe '#text' do
    it { expect(email_object.text).to eql message['stripped-text'] }
  end

  describe '#mail_from' do
    it { expect(email_object.mail_from).to eql message['From'] }
  end

  describe '#recipients' do
    subject { email_object.recipients }
    it { expect(subject).to be_a_kind_of Array }

    context 'when one recipient' do
      it { expect(subject).to include message['To']}
    end

    context 'when more than one recipient' do
      let(:second_recipient) { "second_tester@gmail.com" }
      let(:message_with_multiple_recipients) { message.merge({'To' => "#{recipient}, #{second_recipient}"}) }
      let(:email_object) { Email.new(message_with_multiple_recipients) }
      it { expect(subject).to eql [recipient, second_recipient] }
    end
  end
  
  describe '#received_time' do
    it { expect(email_object.received_time).to eql message['Received'][27..63] }
  end
  
  describe '#sender_email' do
    it { expect(email_object.sender_email).to eql message['sender'] }
  end

  describe '#get_mime_part' do
    subject { email_object.get_mime_part }

    context 'when has attachments' do
    end

    context 'when no attachments' do
      let(:error) { Email::NoAttachments }
      let(:error_message) { 'No attachments where found.' }
      it do
        expect(log).to receive(:error).with(error, error_message).once
        subject
      end
    end
  end
end