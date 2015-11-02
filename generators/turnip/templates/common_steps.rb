module Turnip
  # Description of common turnip steps
  module Steps
    # PUT GLOBAL STEPS HERE
  end
end

# Description of example turnip steps
module MonsterSteps
  attr_accessor :monster

  step 'there is a monster' do
    self.monster = 1
  end

  step 'I attack it' do
    self.monster -= 1
  end

  step 'it should die' do
    expect(self.monster).to eq(0)
  end
end

RSpec.configure { |c| c.include MonsterSteps, monster_steps: true }
