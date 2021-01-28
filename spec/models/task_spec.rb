require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { Task.create(description: 'Buy eggs') }

  context 'description is present' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'description is not present' do
    it 'is not valid' do
      subject.update(description: '')
      expect(subject).to_not be_valid
    end
  end

  context 'completed is false by default' do
    it 'is not completed' do
      expect(subject).to_not be_completed
    end
  end

  context 'can be completed' do
    it 'is completed' do
      subject.complete
      expect(subject).to be_completed
    end
  end

  context 'can be uncompleted' do
    it 'is completed' do
      subject.complete
      subject.uncomplete
      expect(subject).to_not be_completed
    end
  end
end
