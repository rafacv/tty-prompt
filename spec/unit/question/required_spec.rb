# encoding: utf-8

require 'spec_helper'

RSpec.describe TTY::Prompt::Question, '#required' do
  it 'requires value to be present with helper' do
    prompt = TTY::TestPrompt.new
    prompt.input << ''
    prompt.input.rewind
    expect {
      prompt.ask('What is your name?') { |q| q.required(true) }
    }.to raise_error(ArgumentError)
  end

  it 'requires value to be present with option' do
    prompt = TTY::TestPrompt.new
    prompt.input << ''
    prompt.input.rewind
    expect {
      prompt.ask('What is your name?', required: true)
    }.to raise_error(ArgumentError)
  end

  it "doesn't require value to be present" do
    prompt = TTY::TestPrompt.new
    prompt.input << ''
    prompt.input.rewind
    answer = prompt.ask('What is your name?') { |q| q.required(false) }
    expect(answer).to be_nil
  end
end